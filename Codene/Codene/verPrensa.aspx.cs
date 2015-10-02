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
    public partial class verPrensa : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlInputFile File1;
        protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Cargo grilla con la Prensa
            string sError = "";
            try
            {
                if (!IsPostBack)
                {
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

            nPrensa unaPrensaN = new nPrensa();
            sError = unaPrensaN.Buscar_Todos(ref dt);
            grdPrensa.DataSource = dt;
            grdPrensa.DataBind();

            return sError;
        }

        
        protected void grdPrensa_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string sError = "";
            if (int.Parse(e.CommandArgument.ToString()) > 0)
            {
                try
                {
                    nPrensa unaPrensaN = new nPrensa();
                    oPrensa unaPrensaO = new oPrensa();
                    sError = unaPrensaN.Buscar_Uno(int.Parse(e.CommandArgument.ToString()), ref unaPrensaO);

                    System.Diagnostics.Process.Start(Server.MapPath(unaPrensaO.adjunto.Substring(1)));
                }
                catch (Exception ex)
                {
                    Response.Write("<script type='text/javascript' language='javascript'> alert('" + ex.Message + "');</script>");
                }
            }
        }

       

        
        

    }
}