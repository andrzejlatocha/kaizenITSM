using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.hd
{
    [Table("ActionFiles", Schema = "hd")]
    public class ActionFiles
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int ActionID { get; set; }
        public int FileID { get; set; }
        public string Status { get; set; }
    }
}
