﻿using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace kaizenITSM.Domain.Dtos.hd
{
    public class ActionNoteDto
    {
        public ActionNoteDto(int TicketID)
        {
            this.TicketID = TicketID;
            this.ActionTypeID = 2;
            this.Status = "A";
        }

        [Key]
        public int ID { get; set; }
        public int TicketID { get; set; }
        public int UserID { get; set; }
        public int ActionTypeID { get; set; }
        public string Information { get; set; }
        public DateTime Date { get; set; }
        public string Status { get; set; }
    }
}
