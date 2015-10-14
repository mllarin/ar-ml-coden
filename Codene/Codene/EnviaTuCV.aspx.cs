<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

namespace Codene
{
    public partial class EnviaTuCV : System.Web.UI.Page
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
                                "MENSAJE DE LA WEB: ENVIÁ TU CV</div><div align='left' style='color: #16a864; border-color: #16a864; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; padding: 5px; background-color: #e1e1e1; font-size: 1.1em;'>" +
                                "<div style='height: 80px;'><div style='float: left; text-decoration: underline;'>La persona:</div><div style='float: left;'>&nbsp;" + txtNombre.Text + "&nbsp;" + txtApellido.Text + ". DNI N° " + txtDocumento.Text + ". Sexo: " + ddlSexo.SelectedValue + ". Fecha de Nacimiento: " + txtFechaNacimientoHide.Text + "&nbsp;" +
                                "se contactó por medio del sitio www.codene.com.ar y dejó su Curriculum con los siguientes datos:</div></div><div style='border-top:solid 0.5px #ffffff; padding:2px;'></div><div><div style='float: left; text-decoration: underline; display: inline-block;'>Teléfono 1:</div><div style='display: inline-block;'>&nbsp;" + txtTelefono1.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Teléfono 2:</div><div style='display: inline-block;'>&nbsp;" + txtTelefono2.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Teléfono 3:</div><div style='display: inline-block;'>&nbsp;" + txtTelefono3.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Mail:</div><div style='display: inline-block;'>&nbsp;" + txtMail.Text + "&nbsp;</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Último empleo:</div><div style='display: inline-block;'>&nbsp;" + txtUltimoEmpleo.Text + "</div></div>" +
                                "<div><br /><div align='center' style='text-align: center; background-image: url('images/Logo.png'); height: 50px; width: 180px; background-repeat: no-repeat;'></div></div></div></div>" +
                                "<div style='width: 700px; padding-top: 10px;' align='center'></div></body></html>";

                //string Mensaje = "<html><head><title></title></head><body style='text-align: center'><br /><div style='font-size: 12px; font-family: Segoe UI; width: 700px;'>" +
                //            "<div style='text-align:left;padding-top: 5px;font-size: 15px;font-weight: bold;position: relative;letter-spacing: 1px;color: #36791f;'>" +
                //            "CONTACTO DESDE LA WEB: DEJANOS TU CURRICULUM<div style='background-color: #d17001;height: 5px;width: 50%;margin-bottom: 5px;'></div></div>" +
                //            "<div align='left' style='color: #36791f; border-color: #36791f;border-radius: 5px; padding: 5px;'><div><div style='float: left;text-decoration:underline;'>La persona:" +
                //            "</div><div style='float: left;'>&nbsp;" + txtNombre.Text + "&nbsp;" + txtApellido.Text + "&nbsp;</div>" +
                //            "<div>se contactó por medio del sitio www.efectivamente.com.ar y dejó su Curriculum con los siguientes datos:</div></div><div><br />" +
                //            "<div style='float: left;text-decoration:underline;'>Mail:</div><div> &nbsp;" + txtMail.Text + "&nbsp;</div>" +
                //            "</div><div><div style='float: left;text-decoration:underline;'>Teléfono:</div><div>&nbsp;" + txtTelefono.Text + "</div>" +
                //            "</div><div><br /></div></div></div><div style='width: 700px; padding-top: 10px;' align='center'>" +
                //            "<div align='center' style='text-align: center; background-image: url('images/Logo191x75.png');height: 75px; width: 191px;'>" +
                //            "</div></div></body></html>";

                MailMessage oMsg;
                oMsg = new MailMessage("info@codene.com.ar", "codene@ciudad.com.ar");
                oMsg.Subject = " www.codene.com.ar - ENVIÁ TU CV ";

                oMsg.IsBodyHtml = true;
                oMsg.Body = Mensaje;

                string attach1 = null;

                //if (fuCurriculum.PostedFile != null)
                //{
                //    /* Get a reference to PostedFile object */
                //    HttpPostedFile attFile = fuCurriculum.PostedFile;
                //    /* Get size of the file */
                //    int attachFileLength = attFile.ContentLength;
                //    /* Make sure the size of the file is > 0  */
                //    if (attachFileLength > 0)
                //    {
                //        if (attachFileLength > 20000000) throw new Exception("El archivo no puede superar los 2 MB. Gracias!!!");

