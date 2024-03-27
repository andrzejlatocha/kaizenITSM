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
    public class PrioritiesController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public PrioritiesController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/Prioritiess
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Priorities>>> Select(string Status)
        {
            return await _context.Priorities.Where(w => w.Status == Status).ToListAsync();
        }

        // GET: api/Prioritiess/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Priorities>> Get(int id)
        {
            var priorities = await _context.Priorities.FindAsync(id);

            if (priorities == null)
            {
                return NotFound();
            }

            return priorities;
        }

        // PUT: api/Prioritiess/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Priorities priorities)
        {
            if (id != priorities.ID)
            {
                return BadRequest();
            }

            _context.Entry(priorities).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PrioritiesExists(id))
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

        // POST: api/Prioritiess
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Priorities>> Insert(Priorities priorities)
        {
            _context.Priorities.Add(priorities);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", new { id = priorities.ID }, priorities);
        }

        // DELETE: api/Prioritiess/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var priorities = await _context.Priorities.FindAsync(id);
            if (priorities == null)
            {
                return NotFound();
            }

            _context.Priorities.Remove(priorities);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PrioritiesExists(int id)
        {
            return _context.Priorities.Any(e => e.ID == id);
        }
    }
}
