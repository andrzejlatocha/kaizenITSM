using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.ViewModels.cmdb
{
    [Table("vObjectsDetailList", Schema = "cmdb")]
    public class ObjectsDetailViewModel
    {
        public ObjectsDetailViewModel()
        {
            ID = -1;
            Name = "";
            Type = "";
            Icon = @"images\object\empty_40.png";
        }

        public void ResetData()
        {
            ID = -1;
            Name = "";
            Type = "";
            Icon = @"images\object\empty_40.png";
        }

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
