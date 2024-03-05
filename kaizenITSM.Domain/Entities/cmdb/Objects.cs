using kaizenITSM.Domain.Common;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.Entities.cmdb
{
    [Table("Objects", Schema = "cmdb")]
    public class Objects : AuditableEntity
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public string? Name { get; set; }
        public int TypeOfObjectsID { get; set; }
    }
}
