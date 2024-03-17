﻿using kaizenITSM.Domain.Entities;
using kaizenITSM.Domain.Entities.cmdb;
using kaizenITSM.Domain.Entities.hd;
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
        public virtual DbSet<ActionFiles> ActionFiles { get; set; }
        public virtual DbSet<Actions> Actions { get; set; }
        public virtual DbSet<ActionUsers> ActionUsers { get; set; }
        public virtual DbSet<PrioritiesOfTicket> PrioritiesOfTicket { get; set; }
        public virtual DbSet<TicketAssignmentUsers> TicketAssignmentUsers { get; set; }
        public virtual DbSet<TicketFiles> TicketFiles { get; set; }
        public virtual DbSet<Tickets> Tickets { get; set; }
        public virtual DbSet<TicketsCategory> TicketsCategory { get; set; }
        public virtual DbSet<TicketsSource> TicketsSource { get; set; }
        public virtual DbSet<TicketStatusValues> TicketStatusValues { get; set; }
        public virtual DbSet<TypesOfTicket> TypesOfTicket { get; set; }
        
        public virtual DbSet<Files> Files { get; set; }

        public virtual DbSet<Objects> Objects { get; set; }


        // ViewModels
        public virtual DbSet<ObjectsHierarchyDetailViewModel> ObjectsHierarchyDetailViewModel { get; set; }
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
