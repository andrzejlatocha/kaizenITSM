using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.hd
{
    [Table("TicketAssignmentUsers", Schema = "hd")]
    public class TicketAssignmentUsers
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int TicketID { get; set; }
        public int UserID { get; set; }
        public string Disclaimer { get; set; }
        public string Status { get; set; }
    }
}
