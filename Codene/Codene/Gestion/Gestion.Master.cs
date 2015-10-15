using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Codene.Gestion
{
    public partial class Gestion : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] != null)
                {
                    Objetos.oUsuario usuario = new Objetos.oUsuario();
                    usuario = (Objetos.oUsuario)Session["usuario"];
                    displayMenu.Visible = true;
                }
                else
                {
                    displayMenu.Visible = false;
                }
            }
        }
    }
}
