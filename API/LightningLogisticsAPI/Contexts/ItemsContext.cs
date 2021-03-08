using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using LightningLogisticsAPI.Models;

namespace LightningLogisticsAPI.Contexts
{
    public class ItemsContext : DbContext
    {
        public DbSet<Item> Items { get; set; }
        public DbSet<Login> Auth { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
            => options.UseSqlite("Data Source=LightningLogistics.db");
    }
}
