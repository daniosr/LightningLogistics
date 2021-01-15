using System;
using System.Collections.Generic;

namespace LightningLogisticsAPI.Models
{
    public class Item
    {
        public int ItemID { get; set; }
        public string BTWD { get; set; }
        public string Reference { get; set; }
        public string SalesOrderReference { get; set; }
        public char End { get; set; }
        public int Weight { get; set; }
        public DateTime DateRecieved { get; set; }
        public string Location { get; set; }
        public string SubLocation { get; set; }
        public bool Delivered { get; set; }
        public DateTime DateDelivered { get; set; }
        public string JobReference { get; set; }
        public float Price { get; set; }
    }
}