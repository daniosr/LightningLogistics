using System;
using System.Collections.Generic;

namespace LightningLogisticsAPI.Models
{
    public class PostItem
    {
        public string BTWDRef { get; set; }
        public string SalesOrderReference { get; set; }
        public char End { get; set; }
        public int Weight { get; set; }
        public string Location { get; set; }
        public string SubLocation { get; set; }
        public float Price { get; set; }
    }
}