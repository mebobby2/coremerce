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
    public class ProductsdetailsController : ControllerBase
    {
        private readonly CoremerceContext _context;

        public ProductsdetailsController(CoremerceContext context)
        {
            _context = context;
        }

        // GET: api/Productsdetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Productsdetail>>> GetProductsdetail()
        {
            return await _context.Productsdetail.ToListAsync();
        }

        // GET: api/Productsdetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Productsdetail>> GetProductsdetail(Guid id)
        {
            var productsdetail = await _context.Productsdetail.FindAsync(id);

            if (productsdetail == null)
            {
                return NotFound();
            }

            return productsdetail;
        }

        // PUT: api/Productsdetails/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProductsdetail(Guid id, Productsdetail productsdetail)
        {
            if (id != productsdetail.Id)
            {
                return BadRequest();
            }

            _context.Entry(productsdetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductsdetailExists(id))
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

        // POST: api/Productsdetails
        [HttpPost]
        public async Task<ActionResult<Productsdetail>> PostProductsdetail(Productsdetail productsdetail)
        {
            _context.Productsdetail.Add(productsdetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProductsdetail", new { id = productsdetail.Id }, productsdetail);
        }

        // DELETE: api/Productsdetails/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Productsdetail>> DeleteProductsdetail(Guid id)
        {
            var productsdetail = await _context.Productsdetail.FindAsync(id);
            if (productsdetail == null)
            {
                return NotFound();
            }

            _context.Productsdetail.Remove(productsdetail);
            await _context.SaveChangesAsync();

            return productsdetail;
        }

        private bool ProductsdetailExists(Guid id)
        {
            return _context.Productsdetail.Any(e => e.Id == id);
        }
    }
}
