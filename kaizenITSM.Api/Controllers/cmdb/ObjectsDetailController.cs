using kaizenITSM.Api.Data;
using kaizenITSM.Domain.ViewModels.cmdb;
using Microsoft.AspNetCore.Mvc;

namespace kaizenITSM.Api.Controllers.cmdb
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ObjectsDetailController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public ObjectsDetailController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/ObjectsHierarchy
        [HttpGet("{ID}")]
        public async Task<ActionResult<ObjectsDetailViewModel>> Get(int ID)
        {
            return await _context.ObjectsDetailViewModel.FindAsync(ID);
        }
    }
}
