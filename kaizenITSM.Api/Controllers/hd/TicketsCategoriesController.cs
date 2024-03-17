using kaizenITSM.Api.Data;
using kaizenITSM.Domain.Entities.hd;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace kaizenITSM.Api.Controllers.hd
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class TicketsCategoriesController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public TicketsCategoriesController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/TicketsCategories
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TicketsCategory>>> GetTicketsCategory(string Status)
        {
            return await _context.TicketsCategory.Where(w => w.Status == Status || Status == "*").ToListAsync();
        }

        // GET: api/TicketsCategories/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TicketsCategory>> GetTicketsCategory(int id)
        {
            var ticketsCategory = await _context.TicketsCategory.FindAsync(id);

            if (ticketsCategory == null)
            {
                return NotFound();
            }

            return ticketsCategory;
        }

        // PUT: api/TicketsCategories/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTicketsCategory(int id, TicketsCategory ticketsCategory)
        {
            if (id != ticketsCategory.ID)
            {
                return BadRequest();
            }

            _context.Entry(ticketsCategory).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TicketsCategoryExists(id))
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

        // POST: api/TicketsCategories
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TicketsCategory>> PostTicketsCategory(TicketsCategory ticketsCategory)
        {
            _context.TicketsCategory.Add(ticketsCategory);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTicketsCategory", new { id = ticketsCategory.ID }, ticketsCategory);
        }

        // DELETE: api/TicketsCategories/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTicketsCategory(int id)
        {
            var ticketsCategory = await _context.TicketsCategory.FindAsync(id);
            if (ticketsCategory == null)
            {
                return NotFound();
            }

            _context.TicketsCategory.Remove(ticketsCategory);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TicketsCategoryExists(int id)
        {
            return _context.TicketsCategory.Any(e => e.ID == id);
        }
    }
}
