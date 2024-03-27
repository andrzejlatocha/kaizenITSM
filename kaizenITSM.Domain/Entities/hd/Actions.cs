using kaizenITSM.Domain.Common;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.hd
{
    [Table("Actions", Schema = "hd")]
    public class Actions : AuditableEntity
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int TicketID { get; set; }
        public int UserID { get; set; }
        public int ActionTypeID { get; set; }
        public string? Title { get; set; }
        public string Information { get; set; }
        public DateTime Date { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? FinishDate { get; set; }
        public int? GroupID { get; set; }
        public int? OwnerUserID { get; set; }
        public int? PriorityID { get; set; }
    }
}
