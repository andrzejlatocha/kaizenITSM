using kaizenITSM.Api.Data;
using kaizenITSM.Domain.Entities.hd;
using kaizenITSM.Domain.ViewModels.hd;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace kaizenITSM.Api.Controllers.hd
{
    [Route("api/[controller]/[action]")]
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
        public async Task<ActionResult<IEnumerable<Actions>>> Select(string Status)
        {
            return await _context.Actions.Where(w => w.Status == Status || Status == "*").ToListAsync();
        }

        // GET: api/Actions
        [HttpGet("{TicketID}")]
        public async Task<ActionResult<IEnumerable<ActionsViewModel>>> SelectByTicket(int TicketID, string Status)
        {
            return await _context.ActionsViewModel.Where(w => w.TicketID == TicketID && (w.Status == Status || Status == "*")).ToListAsync();
        }

        // GET: api/Actions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Actions>> Get(int id, CancellationToken cancellationToken)
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
        public async Task<IActionResult> Update(int id, Actions actions)
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
        public async Task<ActionResult<Actions>> Insert(Actions actions)
        {
            _context.Actions.Add(actions);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", new { id = actions.ID }, actions);
        }

        // DELETE: api/Actions/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
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
