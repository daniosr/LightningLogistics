﻿// <auto-generated />
using System;
using LightningLogisticsAPI.Contexts;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace LightningLogisticsAPI.Migrations
{
    [DbContext(typeof(ItemsContext))]
    partial class ItemsContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "5.0.2");

            modelBuilder.Entity("LightningLogisticsAPI.Models.Item", b =>
                {
                    b.Property<int>("ItemID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("BTWD")
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("DateDelivered")
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("DateRecieved")
                        .HasColumnType("TEXT");

                    b.Property<bool>("Delivered")
                        .HasColumnType("INTEGER");

                    b.Property<char>("End")
                        .HasColumnType("TEXT");

                    b.Property<string>("JobReference")
                        .HasColumnType("TEXT");

                    b.Property<string>("Location")
                        .HasColumnType("TEXT");

                    b.Property<float>("Price")
                        .HasColumnType("REAL");

                    b.Property<string>("Reference")
                        .HasColumnType("TEXT");

                    b.Property<string>("SalesOrderReference")
                        .HasColumnType("TEXT");

                    b.Property<string>("SubLocation")
                        .HasColumnType("TEXT");

                    b.Property<int>("Weight")
                        .HasColumnType("INTEGER");

                    b.HasKey("ItemID");

                    b.ToTable("Items");
                });
#pragma warning restore 612, 618
        }
    }
}