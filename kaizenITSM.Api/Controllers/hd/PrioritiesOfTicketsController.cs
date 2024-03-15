﻿using kaizenITSM.Api.Data;
using kaizenITSM.Domain.Entities.hd;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace kaizenITSM.Api.Controllers.hd
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrioritiesOfTicketsController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public PrioritiesOfTicketsController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/PrioritiesOfTickets
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PrioritiesOfTicket>>> GetPrioritiesOfTicket()
        {
            return await _context.PrioritiesOfTicket.ToListAsync();
        }

        // GET: api/PrioritiesOfTickets/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PrioritiesOfTicket>> GetPrioritiesOfTicket(int id)
        {
            var prioritiesOfTicket = await _context.PrioritiesOfTicket.FindAsync(id);

            if (prioritiesOfTicket == null)
            {
                return NotFound();
            }

            return prioritiesOfTicket;
        }

        // PUT: api/PrioritiesOfTickets/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPrioritiesOfTicket(int id, PrioritiesOfTicket prioritiesOfTicket)
        {
            if (id != prioritiesOfTicket.ID)
            {
                return BadRequest();
            }

            _context.Entry(prioritiesOfTicket).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PrioritiesOfTicketExists(id))
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

        // POST: api/PrioritiesOfTickets
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<PrioritiesOfTicket>> PostPrioritiesOfTicket(PrioritiesOfTicket prioritiesOfTicket)
        {
            _context.PrioritiesOfTicket.Add(prioritiesOfTicket);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPrioritiesOfTicket", new { id = prioritiesOfTicket.ID }, prioritiesOfTicket);
        }

        // DELETE: api/PrioritiesOfTickets/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePrioritiesOfTicket(int id)
        {
            var prioritiesOfTicket = await _context.PrioritiesOfTicket.FindAsync(id);
            if (prioritiesOfTicket == null)
            {
                return NotFound();
            }

            _context.PrioritiesOfTicket.Remove(prioritiesOfTicket);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PrioritiesOfTicketExists(int id)
        {
            return _context.PrioritiesOfTicket.Any(e => e.ID == id);
        }
    }
}