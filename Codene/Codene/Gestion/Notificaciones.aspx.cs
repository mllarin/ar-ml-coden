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
            if (Session["usuario"] == null)
                Response.Redirect("login.aspx");

            // Cargo grilla con las Notificaciones
            string sError = "";
            try
            {
                if (!IsPostBack)
                {
                    formModificar.Visible = false;
                    sError = cargar_Grilla();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script type='text/javascript' language='javascript'> alert('" + sError + "');</script>");
            }
        }

        private string cargar_Grilla()
        {
            string sError = "";

            DataTable dt = new DataTable();

            nNotificacion unaNotificacionN = new nNotificacion();
            sError = unaNotificacionN.Buscar_Todas(ref dt);

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

        protected void btnCerrarEditar_Click(object sender, EventArgs e)
        {
            formModificar.Visible = false;
        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            nNotificacion nNotif = new nNotificacion();
            nNotif.Modificar(long.Parse(hId.Value.ToString()), " ", txtCuerpoEditar.Text, true);

            string sError = cargar_Grilla();

            formModificar.Visible = false;
            
        }

        protected void grdNotificaciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string sError = "";
                try
                {
                    if (int.Parse(e.CommandArgument.ToString()) > 0)
                    {
                        nNotificacion unaNotificacionN = new nNotificacion();
                        oNotificacion unaNotificacionO = new oNotificacion();
                        sError = unaNotificacionN.BuscarUna(int.Parse(e.CommandArgument.ToString()), ref unaNotificacionO);

                        hId.Value = unaNotificacionO.idNotificacion.ToString();
                        txtTituloEditar.Text = unaNotificacionO.Titulo;
                        txtCuerpoEditar.Text = unaNotificacionO.Descripcion;
                        formModificar.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script type='text/javascript' language='javascript'> alert('" + sError + "');</script>");
                }
            }
            
        }
    }
}