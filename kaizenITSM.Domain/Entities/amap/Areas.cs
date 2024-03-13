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
    [Table("Servers", Schema = "amap")]
    public class Areas : AuditableEntity
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public string? Type { get; set; }
        public string? Version { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? StateOfServerID { get; set; }
    }
}
