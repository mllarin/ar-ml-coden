using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Objetos;
using Negocios;
using System.Data;

namespace Codene
{
    /// <summary>
    /// Summary description for Notificaciones
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Notificaciones : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<oNotificacion> getNotificaciones(string usuario)
        {
            //string usuario = "mllarin";
            oNotificacion unaNotificacionO = new oNotificacion();
            List<oNotificacion> lstNotificaciones = new List<oNotificacion>();
            nNotificacion notificacionesN = new nNotificacion();
            DataTable dt = new DataTable();
            string sError = notificacionesN.BuscarXUsuario(usuario, ref dt);

            foreach (DataRow dr in dt.Rows)
            {
                unaNotificacionO = new oNotificacion();
                unaNotificacionO.idNotificacion = long.Parse(dr["idNotificacion"].ToString());
                unaNotificacionO.Titulo = dr["titulo"].ToString();
                unaNotificacionO.Descripcion = dr["descripcion"].ToString();

                lstNotificaciones.Add(unaNotificacionO);
            }

            return lstNotificaciones;
        }
    }
}
