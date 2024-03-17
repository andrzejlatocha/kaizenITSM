using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kaizenITSM.Domain.Enumerators.hd
{
    public class TicketTimeScopeEnumerator
    {
        public TicketTimeScopeEnumerator(int Scope, string Name)
        {
            this.Scope = Scope;
            this.Name = Name;
        }

        public int Scope { get; set; }
        public string Name { get; set; }
    }
}
