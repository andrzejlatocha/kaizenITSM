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
        public Guid? ObjectsHierarchyViewModelID { get; set; }
        public string? Name { get; set; }
        public string? Icon { get; set; }
        public int ObjectID { get; set; }
    }
}
