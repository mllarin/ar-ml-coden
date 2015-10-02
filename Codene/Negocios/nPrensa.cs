using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Objetos;
using Datos;
using System.Data;

namespace Negocios
{
    public class nPrensa
    {
        Datos.dPrensa dPrensa = new dPrensa();

        public string Alta(ref oPrensa pE_Novedad)
        {
            return dPrensa.Alta(ref pE_Novedad);
        }

        public string Buscar_Todos(ref DataTable pS_dt)
        {
            return dPrensa.Buscar_Todos(ref pS_dt);
        }

        public string Buscar_TodosInicio(ref DataTable pS_dt)
        {
            return dPrensa.Buscar_TodosInicio(ref pS_dt);
        }

        public string Buscar_Uno(long pE_Id, ref oPrensa pS_Prensa)
        {
            return dPrensa.Buscar_Uno(pE_Id, ref pS_Prensa);
        }

        public string Modificar(oPrensa pE_Novedad)
        {
            return dPrensa.Modificar(pE_Novedad);
        }

        public Boolean Buscar_Uno(string pE_Documento)
        {
            return dPrensa.Buscar_Uno(pE_Documento);
        }

        public string Eliminar(string pE_Id)
        {
            return dPrensa.Eliminar(pE_Id);
        }
    }
}
