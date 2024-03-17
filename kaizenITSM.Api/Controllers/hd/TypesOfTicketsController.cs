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
    public class TypesOfTicketsController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public TypesOfTicketsController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/TypesOfTickets
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TypesOfTicket>>> Select(string Status)
        {
            return await _context.TypesOfTicket.Where(w => w.Status == Status || Status == "A").ToListAsync();
        }

        // GET: api/TypesOfTickets/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TypesOfTicket>> Get(int id)
        {
            var typesOfTicket = await _context.TypesOfTicket.FindAsync(id);

            if (typesOfTicket == null)
            {
                return NotFound();
            }

            return typesOfTicket;
        }

        // PUT: api/TypesOfTickets/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, TypesOfTicket typesOfTicket)
        {
            if (id != typesOfTicket.ID)
            {
                return BadRequest();
            }

            _context.Entry(typesOfTicket).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TypesOfTicketExists(id))
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

        // POST: api/TypesOfTickets
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TypesOfTicket>> Insert(TypesOfTicket typesOfTicket)
        {
            _context.TypesOfTicket.Add(typesOfTicket);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", new { id = typesOfTicket.ID }, typesOfTicket);
        }

        // DELETE: api/TypesOfTickets/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var typesOfTicket = await _context.TypesOfTicket.FindAsync(id);
            if (typesOfTicket == null)
            {
                return NotFound();
            }

            _context.TypesOfTicket.Remove(typesOfTicket);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TypesOfTicketExists(int id)
        {
            return _context.TypesOfTicket.Any(e => e.ID == id);
        }
    }
}
