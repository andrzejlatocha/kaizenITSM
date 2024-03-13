using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.hd
{
    [Table("Tickets", Schema = "hd")]
    public class Tickets
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public string Number { get; set; }
        public int TypeOfTicket { get; set; }
        public int PriorityOfTicketID { get; set; }
        public string Disclaimer { get; set; }
        public string Status { get; set; }
    }
}
