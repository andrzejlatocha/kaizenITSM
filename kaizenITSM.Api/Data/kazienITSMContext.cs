using Microsoft.EntityFrameworkCore;

namespace kaizenITSM.Api.Data
{
    public partial class kazienITSMContext : DbContext
    {
        public kazienITSMContext()
        {
        }

        public kazienITSMContext(DbContextOptions<kazienITSMContext> options) : base(options)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=kazienITSMConnection");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Polish_CI_AS");

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
