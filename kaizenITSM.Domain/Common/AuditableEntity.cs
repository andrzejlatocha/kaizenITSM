using System;
using System.Linq;

namespace kaizenITSM.Domain.Common
{
    public abstract class AuditableEntity
    {
        public string Status { get; set; } = "2";
        public DateTime? CreationDate { get; set; } = DateTime.Now;
        public int? CreationUserID { get; set; }
        public DateTime? ModifyingDate { get; set; } = DateTime.Now;
        public int? ModifyingUserID { get; set; }
        public bool? Deleted { get; set; } = false;
        public Guid? rowguid { get; set; } = Guid.NewGuid();
    }
}
