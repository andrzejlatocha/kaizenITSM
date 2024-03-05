using kaizenITSM.Api.Data;
using kaizenITSM.Domain.ViewModels.cmdb;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace kaizenITSM.Api.Controllers.cmdb
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ObjectsHierarchyController : ControllerBase
    {
        private readonly kaizenITSMContext _context;

        public ObjectsHierarchyController(kaizenITSMContext context)
        {
            _context = context;
        }

        // GET: api/ObjectsHierarchy
        [HttpGet]
        public async Task<IEnumerable<ObjectsHierarchyViewModel>> Select()
        {
            var o = await _context.ObjectsHierarchyViewModel.ToListAsync();
            var result = o.Where(w => w.ObjectsHierarchyViewModelID == null);

            return result;
        }
    }
}
