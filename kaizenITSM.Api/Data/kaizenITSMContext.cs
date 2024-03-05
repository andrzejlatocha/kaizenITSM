using kaizenITSM.Domain.Entities.cmdb;
using kaizenITSM.Domain.ViewModels.cmdb;
using Microsoft.EntityFrameworkCore;

namespace kaizenITSM.Api.Data
{
    public partial class kaizenITSMContext : DbContext
    {
        public kaizenITSMContext()
        {
        }

        public kaizenITSMContext(DbContextOptions<kaizenITSMContext> options) : base(options)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=kazienITSMConnection");
            }
        }

        //Entities
        public virtual DbSet<Objects> Objects { get; set; }

        // ViewModels
        public virtual DbSet<ObjectsHierarchyViewModel> ObjectsHierarchyViewModel { get; set; }
        public virtual DbSet<ObjectsDetailViewModel> ObjectsDetailViewModel { get; set; }
        public virtual DbSet<ObjectPropertiesViewModel> ObjectPropertiesViewModel { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Polish_CI_AS");

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
