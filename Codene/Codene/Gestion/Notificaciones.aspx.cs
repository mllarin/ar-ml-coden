using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Objetos;
using Negocios;
using System.Data;

namespace Codene.Gestion
{
    public partial class Notificaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sError = cargar_Grilla();
        }

        private string cargar_Grilla()
        {
            string sError = "";

            DataTable dt = new DataTable();

            nNotificacion unaNotificacionN = new nNotificacion();
            sError = unaNotificacionN.BuscarTodas(ref dt);

            grdNotificaciones.DataSource = dt;
            grdNotificaciones.DataBind();

            return sError;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            oNotificacion unaNotificacion = new oNotificacion();
            unaNotificacion.Titulo = txtTitulo.Text;
            unaNotificacion.Descripcion = txtDescripcion.Text;
            nNotificacion unaNotificacionN = new nNotificacion();
            try
            {

                string sError = unaNotificacionN.Alta(ref unaNotificacion);

                if (sError != "")
                    throw new Exception(sError);

                txtTitulo.Text = "";
                txtDescripcion.Text = "";

                lblCorrecto.Visible = true;
                sError = cargar_Grilla();
            }
            catch (Exception ex)
            {
                lblCorrecto.Visible = false;
                Response.Write("<script type='text/javascript' language='javascript'> alert('" + ex.Message + "');</script>");
            }
        }
    }
}