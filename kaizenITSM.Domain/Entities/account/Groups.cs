using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.account
{
    [Table("Groups", Schema = "identity")]
    public class Groups
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool IsEditing { get; set; }
        public bool Blocked { get; set; }
        public string Status { get; set; }
    }
}
