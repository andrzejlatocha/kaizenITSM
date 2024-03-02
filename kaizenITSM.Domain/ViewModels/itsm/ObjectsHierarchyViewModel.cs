﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kaizenITSM.Domain.ViewModels.itsm
{
    [Table("ObjectsHierarchyTree", Schema = "itsm")]
	
    public class ObjectsHierarchyViewModel
    {
		[Key]
        public Guid ID { get; set; }
        public Guid? ParentID { get; set; }
        public int Level { get; set; }
        public string? Name { get; set; }
        public string? Icon { get; set; }
        public int Groups { get; set; }
        public int ObjectID { get; set; }
    }
}