using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Objetos;
using Negocios;
using System.Data;

namespace Codene
{
    public partial class consumirNotificaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sError;

            if(Request["idUsuario"]==null)
            {
                Response.Write("<script type='text/javascript' language='javascript'> alert('" + "Necesita ingresar un usuario" + "');</script>");
            }
            formularioVer.Visible = false;
            sError = cargar_Grilla();
        }

        private string cargar_Grilla()
        {
            string sError = "";

            DataTable dt = new DataTable();

            nNotificacion unaNotificacionN = new nNotificacion();
            sError = unaNotificacionN.BuscarXUsuario(Request["idUsuario"], ref dt);

            grdNotificaciones.DataSource = dt;
            grdNotificaciones.DataBind();

            return sError;
        }


        //protected void grdNotificaciones_Load(object sender, EventArgs e)
        //{
        //    string sError = "";

        //    DataTable dt = new DataTable();
            
        //    nNotificacion notificaciones = new nNotificacion();
        //    sError = notificaciones.BuscarXUsuario(Request["idUsuario"] ,ref dt);

        //    grdNotificaciones.DataSource = dt;
        //    grdNotificaciones.DataBind();

            
            
        //}

        protected void grdNotificaciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {

                case "Ver":
                    {
                        String sError;

                        nNotificacion unaNotificacionN = new nNotificacion();
                        oNotificacion unaNotificacionO = new oNotificacion();
                        sError = unaNotificacionN.BuscarUna(int.Parse(e.CommandArgument.ToString()), ref unaNotificacionO);
                        //Marco la notificacion como leída
                        sError = unaNotificacionN.NotificarLeida(int.Parse(e.CommandArgument.ToString()), Request["idUsuario"]);
                        //Muestro la notificacion
                        hId.Value = unaNotificacionO.idNotificacion.ToString();
                        txtTituloVer.Text = unaNotificacionO.Titulo;
                        txtTituloVer.Text = unaNotificacionO.Descripcion;
                        formularioVer.Visible = true;

                        break;
                    }

               
            }

        }

        protected void btnCerrarVer_Click(object sender, EventArgs e)
        {
            formularioVer.Visible = false;
            
        }   

   
    }
    
}