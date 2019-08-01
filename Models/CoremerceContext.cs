using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace coremerce.Models
{
    public partial class CoremerceContext : DbContext
    {
        public CoremerceContext()
        {
        }

        public CoremerceContext(DbContextOptions<CoremerceContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Customers> Customers { get; set; }

// Code is commented because we are applying dependency injection inside startup.
//         protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//         {
//             if (!optionsBuilder.IsConfigured)
//             {
// #warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
//                 optionsBuilder.UseMySQL("server=localhost;port=3306;user=root;password=password11;database=Coremerce");
//             }
//         }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<Customers>(entity =>
            {
                entity.ToTable("Customers", "Coremerce");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)")
                    .ValueGeneratedNever();

                entity.Property(e => e.Dob)
                    .HasColumnName("dob")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasColumnName("email")
                    .HasMaxLength(110)
                    .IsUnicode(false);

                entity.Property(e => e.Fax)
                    .IsRequired()
                    .HasColumnName("fax")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Firstname)
                    .IsRequired()
                    .HasColumnName("firstname")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Gender)
                    .IsRequired()
                    .HasColumnName("gender")
                    .HasColumnType("char(1)");

                entity.Property(e => e.Lastname)
                    .IsRequired()
                    .HasColumnName("lastname")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Mainaddressid)
                    .HasColumnName("mainaddressid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Newsletteropted)
                    .HasColumnName("newsletteropted")
                    .HasColumnType("tinyint(4)");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasColumnName("password")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Telephone)
                    .IsRequired()
                    .HasColumnName("telephone")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });
        }
    }
}
