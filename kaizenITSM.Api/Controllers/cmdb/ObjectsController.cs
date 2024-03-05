using kaizenITSM.Api.Data;
using kaizenITSM.Domain.Entities.cmdb;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace kaizenITSM.Api.Controllers.cmdb
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ObjectsController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public ObjectsController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/Objects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Objects>>> GetObject()
        {
            return await _context.Objects.ToListAsync();
        }

        // GET: api/Objects/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Objects>> GetObjects(int id)
        {
            var objects = await _context.Objects.FindAsync(id);

            if (objects == null)
            {
                return NotFound();
            }

            return objects;
        }

        // PUT: api/Objects/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutObjects(int id, Objects objects)
        {
            if (id != objects.ID)
            {
                return BadRequest();
            }

            _context.Entry(objects).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ObjectsExists(id))
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

        // POST: api/Objects
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Objects>> PostObjects(Objects objects)
        {
            _context.Objects.Add(objects);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetObjects", new { id = objects.ID }, objects);
        }

        // DELETE: api/Objects/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteObjects(int id)
        {
            var objects = await _context.Objects.FindAsync(id);
            if (objects == null)
            {
                return NotFound();
            }

            _context.Objects.Remove(objects);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ObjectsExists(int id)
        {
            return _context.Objects.Any(e => e.ID == id);
        }
    }
}
