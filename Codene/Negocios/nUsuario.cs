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
    public class nUsuario
    {
        dUsuario dUsuario = new dUsuario();

        public string Alta(ref oUsuario pE_Usuario)
        {
            return dUsuario.Alta(ref pE_Usuario);
        }

        public string Buscar_Uno(long pE_Id, ref oUsuario pS_Usuario)
        {
            return dUsuario.Buscar_Uno(pE_Id, ref pS_Usuario);
        }

        public string Validar(ref oUsuario pS_Usuario)
        { 
            return dUsuario.Validar(ref pS_Usuario);
        }
    }
}
