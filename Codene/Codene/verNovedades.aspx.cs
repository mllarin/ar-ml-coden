using System;
using System.Collections.Generic;
using System.IO;
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
    public partial class verNovedades : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlInputFile File1;
        protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Cargo grilla con las Novedades
            string sError = "";
            try
            {
                if (!IsPostBack)
                {
                    formVer.Visible = false;
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

            nNovedad unaNovedadN = new nNovedad();
            sError = unaNovedadN.Buscar_Todos(ref dt);
            grdNovedades.DataSource = dt;
            grdNovedades.DataBind();

            return sError;
        }

        
        protected void grdNovedades_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Ver")
            {
                string sError = "";
                try
                {
                    if (int.Parse(e.CommandArgument.ToString()) > 0)
                    {
                        nNovedad unaNovedadN = new nNovedad();
                        oNovedad unaNovedadO = new oNovedad();
                        sError = unaNovedadN.Buscar_Uno(int.Parse(e.CommandArgument.ToString()), ref unaNovedadO);

                        hId.Value = unaNovedadO.id.ToString();
                        txtTituloVer.Text = unaNovedadO.titulo;
                        imgMuestraEditar.ImageUrl = "\\Novedad\\" + unaNovedadO.imagen;
                        txtCuerpoVer.Text = unaNovedadO.cuerpo;

                        formVer.Visible = true;



                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script type='text/javascript' language='javascript'> alert('" + sError + "');</script>");
                }
            }
        }

        protected void btnCerrarVer_Click(object sender, EventArgs e)
        {
            formVer.Visible = false;
        }

        
        

    }
}