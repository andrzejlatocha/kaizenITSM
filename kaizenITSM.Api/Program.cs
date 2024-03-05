using kaizenITSM.Api.Data;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

var builder = WebApplication.CreateBuilder(args);
var configuration = builder.Configuration;
var services = builder.Services;
var connectionString = builder.Configuration.GetConnectionString("kaizenITSMConnection");

// Add services to the container.

services.AddControllers();

services.AddDbContextPool<kaizenITSMContext>(options => options.UseSqlServer(connectionString));

services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
    .AddJwtBearer("Bearer", options =>
    {
        options.SaveToken = true;
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateLifetime = true,
            ValidateIssuer = false,
            ValidIssuer = configuration.GetSection("Jwt").GetValue<string>("Issuer"),
            ValidateAudience = false,
            ValidAudience = configuration.GetSection("Jwt").GetValue<string>("Audience"),
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration.GetSection("Jwt").GetValue<string>(key: "Key")))
        };
    });

services.AddEndpointsApiExplorer();

services.AddSwaggerGen(options =>
{
    options.ResolveConflictingActions(descriptions => descriptions.First());
    options.SwaggerDoc("v1", new OpenApiInfo
    {
        Version = "v1",
        Title = "kaizenITSM.Api",
        Description = "API dla aplikacji kaizenITSM"
    });

    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Type = SecuritySchemeType.Http,
        BearerFormat = "Jwt",
        In = ParameterLocation.Header,
        Scheme = "Bearer"
    });

    options.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            new List<string>()
        }
    });
});

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();

    app.UseDeveloperExceptionPage();
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();
