using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using coremerce.Models;

namespace coremerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly CoremerceContext _context;

        public OrdersController(CoremerceContext context)
        {
            _context = context;
        }

        // GET: api/Orders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Orders>>> GetOrders()
        {
            return await _context.Orders.ToListAsync();
        }

        // GET: api/Orders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Orders>> GetOrders(Guid id)
        {
            var orders = await _context.Orders.Include
                (o => o.OrdersProducts).SingleOrDefaultAsync(m => m.Id == id);

            if (orders == null)
            {
                return NotFound();
            }

            return orders;
        }

        // PUT: api/Orders/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOrders(Guid id, Orders orders)
        {
            if (id != orders.Id)
            {
                return BadRequest();
            }

            _context.Entry(orders).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrdersExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Orders
        [HttpPost]
        public async Task<ActionResult<Orders>> PostOrders(Orders orders)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            // Copy customer address to delivery address.
            orders.Deliverycity = orders.Customercity;
            orders.Deliverycountry = orders.Customercountry;
            orders.Deliverystreetaddress = orders.CustomerStreetaddress;
            orders.Deliverypostalcode = orders.Customerpostalcode;
            orders.Deliverystate = orders.Customerstate;


            if (orders.Customerid != null)
            {
                var customer = _context.Customers.SingleOrDefault(x => x.Id == orders.Customerid);
                if (customer != null)
                {
                    orders.Deliveryname = orders.Customername = customer.Firstname;
                    orders.Customeremail = customer.Email;
                    orders.Customertelephone = customer.Telephone;
                }
            }

            _context.Orders.Add(orders);
            try {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (OrdersExists(orders.Id))
                {
                    return new StatusCodeResult(StatusCodes.Status409Conflict);
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetOrders", new { id = orders.Id }, orders);
        }

        // DELETE: api/Orders/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Orders>> DeleteOrders(Guid id)
        {
            var orders = await _context.Orders.FindAsync(id);
            if (orders == null)
            {
                return NotFound();
            }

            _context.Orders.Remove(orders);
            await _context.SaveChangesAsync();

            return orders;
        }

        private bool OrdersExists(Guid id)
        {
            return _context.Orders.Any(e => e.Id == id);
        }
    }
}
