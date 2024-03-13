using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.hd
{
    [Table("TicketStatusValues", Schema = "hd")]
    public class TicketStatusValues
    {
        [Key]
        public string Status { get; set; }
        public string Disclaimer { get; set; }
    }
}
