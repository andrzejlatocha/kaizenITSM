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
    public class TicketsSourcesController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public TicketsSourcesController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/TicketsSources
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TicketsSource>>> Select(string Status)
        {
            return await _context.TicketsSource.Where(w => w.Status == Status || Status == "*").ToListAsync();
        }

        // GET: api/TicketsSources/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TicketsSource>> Get(int id)
        {
            var ticketsSource = await _context.TicketsSource.FindAsync(id);

            if (ticketsSource == null)
            {
                return NotFound();
            }

            return ticketsSource;
        }

        // PUT: api/TicketsSources/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, TicketsSource ticketsSource)
        {
            if (id != ticketsSource.ID)
            {
                return BadRequest();
            }

            _context.Entry(ticketsSource).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TicketsSourceExists(id))
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

        // POST: api/TicketsSources
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TicketsSource>> Insert(TicketsSource ticketsSource)
        {
            _context.TicketsSource.Add(ticketsSource);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", new { id = ticketsSource.ID }, ticketsSource);
        }

        // DELETE: api/TicketsSources/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var ticketsSource = await _context.TicketsSource.FindAsync(id);
            if (ticketsSource == null)
            {
                return NotFound();
            }

            _context.TicketsSource.Remove(ticketsSource);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TicketsSourceExists(int id)
        {
            return _context.TicketsSource.Any(e => e.ID == id);
        }
    }
}
