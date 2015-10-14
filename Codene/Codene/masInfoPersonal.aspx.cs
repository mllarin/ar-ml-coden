using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Objetos;

namespace Codene
{
    public partial class masInfoPersonal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            nValor unValorN = new nValor();
            oValor unValorO = new oValor();

            string sError = unValorN.Buscar_Uno(ref unValorO);
            lblValorVerde.Text = unValorO.Verde.ToString();
        }
    }
}