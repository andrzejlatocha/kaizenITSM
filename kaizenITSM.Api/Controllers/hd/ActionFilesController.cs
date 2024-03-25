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
    public class ActionFilesController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public ActionFilesController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/ActionFiles
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ActionFiles>>> Select(string Status)
        {
            return await _context.ActionFiles.Where(w => w.Status == Status || Status == "*").ToListAsync();
        }

        // GET: api/ActionFiles
        [HttpGet("{ActionID}")]
        public async Task<ActionResult<IEnumerable<ActionFilesViewModel>>> SelectByAction(int ActionID, string Status)
        {
            return await _context.ActionFilesViewModel.Where(w => w.ActionID == ActionID && (w.Status == Status || Status == "*")).ToListAsync();
        }

        // GET: api/ActionFiles/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ActionFiles>> Get(int id)
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
        public async Task<IActionResult> Update(int id, ActionFiles actionFiles)
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
        public async Task<ActionResult<ActionFiles>> Insert(ActionFiles actionFiles)
        {
            _context.ActionFiles.Add(actionFiles);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", new { id = actionFiles.ID }, actionFiles);
        }

        // DELETE: api/ActionFiles/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
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
