﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.hd
{
    [Table("PrioritiesOfTicket", Schema = "hd")]
    public class PrioritiesOfTicket
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public string Description { get; set; }
        public string Icon { get; set; }
        public string Status { get; set; }
    }
}
