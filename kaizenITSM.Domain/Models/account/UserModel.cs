using System;
using System.Linq;

namespace kaizenITSM.Domain.Models.Account
{
    public class UserModel
    {
        public int ID { get; set; }
        public string LoginName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Description { get; set; }
        public string Email { get; set; }
        public string UserRoles { get; set; }
        public string Token { get; set; }
    }
}
