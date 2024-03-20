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
    public class TicketStatusValuesController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public TicketStatusValuesController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/TicketStatusValues
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TicketStatusValues>>> Select(string Status)
        {
            return await _context.TicketStatusValues.Where(w => w.Status == Status).ToListAsync();
        }

        // GET: api/TicketStatusValues/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TicketStatusValues>> Get(string id)
        {
            var ticketStatusValues = await _context.TicketStatusValues.FindAsync(id);

            if (ticketStatusValues == null)
            {
                return NotFound();
            }

            return ticketStatusValues;
        }

        // PUT: api/TicketStatusValues/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(string id, TicketStatusValues ticketStatusValues)
        {
            if (id != ticketStatusValues.Status)
            {
                return BadRequest();
            }

            _context.Entry(ticketStatusValues).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TicketStatusValuesExists(id))
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

        // POST: api/TicketStatusValues
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TicketStatusValues>> Insert(TicketStatusValues ticketStatusValues)
        {
            _context.TicketStatusValues.Add(ticketStatusValues);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TicketStatusValuesExists(ticketStatusValues.Status))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("Get", new { id = ticketStatusValues.Status }, ticketStatusValues);
        }

        // DELETE: api/TicketStatusValues/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(string id)
        {
            var ticketStatusValues = await _context.TicketStatusValues.FindAsync(id);
            if (ticketStatusValues == null)
            {
                return NotFound();
            }

            _context.TicketStatusValues.Remove(ticketStatusValues);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TicketStatusValuesExists(string id)
        {
            return _context.TicketStatusValues.Any(e => e.Status == id);
        }
    }
}
