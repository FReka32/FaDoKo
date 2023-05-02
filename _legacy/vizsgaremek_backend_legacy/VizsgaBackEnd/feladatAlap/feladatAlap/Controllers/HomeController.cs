using feladatAlap.Models;
using feladatAlap.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace feladatAlap.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private readonly IEmployes _context;

        public HomeController(IEmployes context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<List<Employe>> get()
        {
            return await _context.employe();
        }

        [HttpGet("{id}")]
        public async Task<Employe> getId(int id)
        {
            return await _context.employeWithId(id);
        }

        [HttpPost]
        public async Task<Employe> post(Employe employe)
        {
            return await _context.addEmploye(employe);
        }
    }
}