                //        /* Get the file name */
                //        string strFileName = Path.GetFileName(fuCurriculum.PostedFile.FileName);
                //        /* Save the file on the server */
                //        fuCurriculum.PostedFile.SaveAs(Server.MapPath(strFileName));
                //        /* Create the email attachment with the uploaded file */

                //        Attachment oAttch;
                //        oAttch = new Attachment(Server.MapPath(strFileName));
                //        oMsg.Attachments.Add(oAttch);

                //        attach1 = strFileName;
                //        oAttch = null;
                //    }
                //}


                ////string rutaOrigen = fuCurriculum.PostedFile.InputStream.ToString();

                ////Attachment oAttch;
                ////oAttch = new Attachment(rutaOrigen);
                ////oMsg.Attachments.Add(oAttch);

                SmtpClient smtpMail = new SmtpClient("us41.toservers.com");
                smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpMail.UseDefaultCredentials = true;

                NetworkCredential credenciales = new System.Net.NetworkCredential("info@codene.com.ar", "felisa55");
                smtpMail.Credentials = credenciales;
                //smtpMail.EnableSsl = true;
                smtpMail.Send(oMsg);


                //if (attach1 != null) File.Delete(Server.MapPath(attach1));
                oMsg = null;

                Response.Redirect("MensajeEnviadoCV.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script type='text/javascript' language='javascript'> alert('Error en el envio del mensaje. " + ex.Message + "');</script>");
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            try
            {
                //Get the HttpFileCollection  
                HttpFileCollection hfcollection = Request.Files;
                HttpPostedFile hpostedfile = hfcollection[0];
                if (hpostedfile.ContentLength > 0)
                {
                    //Upload/save to the server  
                    hpostedfile.SaveAs(Server.MapPath(Path.GetFileName(hpostedfile.FileName)));

                    //Report the file was uploaded - you can customize this part -  
                    Response.Write((("<b>El archivo: </b>" + hpostedfile.FileName + " <b>tamaño:</b> ") + hpostedfile.ContentLength + " <b>Type:</b> ") + hpostedfile.ContentType + " se adjunto correctamente <br/>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script type='text/javascript' language='javascript'> alert('Error al adjuntar el archivo. " + ex.Message + "');</script>");
            }
        }
    }
=======
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

namespace Codene
{
    public partial class EnviaTuCV : System.Web.UI.Page
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
                                "MENSAJE DE LA WEB: ENVIÁ TU CV</div><div align='left' style='color: #16a864; border-color: #16a864; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; padding: 5px; background-color: #e1e1e1; font-size: 1.1em;'>" +
                                "<div style='height: 80px;'><div style='float: left; text-decoration: underline;'>La persona:</div><div style='float: left;'>&nbsp;" + txtNombre.Text + "&nbsp;" + txtApellido.Text + ". DNI N° " + txtDocumento.Text + ". Sexo: " + ddlSexo.SelectedValue + ". Fecha de Nacimiento: " + txtFechaNacimientoHide.Text + "&nbsp;" +
                                "se contactó por medio del sitio www.codene.com.ar y dejó su Curriculum con los siguientes datos:</div></div><div style='border-top:solid 0.5px #ffffff; padding:2px;'></div><div><div style='float: left; text-decoration: underline; display: inline-block;'>Teléfono 1:</div><div style='display: inline-block;'>&nbsp;" + txtTelefono1.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Teléfono 2:</div><div style='display: inline-block;'>&nbsp;" + txtTelefono2.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Teléfono 3:</div><div style='display: inline-block;'>&nbsp;" + txtTelefono3.Text + "</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Mail:</div><div style='display: inline-block;'>&nbsp;" + txtMail.Text + "&nbsp;</div></div>" +
                                "<div><div style='float: left; text-decoration: underline; display: inline-block;'>Último empleo:</div><div style='display: inline-block;'>&nbsp;" + txtUltimoEmpleo.Text + "</div></div>" +
                                "<div><br /><div align='center' style='text-align: center; background-image: url('images/Logo.png'); height: 50px; width: 180px; background-repeat: no-repeat;'></div></div></div></div>" +
                                "<div style='width: 700px; padding-top: 10px;' align='center'></div></body></html>";

