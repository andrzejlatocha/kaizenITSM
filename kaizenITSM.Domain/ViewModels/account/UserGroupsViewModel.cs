using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.ViewModels.account
{
    [Keyless]
    [Table("vUserGroups", Schema = "identity")]
    public class UserGroupsViewModel
    {
        public int ID { get; set; }
        public int GroupID { get; set; }
        public string LoginName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string Status { get; set; }
    }
}
