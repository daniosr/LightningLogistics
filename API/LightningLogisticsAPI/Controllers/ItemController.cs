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

        [HttpGet]
        [Route("{id:int}")]
        public IEnumerable<Item> GetItem(int id)
        {
            Item[] item;
            using (var context = new ItemsContext())
            {
                item = context.Items.Where(x => x.ItemID == id).ToArray();
            }
            return item;
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

        // POST api/<ItemController>
        [HttpPost]
        public void Post([FromBody] PostItem postItem)
        {
            Item item = new Item()
            {
                BTWD = postItem.BTWDRef, //.Substring(0, 6),
                //Reference = postItem.BTWDRef.Substring(6),
                SalesOrderReference = postItem.SalesOrderReference,
                End = postItem.End,
                Weight = postItem.Weight,
                DateRecieved = DateTime.Today,
                Location = postItem.Location,
                SubLocation = postItem.SubLocation,
                Delivered = false,
                Price = postItem.Price
            };

            using (var context = new ItemsContext())
            {
                context.Items.Add(item);
                context.SaveChanges();
            }
        }
    }
}
