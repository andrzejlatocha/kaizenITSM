using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace kaizenITSM.Domain.Dtos.hd
{
    public class ActionTaskDto
    {
        public ActionTaskDto(int TicketID)
        {
            this.TicketID = TicketID;
            this.ActionTypeID = 4;
            this.Status = "A";
        }

        [Key]
        public int ID { get; set; }
        public int TicketID { get; set; }
        public int UserID { get; set; }
        public int ActionTypeID { get; set; }
        [Required]
        public string Title { get; set; }
        [Required]
        public string Information { get; set; }
        public DateTime Date { get; set; }
        [Required]
        public DateTime StartDate { get; set; }
        [Required]
        public DateTime FinishDate { get; set; }
        [Required]
        public int GroupID { get; set; }
        [Required]
        public int OwnerUserID { get; set; }
        [Required]
        public int PriorityID { get; set; }
        public string Status { get; set; }
    }
}
