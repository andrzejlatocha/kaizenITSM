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
        public int TypeOfTicketID { get; set; }
        public int PriorityOfTicketID { get; set; }
        public int TicketCategoryID { get; set; }
        public int TicketSourceID { get; set; }
        public DateTime Date { get; set; }
        public string Topic { get; set; }
        public string Disclaimer { get; set; }
        public string Status { get; set; }
    }
}
