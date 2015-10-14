using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Objetos;
using Negocios;
using System.Data;
using System.Web.UI.HtmlControls;

namespace Codene
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AddBanners();
            }
        }
        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("ValidacionesIngreso.aspx?UserID=" + UserID.Text + "&Contrasenia=" + Contrasenia.Text, false);
            //Response.Write("<script>window.open('http://www.codene.com.ar/ValidacionesIngreso.aspx?UserID='" + UserID.Text + "'&Contrasenia='" + Contrasenia.Text + "','_blank');</script>");
            if (Session["Usuario"] != null)
            {

            }
        }

        private void AddBanners()
        {

            foreach (oBanner unBanner in carga_ListaBanners())
            {
                if (unBanner.columna.ToLower() == "izquierda")
                {
                    Image imgLeft = new Image();
                    Literal literal = new Literal();
                    literal.Text = "<div>";
                    slideContainer.Controls.Add(literal);

                    imgLeft.ID = "img" + unBanner.id;
                    imgLeft.ImageUrl = unBanner.imagen;
                    imgLeft.CssClass = "banner";
                    slideContainer.Controls.Add(imgLeft);

                    literal = new Literal();
                    literal.Text = "</div>";
                    slideContainer.Controls.Add(literal);
                    //pnlBannerLeft.Controls.Add(imgLeft);
                }
                //else
                //{
                //    Image imgRight = new Image();
                //    Literal literal = new Literal();
                //    literal.Text = "<a href='" + unBanner.link + "' border='0'>";
                //    pnlBannerRight.Controls.Add(literal);

                //    imgRight.ID = "img" + unBanner.id;
                //    imgRight.ImageUrl = unBanner.imagen;
                //    imgRight.CssClass = "banner";
                //    imgRight.Style.Add("width", "120px;");
                //    pnlBannerRight.Controls.Add(imgRight);

                //    literal = new Literal();
                //    literal.Text = "</a>";
                //    slideContainer.Controls.Add(literal);
                //}
            }
        }

        private List<oBanner> carga_ListaBanners()
        {

            List<oBanner> banners = new List<oBanner>();
            nBanner bannerN = new nBanner();
            DataTable dt = new DataTable();

            string sError = bannerN.Buscar_TodosInicio(ref dt);

            foreach (DataRow dr in dt.Rows)
            {
                oBanner unBanner = new oBanner();
                unBanner.id = Convert.ToInt32(dr["id"].ToString());
                unBanner.nombre = (dr["nombre"] == DBNull.Value ? "" : dr["nombre"].ToString());
                unBanner.imagen = (dr["imagen"] == DBNull.Value ? "" : dr["imagen"].ToString());
                unBanner.activo = (dr["activo"].ToString().ToLower() == "false" ? false : true);
                unBanner.columna = (dr["columna"] == DBNull.Value ? "" : dr["columna"].ToString());
                unBanner.link = (dr["link"] == DBNull.Value ? "" : dr["link"].ToString());

                banners.Add(unBanner);
            }

            return banners.Where(a => a.activo == true).ToList<oBanner>();

        }

    }
}