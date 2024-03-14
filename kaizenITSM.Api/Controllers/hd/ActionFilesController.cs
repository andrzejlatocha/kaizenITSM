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
    public class ActionFilesController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public ActionFilesController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/ActionFiles
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ActionFiles>>> GetActionFiles()
        {
            return await _context.ActionFiles.ToListAsync();
        }

        // GET: api/ActionFiles/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ActionFiles>> GetActionFiles(int id)
        {
            var actionFiles = await _context.ActionFiles.FindAsync(id);

            if (actionFiles == null)
            {
                return NotFound();
            }

            return actionFiles;
        }

        // PUT: api/ActionFiles/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutActionFiles(int id, ActionFiles actionFiles)
        {
            if (id != actionFiles.ID)
            {
                return BadRequest();
            }

            _context.Entry(actionFiles).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ActionFilesExists(id))
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

        // POST: api/ActionFiles
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ActionFiles>> PostActionFiles(ActionFiles actionFiles)
        {
            _context.ActionFiles.Add(actionFiles);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetActionFiles", new { id = actionFiles.ID }, actionFiles);
        }

        // DELETE: api/ActionFiles/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteActionFiles(int id)
        {
            var actionFiles = await _context.ActionFiles.FindAsync(id);
            if (actionFiles == null)
            {
                return NotFound();
            }

            _context.ActionFiles.Remove(actionFiles);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ActionFilesExists(int id)
        {
            return _context.ActionFiles.Any(e => e.ID == id);
        }
    }
}
