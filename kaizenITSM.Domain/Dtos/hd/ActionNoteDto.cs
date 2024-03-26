using kaizenITSM.Domain.Common;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Dtos.hd
{
    [Table("Actions", Schema = "hd")]
    public class ActionNoteDto : AuditableEntity
    {
        public ActionNoteDto(int TicketID, int ActionTypeID)
        {
            this.TicketID = TicketID;
            this.ActionTypeID = ActionTypeID;
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int TicketID { get; set; }
        public int UserID { get; set; }
        public int ActionTypeID { get; set; }
        public string Information { get; set; }
        public DateTime Date { get; set; }
    }
}
