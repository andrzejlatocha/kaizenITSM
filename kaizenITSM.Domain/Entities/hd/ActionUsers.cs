using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.hd
{
    [Table("ActionUserss", Schema = "hd")]
    public class ActionUsers
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int ActionID { get; set; }
        public int UserID { get; set; }
        public string Status { get; set; }
    }
}
