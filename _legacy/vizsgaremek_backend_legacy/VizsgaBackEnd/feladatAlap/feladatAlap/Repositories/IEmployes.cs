using feladatAlap.Models;

namespace feladatAlap.Repositories
{
    public interface IEmployes
    {
        Task<List<Employe>> employe();
        Task<Employe> employeWithId(int id);
        Task<Employe> addEmploye(Employe employe);
    }
}
