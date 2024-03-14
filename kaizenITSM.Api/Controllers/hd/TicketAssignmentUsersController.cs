﻿using System;
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
    public class TicketAssignmentUsersController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public TicketAssignmentUsersController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/TicketAssignmentUsers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TicketAssignmentUsers>>> GetTicketAssignmentUsers()
        {
            return await _context.TicketAssignmentUsers.ToListAsync();
        }

        // GET: api/TicketAssignmentUsers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TicketAssignmentUsers>> GetTicketAssignmentUsers(int id)
        {
            var ticketAssignmentUsers = await _context.TicketAssignmentUsers.FindAsync(id);

            if (ticketAssignmentUsers == null)
            {
                return NotFound();
            }

            return ticketAssignmentUsers;
        }

        // PUT: api/TicketAssignmentUsers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTicketAssignmentUsers(int id, TicketAssignmentUsers ticketAssignmentUsers)
        {
            if (id != ticketAssignmentUsers.ID)
            {
                return BadRequest();
            }

            _context.Entry(ticketAssignmentUsers).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TicketAssignmentUsersExists(id))
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

        // POST: api/TicketAssignmentUsers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TicketAssignmentUsers>> PostTicketAssignmentUsers(TicketAssignmentUsers ticketAssignmentUsers)
        {
            _context.TicketAssignmentUsers.Add(ticketAssignmentUsers);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTicketAssignmentUsers", new { id = ticketAssignmentUsers.ID }, ticketAssignmentUsers);
        }

        // DELETE: api/TicketAssignmentUsers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTicketAssignmentUsers(int id)
        {
            var ticketAssignmentUsers = await _context.TicketAssignmentUsers.FindAsync(id);
            if (ticketAssignmentUsers == null)
            {
                return NotFound();
            }

            _context.TicketAssignmentUsers.Remove(ticketAssignmentUsers);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TicketAssignmentUsersExists(int id)
        {
            return _context.TicketAssignmentUsers.Any(e => e.ID == id);
        }
    }
}
