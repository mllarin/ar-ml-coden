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
    public class nBanner
    {
        dBanner dBanner = new dBanner();

        public string Alta(ref oBanner pE_Banner)
        {
            return dBanner.Alta(ref pE_Banner);
        }

        public string Buscar_Todos(ref DataTable pS_dt)
        {
            return dBanner.Buscar_Todos(ref pS_dt);
        }

        public string Buscar_TodosInicio(ref DataTable pS_dt)
        {
            return dBanner.Buscar_TodosInicio(ref pS_dt);
        }

        public string Buscar_Uno(long pE_Id, ref oBanner pS_Banner)
        {
            return dBanner.Buscar_Uno(pE_Id, ref pS_Banner);
        }

        public string Modificar(oBanner pE_Banner)
        {
            return dBanner.Modificar(pE_Banner);
        }

        public Boolean Buscar_Uno(string pE_Imagen)
        {
            return dBanner.Buscar_Uno(pE_Imagen);
        }
    }
}
