using System.ComponentModel.DataAnnotations;

namespace kaizenITSM.Domain.Models.Account
{
	public class LoginUserModel
	{
		[Required(AllowEmptyStrings = false, ErrorMessage = "Nazwa uzytkownika nie może byc pusta")]
		public string? LoginName { get; set; }
		[Required(AllowEmptyStrings = false, ErrorMessage = "Hasło nie może byc puste")]
		[DataType(DataType.Password)]
		public string Password { get; set; }
	}
}
