using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kaizenITSM.Domain.ViewModels.itsm
{
    [Table("ObjectPropertiesList", Schema = "itsm")]
    public class ObjectPropertiesViewModel
    {
        [Key]
        public int ID { get; set; }
        public int ObjectID { get; set; }
        public int ParameterTypeID { get; set; }
        public string? Value { get; set; }
        public string? Status { get; set; }
        public int TypeOfObjectID { get; set; }
        public string? Label { get; set; }
        public string? ValueType { get; set; }
        public string? Control { get; set; }
        public bool? Inherit { get; set; }
        public string? Category { get; set; }
        public string? Object { get; set; }
        public string? Source { get; set; }
    }
}
