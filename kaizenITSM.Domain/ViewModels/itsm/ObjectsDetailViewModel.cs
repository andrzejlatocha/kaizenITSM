using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kaizenITSM.Domain.ViewModels.itsm
{	
    [Table("ObjectsDetailList", Schema = "itsm")]
    public class ObjectsDetailViewModel
    {
        [Key]
        public int ID { get; set; }
        public string? Name { get; set; }
        public int TypeOfObjectID { get; set; }
        public string Type { get; set; }
        public string Icon { get; set; }
        public bool IsHardware { get; set; }
        public string? Status { get; set; }
    }
}
