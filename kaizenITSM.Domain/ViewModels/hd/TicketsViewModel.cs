using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.ViewModels.hd
{
    [Table("vTicketsList", Schema = "hd")]
    public class TicketsViewModel
    {
        [Key]
        public int ID { get; set; }
        public string? Number { get; set; }
        public int GroupID { get; set; }
        public int? UserID { get; set; }
        public string? User { get; set; }
        public int TypeOfTicketID { get; set; }
        public string TypeOfTicket { get; set; }
        public int PriorityID { get; set; }
        public string Priority { get; set; }
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
