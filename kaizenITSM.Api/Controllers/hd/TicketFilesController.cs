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
    public class TicketFilesController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public TicketFilesController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/TicketFiles
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TicketFiles>>> Select(string Status)
        {
            return await _context.TicketFiles.Where(w => w.Status == Status || Status == "*").ToListAsync();
        }

        // GET: api/TicketFiles
        [HttpGet("{TicketID}")]
        public async Task<ActionResult<IEnumerable<TicketFilesViewModel>>> SelectByTicket(int TicketID, string Status)
        {
            return await _context.TicketFilesViewModel.Where(w => w.TicketID == TicketID && (w.Status == Status || Status == "*")).ToListAsync();
        }

        // GET: api/TicketFiles/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TicketFiles>> Get(int id)
        {
            var ticketFiles = await _context.TicketFiles.FindAsync(id);

            if (ticketFiles == null)
            {
                return NotFound();
            }

            return ticketFiles;
        }

        // PUT: api/TicketFiles/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, TicketFiles ticketFiles)
        {
            if (id != ticketFiles.ID)
            {
                return BadRequest();
            }

            _context.Entry(ticketFiles).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TicketFilesExists(id))
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

        // POST: api/TicketFiles
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TicketFiles>> Insert(TicketFiles ticketFiles)
        {
            _context.TicketFiles.Add(ticketFiles);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", new { id = ticketFiles.ID }, ticketFiles);
        }

        // DELETE: api/TicketFiles/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var ticketFiles = await _context.TicketFiles.FindAsync(id);
            if (ticketFiles == null)
            {
                return NotFound();
            }

            _context.TicketFiles.Remove(ticketFiles);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TicketFilesExists(int id)
        {
            return _context.TicketFiles.Any(e => e.ID == id);
        }
    }
}
