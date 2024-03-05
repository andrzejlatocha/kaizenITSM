using kaizenITSM.Api.Data;
using kaizenITSM.Domain.ViewModels.cmdb;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace kaizenITSM.Api.Controllers.cmdb
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ObjectPropertiesController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public ObjectPropertiesController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/ObjectProperties
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ObjectPropertiesViewModel>>> Select()
        {
            return await _context.ObjectPropertiesViewModel.ToListAsync();
        }

        // GET: api/ObjectProperties
        [HttpGet("{objectID}")]
        public async Task<ActionResult<IEnumerable<ObjectPropertiesViewModel>>> SelectByObject(int objectID)
        {
            return await _context.ObjectPropertiesViewModel.Where(w => w.ObjectID == objectID).ToListAsync();
        }
    }
}
