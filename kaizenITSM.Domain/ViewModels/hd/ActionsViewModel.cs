using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.ViewModels.hd
{
    [Table("vActionsList", Schema = "hd")]
    public class ActionsViewModel
    {
        public Guid ID { get; set; }
        public int TicketID { get; set; }
        public int UserID { get; set; }
        public string User { get; set; }
        public int ActionTypeID { get; set; }
        public string ActionType { get; set; }
        public string Icon { get; set; }
        public string? Title { get; set; }
        public string Information { get; set; }
        public DateTime Date { get; set; }
        public string? DateDecription { get; set; }
        public string? DateGroup { get; set; }
        public string Status { get; set; }
        public string? Attachment { get; set; }
    }
}
