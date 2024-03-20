using kaizenITSM.Api.Data;
using kaizenITSM.Domain.Models.Account;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Diagnostics.CodeAnalysis;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace kaizenITSM.Api.Controllers.account
{
    [AllowAnonymous]
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly kaizenITSMContext _context;
        private readonly IConfiguration _configuration;
        private readonly ILogger _logger;

        public LoginController(kaizenITSMContext context, IConfiguration configuration, [NotNull] ILogger<LoginController> logger)
        {
            _context = context;
            _configuration = configuration;
            _logger = logger;
        }

        [HttpGet]
        [ApiConventionMethod(typeof(DefaultApiConventions), nameof(DefaultApiConventions.Get))]
        public ActionResult<UserModel> Get(string loginName, string password)
        {
            _logger.LogInformation($"LoginControler [Get] - parameters {loginName}");

            var user = Authenticate(loginName, password);

            if (user != null)
            {
                var token = GenerateToken(user);

                if (token != null)
                {
                    user.Token = token.ToString();
                    return user;
                }
                else
                {
                    _logger.LogInformation("User token is null");
                }
            }
            else
            {
                _logger.LogInformation("User authenticate object is null");
            }

            return Unauthorized();
        }

        private object? GenerateToken(UserModel userModel)
        {
            SymmetricSecurityKey? securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            SigningCredentials credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>();

            string[] roles = userModel.UserRoles.Split('|');

            foreach (var role in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }

            var token = new JwtSecurityToken(_configuration["Jwt:Issuer"], _configuration["Jwt:Audience"], claims,
              expires: DateTime.Now.AddMinutes(60), signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private UserModel? Authenticate(string loginName, string password)
        {
            try
            {
                IEnumerable<UserModel> user = _context.UserModel
                    .FromSqlRaw($"EXEC uspGetUzytkownik '{loginName}', '{password}'")
                    .AsEnumerable<UserModel>();

                if (user != null)
                {
                    if (user.Count() == 1)
                    {
                        return user.FirstOrDefault();
                    }
                    else
                    {
                        _logger.LogInformation("User exists more than one times");
                    }
                }
                else
                {
                    _logger.LogInformation("User object is null");
                }
            }
            catch (Exception ex)
            {
                _logger.LogError($"User authenticate error {ex.Message}");
            }

            return null;
        }
    }
}
