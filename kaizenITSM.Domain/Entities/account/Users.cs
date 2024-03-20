using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.account
{
    [Table("Users", Schema = "identity")]
    public class Users
    {
        [Key]
        public int ID { get; set; }
        public string LoginName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Description { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool IsNew { get; set; }
        public bool Blocked { get; set; }
        public bool IsEditing { get; set; }
        public string Status { get; set; }
    }
}
