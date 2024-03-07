using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.ViewModels.cmdb
{
    [Table("vObjectsHierarchyDetail", Schema = "cmdb")]
    public class ObjectsHierarchyDetailViewModel
    {
        [Key]
        public Guid ID { get; set; }
        public Guid? ParentID { get; set; }
        public string? Code { get; set; }
        public string? Name { get; set; }
        public string? Icon { get; set; }
        public string? TagNumber { get; set; }
        public string? ObjectState { get; set; }
        public int ObjectID { get; set; }
        public string Type { get; set; }
    }
}
