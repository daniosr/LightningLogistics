using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LightningLogisticsAPI.Contexts;
using LightningLogisticsAPI.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LightningLogisticsAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemController : ControllerBase
    {
        // GET: api/<ItemController>
        [HttpGet]
        public IEnumerable<Item> Get()
        {
            Item[] items;
            using (var context = new ItemsContext())
            {
                items = context.Items.ToArray();
            }
            return items;
        }

        [HttpGet("delivered")]
        public IEnumerable<Item> GetDelivered()
        {
            Item[] items;
            using (var context = new ItemsContext())
            {
                items = context.Items.Where(x => x.Delivered == true && DateTime.Today == x.DateDelivered.Date).ToArray();
            }
            return items;
        }

        [HttpGet("warehouse")]
        public IEnumerable<Item> GetInWarehouse()
        {
            Item[] items;
            using (var context = new ItemsContext())
            {
                items = context.Items.Where(x => x.Delivered == false).ToArray();
            }
            return items;
        }

        // GET api/<ItemController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ItemController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
            using (var context = new ItemsContext())
            {
                var item = new Item
                {
                    BTWD = "BTWD21",
                    Reference = "0012",
                    SalesOrderReference = "30778221",
                    End = 'Z',
                    Weight = 43,
                    DateRecieved = DateTime.Now,
                    Location = "FogW"
                };
                context.Items.Add(item);
                context.SaveChanges();
            }
        }

        // PUT api/<ItemController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ItemController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
