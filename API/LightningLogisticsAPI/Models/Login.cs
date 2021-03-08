using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LightningLogisticsAPI.Models
{
    public class Login
    {
        public int LoginID { get; set; }

        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }
    }
}