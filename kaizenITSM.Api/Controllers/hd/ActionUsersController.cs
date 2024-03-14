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
    public class ActionUsersController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public ActionUsersController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/ActionUsers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ActionUsers>>> GetActionUsers()
        {
            return await _context.ActionUsers.ToListAsync();
        }

        // GET: api/ActionUsers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ActionUsers>> GetActionUsers(int id)
        {
            var actionUsers = await _context.ActionUsers.FindAsync(id);

            if (actionUsers == null)
            {
                return NotFound();
            }

            return actionUsers;
        }

        // PUT: api/ActionUsers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutActionUsers(int id, ActionUsers actionUsers)
        {
            if (id != actionUsers.ID)
            {
                return BadRequest();
            }

            _context.Entry(actionUsers).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ActionUsersExists(id))
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

        // POST: api/ActionUsers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ActionUsers>> PostActionUsers(ActionUsers actionUsers)
        {
            _context.ActionUsers.Add(actionUsers);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetActionUsers", new { id = actionUsers.ID }, actionUsers);
        }

        // DELETE: api/ActionUsers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteActionUsers(int id)
        {
            var actionUsers = await _context.ActionUsers.FindAsync(id);
            if (actionUsers == null)
            {
                return NotFound();
            }

            _context.ActionUsers.Remove(actionUsers);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ActionUsersExists(int id)
        {
            return _context.ActionUsers.Any(e => e.ID == id);
        }
    }
}
