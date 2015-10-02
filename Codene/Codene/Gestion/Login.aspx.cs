using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Objetos;
using Negocios;

namespace Codene.Gestion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string sError = "";
            lblError.Text = "";
            
            if (txtUsuario.Text != "" && txtContrasenia.Text != "")
            {
            oUsuario oUsuario = new oUsuario();
            nUsuario nUsuario = new nUsuario();
            
                oUsuario.usuario = txtUsuario.Text;
                oUsuario.password = txtContrasenia.Text;

                sError = nUsuario.Validar(ref oUsuario);
                if (sError == "")
                {
                    Session["usuario"] = oUsuario;
                    Response.Redirect("default.aspx");                   
                }
                else
                {
                    lblError.Text = sError;
                }


            }
        }
    }
}