using System;
using System.Linq;

namespace kaizenITSM.Domain.Entities
{
    public class Files
    {
        public int ID { get; set; }
        public string Extension { get; set; }
        public string Name { get; set; }
        public string? Number { get; set; }
        public string? SystemNumber { get; set; }
        public string FileName { get; set; }
        public string Link { get; set; }
        public byte? Version { get; set; }
        public string? Description { get; set; }
    }
}
