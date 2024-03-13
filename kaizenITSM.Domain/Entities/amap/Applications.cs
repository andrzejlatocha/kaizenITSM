using kaizenITSM.Domain.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kaizenITSM.Domain.Entities.amap
{
    public class Applications : AuditableEntity
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int? AppliactionID { get; set; }
        public int? ServerID { get; set; }
        public int? DatabaseID { get; set; }
        public string? Name { get; set; }
        public string? Version { get; set; }
        public string? syaOpis { get; set; }
        public string? Description { get; set; }
        public string? Comment { get; set; }
        public int? DeveloperID { get; set; }
        public int? OwnerID { get; set; }
        public string? StateApplicationID { get; set; }
        public int? TechnologyID { get; set; }
    }
}
