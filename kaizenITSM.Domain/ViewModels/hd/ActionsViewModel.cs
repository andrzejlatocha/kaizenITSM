using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kaizenITSM.Domain.ViewModels.hd
{
    [Table("vActionsList", Schema = "hd")]
    public class ActionsViewModel
    {
        public int ID { get; set; }
        public int TicketID { get; set; }
        public int UserID { get; set; }
        public string User { get; set; }
        public int ActionTypeID { get; set; }
        public string ActionType { get; set; }
        public string Information { get; set; }
        public DateTime Date { get; set; }
        public string Status { get; set; }
    }
}
