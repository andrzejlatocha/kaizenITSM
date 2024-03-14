using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using kaizenITSM.Api.Data;
using kaizenITSM.Domain.Entities.hd;

namespace kaizenITSM.Api.Controllers.hd
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActionsController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public ActionsController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/Actions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Actions>>> GetActions()
        {
            return await _context.Actions.ToListAsync();
        }

        // GET: api/Actions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Actions>> GetActions(int id)
        {
            var actions = await _context.Actions.FindAsync(id);

            if (actions == null)
            {
                return NotFound();
            }

            return actions;
        }

        // PUT: api/Actions/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutActions(int id, Actions actions)
        {
            if (id != actions.ID)
            {
                return BadRequest();
            }

            _context.Entry(actions).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ActionsExists(id))
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

        // POST: api/Actions
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Actions>> PostActions(Actions actions)
        {
            _context.Actions.Add(actions);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetActions", new { id = actions.ID }, actions);
        }

        // DELETE: api/Actions/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteActions(int id)
        {
            var actions = await _context.Actions.FindAsync(id);
            if (actions == null)
            {
                return NotFound();
            }

            _context.Actions.Remove(actions);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ActionsExists(int id)
        {
            return _context.Actions.Any(e => e.ID == id);
        }
    }
}
