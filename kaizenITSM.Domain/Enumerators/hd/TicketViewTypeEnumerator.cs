using System;
using System.Linq;

namespace kaizenITSM.Domain.Enumerators.hd
{
    public class TicketViewTypeEnumerator
    {
        public TicketViewTypeEnumerator(int ID, string Icon, string Name)
        {
            this.ID = ID;
            this.Icon = Icon;
            this.Name = Name;
        }

        public int ID { get; set; }
        public string Icon { get; set; }
        public string Name { get; set; }
    }
}
