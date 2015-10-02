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
    public class nNovedad
    {
        Datos.dNovedad dNovedad = new dNovedad();

        public string Alta(ref oNovedad pE_Novedad)
        {
            return dNovedad.Alta(ref pE_Novedad);
        }

        public string Buscar_Todos(ref DataTable pS_dt)
        {
            return dNovedad.Buscar_Todos(ref pS_dt);
        }

        public string Buscar_TodosInicio(ref DataTable pS_dt)
        {
            return dNovedad.Buscar_TodosInicio(ref pS_dt);
        }

        public string Buscar_Uno(long pE_Id, ref oNovedad pS_Novedad)
        {
            return dNovedad.Buscar_Uno(pE_Id, ref pS_Novedad);
        }

        public string Modificar(oNovedad pE_Novedad)
        {
            return dNovedad.Modificar(pE_Novedad);
        }

        public Boolean Buscar_Uno(string pE_Imagen)
        {
            return dNovedad.Buscar_Uno(pE_Imagen);
        }

        public string Eliminar(string pE_Id)
        {
            return dNovedad.Eliminar(pE_Id);
        }
    }
}
