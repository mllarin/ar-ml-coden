using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Codene
{
    public partial class consultaMisDatos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                string Mensaje = "<html><head><title></title></head><body style='text-align: center'><br /><div style='font-size: 12px; font-family: Segoe UI; width: 700px;'>" +
                                "<div style='text-align: left; padding-left: 10px; padding-top: 5px; font-size: 1.3em; font-weight: bold; position: relative; letter-spacing: 1px; color: #3e5667; background-color: #16a864; border-top-left-radius: 5px; border-top-right-radius: 5px;'>" +
                                "MENSAJE DE LA WEB: CONSULTA MIS DATOS</div><div align='left' style='color: #16a864; border-color: #16a864; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; padding: 5px; background-color: #e1e1e1; font-size: 1.1em;'>" +
                                "<div style='text-decoration: underline;'>La persona:</div><div>&nbsp;" + txtNombre.Text + "&nbsp;" + txtApellido.Text + ". Razón Social: " + txtRazonSocial.Text + ". DNI N° " + txtDocumento.Text + ". Sexo: " + ddlSexo.SelectedValue + "." +
                                "Nacionalidad: " + ddlNacionalidad.SelectedValue + ". Fecha de Nacimiento: " + txtFechaNacimientoHide.Text + "&nbsp;" +
                                "se contactó por medio del sitio www.codene.com.ar para realizar una consulta de datos y dejó la siguiente información:</div><br/><div style='border-top:solid 0.5px #ffffff; padding:2px;'></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Cédula / Pasaporte:</div><div style='display: inline-block;'>&nbsp;" + txtCedulaPasaporte.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Provincia:</div><div style='display: inline-block;'>&nbsp;" + ddlProvincia.SelectedValue + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Localidad:</div><div style='display: inline-block;'>&nbsp;" + txtLocalidad.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Código Postal:</div><div style='display: inline-block;'>&nbsp;" + txtCodigoPostal.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Calle:</div><div style='display: inline-block;'>&nbsp;" + txtCalle.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Teléfono 1:</div><div style='display: inline-block;'>&nbsp;" + txtTelefono1.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Número:</div><div style='display: inline-block;'>&nbsp;" + txtNumero.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Piso / Dpto:</div><div style='display: inline-block;'>&nbsp;" + txtPisoDpto.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Teléfono 1:</div><div style='display: inline-block;'>&nbsp;" + txtTelefono1.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Teléfono 2:</div><div style='display: inline-block;'>&nbsp;" + txtTelefono2.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Teléfono 3:</div><div style='display: inline-block;'>&nbsp;" + txtTelefono3.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Mail:</div><div style='display: inline-block;'>&nbsp;" + txtMail.Text + "&nbsp;</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Comentarios:</div><div style='display: inline-block;'>&nbsp;" + txtComentarios.Text + "</div></div>" +
                                "<div><br /><div align='center' style='text-align: center; background-image: url('images/Logo.png'); height: 50px; width: 180px; background-repeat: no-repeat;'></div></div></div></div>" +
                                "<div style='width: 700px; padding-top: 10px;' align='center'></div></body></html>";

                MailMessage oMsg;
                oMsg = new MailMessage("info@codene.com.ar", "codene@ciudad.com.ar");
                oMsg.Subject = " www.codene.com.ar - CONSULTA MIS DATOS ";

                oMsg.IsBodyHtml = true;
                oMsg.Body = Mensaje;


                SmtpClient smtpMail = new SmtpClient("us41.toservers.com");
                smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpMail.UseDefaultCredentials = true;

                NetworkCredential credenciales = new System.Net.NetworkCredential("info@codene.com.ar", "felisa55");
                smtpMail.Credentials = credenciales;
                //smtpMail.EnableSsl = true;
                smtpMail.Send(oMsg);


                //if (attach1 != null) File.Delete(Server.MapPath(attach1));
                oMsg = null;

                Response.Redirect("MensajeEnviadoConsultaDatos.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script type='text/javascript' language='javascript'> alert('Error en el envio del mensaje. " + ex.Message + "');</script>");
            }
        }
    }
}