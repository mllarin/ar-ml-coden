using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Objetos;
using Datos;

namespace Negocios
{
    public class nValor
    {
        dValor dValor = new dValor();

        public string Alta(ref oValor pE_Valor)
        {
            return dValor.Alta(ref pE_Valor);
        }

        public string Buscar_Uno(ref oValor pS_Valor)
        {
            return dValor.Buscar_Uno(ref pS_Valor);
        }
    }
}
