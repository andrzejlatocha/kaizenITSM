using kaizenITSM.Domain.Common;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.hd
{
    [Table("Tickets", Schema = "hd")]
    public class Tickets : AuditableEntity
    {
        public Tickets()
        {
            this.Date = DateTime.Now;
            this.PriorityOfTicketID = 4;
            this.Status = "A";
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public string? Number { get; set; }
        public int GroupID { get; set; }
        public int TypeOfTicketID { get; set; }
        public int PriorityOfTicketID { get; set; }
        public int TicketCategoryID { get; set; }
        public int TicketSourceID { get; set; }
        public DateTime Date { get; set; }
        public string Topic { get; set; }
        public string Disclaimer { get; set; }
        public DateTime? RequestedDate { get; set; }
        public DateTime? PlannedEndDate { get; set; }
    }
}