                //string Mensaje = "<html><head><title></title></head><body style='text-align: center'><br /><div style='font-size: 12px; font-family: Segoe UI; width: 700px;'>" +
                //            "<div style='text-align:left;padding-top: 5px;font-size: 15px;font-weight: bold;position: relative;letter-spacing: 1px;color: #36791f;'>" +
                //            "CONTACTO DESDE LA WEB: DEJANOS TU CURRICULUM<div style='background-color: #d17001;height: 5px;width: 50%;margin-bottom: 5px;'></div></div>" +
                //            "<div align='left' style='color: #36791f; border-color: #36791f;border-radius: 5px; padding: 5px;'><div><div style='float: left;text-decoration:underline;'>La persona:" +
                //            "</div><div style='float: left;'>&nbsp;" + txtNombre.Text + "&nbsp;" + txtApellido.Text + "&nbsp;</div>" +
                //            "<div>se contactó por medio del sitio www.efectivamente.com.ar y dejó su Curriculum con los siguientes datos:</div></div><div><br />" +
                //            "<div style='float: left;text-decoration:underline;'>Mail:</div><div> &nbsp;" + txtMail.Text + "&nbsp;</div>" +
                //            "</div><div><div style='float: left;text-decoration:underline;'>Teléfono:</div><div>&nbsp;" + txtTelefono.Text + "</div>" +
                //            "</div><div><br /></div></div></div><div style='width: 700px; padding-top: 10px;' align='center'>" +
                //            "<div align='center' style='text-align: center; background-image: url('images/Logo191x75.png');height: 75px; width: 191px;'>" +
                //            "</div></div></body></html>";

                MailMessage oMsg;
                oMsg = new MailMessage("cv@codene.com.ar", "codene@ciudad.com.ar");
                oMsg.Subject = " www.codene.com.ar - ENVIÁ TU CV ";

                oMsg.IsBodyHtml = true;
                oMsg.Body = Mensaje;

                string attach1 = null;

                //if (fuCurriculum.PostedFile != null)
                //{
                //    /* Get a reference to PostedFile object */
                //    HttpPostedFile attFile = fuCurriculum.PostedFile;
                //    /* Get size of the file */
                //    int attachFileLength = attFile.ContentLength;
                //    /* Make sure the size of the file is > 0  */
                //    if (attachFileLength > 0)
                //    {
                //        if (attachFileLength > 20000000) throw new Exception("El archivo no puede superar los 2 MB. Gracias!!!");

                //        /* Get the file name */
                //        string strFileName = Path.GetFileName(fuCurriculum.PostedFile.FileName);
                //        /* Save the file on the server */
                //        fuCurriculum.PostedFile.SaveAs(Server.MapPath(strFileName));
                //        /* Create the email attachment with the uploaded file */

                //        Attachment oAttch;
                //        oAttch = new Attachment(Server.MapPath(strFileName));
                //        oMsg.Attachments.Add(oAttch);

                //        attach1 = strFileName;
                //        oAttch = null;
                //    }
                //}


                ////string rutaOrigen = fuCurriculum.PostedFile.InputStream.ToString();

                ////Attachment oAttch;
                ////oAttch = new Attachment(rutaOrigen);
                ////oMsg.Attachments.Add(oAttch);

                SmtpClient smtpMail = new SmtpClient("190.210.9.202");
                smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpMail.UseDefaultCredentials = true;

                NetworkCredential credenciales = new System.Net.NetworkCredential("cv@codene.com.ar", "delta2000");
                smtpMail.Credentials = credenciales;
                //smtpMail.EnableSsl = true;
                smtpMail.Send(oMsg);


                //if (attach1 != null) File.Delete(Server.MapPath(attach1));
                oMsg = null;

                Response.Redirect("MensajeEnviadoCV.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script type='text/javascript' language='javascript'> alert('Error en el envio del mensaje. " + ex.Message + "');</script>");
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            try
            {
                //Get the HttpFileCollection  
                HttpFileCollection hfcollection = Request.Files;
                HttpPostedFile hpostedfile = hfcollection[0];
                if (hpostedfile.ContentLength > 0)
                {
                    //Upload/save to the server  
                    hpostedfile.SaveAs(Server.MapPath(Path.GetFileName(hpostedfile.FileName)));

                    //Report the file was uploaded - you can customize this part -  
                    Response.Write((("<b>El archivo: </b>" + hpostedfile.FileName + " <b>tamaño:</b> ") + hpostedfile.ContentLength + " <b>Type:</b> ") + hpostedfile.ContentType + " se adjunto correctamente <br/>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script type='text/javascript' language='javascript'> alert('Error al adjuntar el archivo. " + ex.Message + "');</script>");
            }
        }
    }
>>>>>>> refs/remotes/origin/mllarin
}