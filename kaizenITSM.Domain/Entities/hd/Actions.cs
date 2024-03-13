using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.hd
{
    [Table("Actions", Schema = "hd")]
    public class Actions
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int ActionID { get; set; }
        public int TicketID { get; set; }
        public int UserID { get; set; }
        public int ActionType { get; set; }
        public string Information { get; set; }
        public DateTime Date { get; set; }
        public string Status { get; set; }
    }
}
