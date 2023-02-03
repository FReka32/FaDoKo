using feladatAlap.Models;
using feladatAlap.Repositories;

namespace feladatAlap.Services
{
    public class SEmploye : IEmployes
    {
        static List<Employe> lista = new List<Employe>();
        public void upload()
        {
            Employe e = new Employe();
            e.id = 1;
            e.name = "Zoli";
            e.age = 33;
            e.description = "tanuló";

            Employe e1 = new Employe();
            e1.id = 2;
            e1.name = "Ilona";
            e1.age = 33;
            e1.description = "tanuló";

            Employe e2 = new Employe();
            e2.id = 3;
            e2.name = "Éva";
            e2.age = 33;
            e2.description = "tanár";

            lista.Add(e);
            lista.Add(e1);
            lista.Add(e2);
        }
        public async Task<List<Employe>> employe()
        {
            upload();
            return lista;
        }

        public async Task<Employe> employeWithId(int id)
        {
            upload();
            int azon = 0;
            for (int i = 0; i < lista.Count; i++)
            {
                if (lista[i].id == id)
                {
                    azon = i;
                    break;
                }
            }
            return lista[azon];
        }

        public async Task<Employe> addEmploye(Employe employe)
        {
            lista.Add(employe);
            return employe;
        }
    }
}
