using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kaizenITSM.Domain.ViewModels.hd
{
    [Table("vTicketDetails", Schema = "hd")]
    public class TicketDetailsViewModel
    {
        [Key]
        public int ID { get; set; }
        public string? Number { get; set; }
        public int GroupID { get; set; }
        public int? UserID { get; set; }
        public string? User { get; set; }
        public int TypeOfTicketID { get; set; }
        public string TypeOfTicket { get; set; }
        public int PriorityOfTicketID { get; set; }
        public string PriorityOfTicket { get; set; }
        public int TicketCategoryID { get; set; }
        public string TicketCategory { get; set; }
        public string Icon { get; set; }
        public int TicketSourceID { get; set; }
        public string TicketSource { get; set; }
        public DateTime Date { get; set; }
        public string Topic { get; set; }
        public string Status { get; set; }
        public string StatusDisclaimer { get; set; }
        public int AssignmentUsersID { get; set; }
        public string Attachment { get; set; }
        public string? AssignmentUsers { get; set; }
        public DateTime? CloseDate { get; set; }
    }
}
