using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace kaizenITSM.Domain.ViewModels.hd
{
    [Table("vTicketFilesList", Schema = "hd")]
    public class TicketFilesViewModel
    {
        [Key]
        public int ID { get; set; }
        public int TicketID { get; set; }
        public string Extension { get; set; }
        public string? Name { get; set; }
        public string FileName { get; set; }
        public string Link { get; set; }
        public string? Description { get; set; }
        public string Status { get; set; }
    }
}
