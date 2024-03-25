using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kaizenITSM.Domain.Enumerators.hd
{
    public class TicketDetailsMenu
    {
        public TicketDetailsMenu(int ID, string Title)
        {
            this.ID = ID;
            this.Title = Title;
        }

        public int ID { get; set; }
        public string Title { get; set; }
    }
}
