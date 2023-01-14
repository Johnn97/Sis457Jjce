using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace FinalSis457jjce.Models;

public partial class FinalSis457jjceContext : DbContext
{
    public FinalSis457jjceContext()
    {
    }

    public FinalSis457jjceContext(DbContextOptions<FinalSis457jjceContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Serie> Series { get; set; }

    public virtual DbSet<Usuario> Usuarios { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
     //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
     //        => optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=FinalSis457jjce;User ID=usrfinal;Password=12345678");
            }
        }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Serie>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Serie__3213E83FDA36179C");

            entity.ToTable("Serie");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Director)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("director");
            entity.Property(e => e.Duracion).HasColumnName("duracion");
            entity.Property(e => e.FechaEstreno)
                .HasColumnType("date")
                .HasColumnName("fechaEstreno");
            entity.Property(e => e.RegistroActivo)
                .HasDefaultValueSql("((1))")
                .HasColumnName("registroActivo");
            entity.Property(e => e.Sinopsis)
                .HasMaxLength(5000)
                .IsUnicode(false)
                .HasColumnName("sinopsis");
            entity.Property(e => e.Titulo)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("titulo");
            entity.Property(e => e.UsuarioRegistro)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_name())")
                .HasColumnName("usuarioRegistro");
        });

        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Usuario__3213E83F321A23E5");

            entity.ToTable("Usuario");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Clave)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("clave");
            entity.Property(e => e.RegistroActivo)
                .HasDefaultValueSql("((1))")
                .HasColumnName("registroActivo");
            entity.Property(e => e.Rol)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("rol");
            entity.Property(e => e.Usuario1)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("usuario");
            entity.Property(e => e.UsuarioRegistro)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_name())")
                .HasColumnName("usuarioRegistro");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
