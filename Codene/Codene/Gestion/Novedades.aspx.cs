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

namespace Codene.Gestion
{
    public partial class Novedades : System.Web.UI.Page
    {

        static string imagen = "";
        static string imagenEditar = "";
        private static bool vioImagen = false;
        protected System.Web.UI.HtmlControls.HtmlInputFile File1;
        protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("login.aspx");

            // Cargo grilla con las Novedades
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

            nNovedad unaNovedadN = new nNovedad();
            sError = unaNovedadN.Buscar_Todos(ref dt);

            grdNovedades.DataSource = dt;
            grdNovedades.DataBind();

            return sError;
        }

        protected void fuImagen_Load(object sender, EventArgs e)
        {
            if (fuImagen.PostedFile != null)
            {
                imagen = fuImagen.PostedFile.FileName.Substring(fuImagen.PostedFile.FileName.LastIndexOf("\\") + 1);
            }
        }

        protected void btnVerImagen_Click(object sender, EventArgs e)
        {
            if (fuImagen.PostedFile != null)
            {
                HttpPostedFile myFile = fuImagen.PostedFile;
                if (myFile.FileName != null & myFile.FileName != "")
                {
                    int nFileLen = myFile.ContentLength;
                    // Allocate a buffer for reading of the file
                    // make sure the size of the file is > 0
                    if (nFileLen > 0)
                    {
                        byte[] myData = new byte[nFileLen];
                        myFile.InputStream.Read(myData, 0, nFileLen);

                        // Create a name for the file to store
                        string strFilename = "\\Novedades\\" + Path.GetFileName(myFile.FileName);

                        // Write data into a file
                        WriteToFile(Server.MapPath(strFilename), ref myData);
                        imgMuestra.ImageUrl = ".." + strFilename;
                        //imagen = strFilename.Substring(strFilename.LastIndexOf("\\") + 1);
                    }
                }

            }
            else
            {
                // No file

            }
        }

        // Writes file to current folder
        private void WriteToFile(string strPath, ref byte[] Buffer)
        {
            //Verificamos que existe la carpeta

            System.IO.Directory.CreateDirectory("\\Novedades\\"); 
            // Create a file
            FileStream newFile = new FileStream(strPath, FileMode.Create);

            // Write data to the file
            newFile.Write(Buffer, 0, Buffer.Length);

            // Close file
            newFile.Close();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (imagen != "")
            {
                // Create a name for the file to store
                HttpPostedFile myFile = fuImagen.PostedFile;

                if (!imagenExiste(imagen))
                {
                    if (myFile.FileName != null & myFile.FileName != "")
                    {
                        int nFileLen = myFile.ContentLength;
                        // Allocate a buffer for reading of the file
                        // make sure the size of the file is > 0
                        if (nFileLen > 0)
                        {
                            byte[] myData = new byte[nFileLen];
                            myFile.InputStream.Read(myData, 0, nFileLen);

                            // Create a name for the file to store
                            string strFilename = "\\Novedades\\" + Path.GetFileName(myFile.FileName);

                            // Write data into a file
                            WriteToFile(Server.MapPath(strFilename), ref myData);
                            imgMuestra.ImageUrl = ".." + strFilename;
                            //imagen = strFilename.Substring(strFilename.LastIndexOf("\\") + 1);
                        }
                    }

                    oNovedad unaNovedad = new oNovedad();
                    unaNovedad.titulo = txtTitulo.Text;
                    unaNovedad.imagen = imagen;
                    unaNovedad.cuerpo = txtCuerpo.Text;

                    nNovedad nNovedad = new nNovedad();
                    nNovedad.Alta(ref unaNovedad);

                    string sError = cargar_Grilla();
                }
            }
            else
            {
                Response.Write("<script type='text/javascript' language='javascript'> alert('La imagen seleccionada ya se encuentra cargada.');</script>");
            }
        }

        private bool imagenExiste(string imagen)
        {
            nNovedad unaNovedadN = new nNovedad();
            return unaNovedadN.Buscar_Uno(imagen);
        }

        protected void grdNovedades_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
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
                        txtTituloEditar.Text = unaNovedadO.titulo;
                        imgMuestraEditar.ImageUrl = unaNovedadO.imagen;
                        txtCuerpoEditar.Text = unaNovedadO.cuerpo;
                        formModificar.Visible = true;

                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script type='text/javascript' language='javascript'> alert('" + sError + "');</script>");
                }
            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    string sError = "";
                    if (int.Parse(e.CommandArgument.ToString()) > 0)
                    {
                        try
                        {
                            nNovedad unaNovedadN = new nNovedad();
                            oNovedad unaNovedadO = new oNovedad();
                            sError = unaNovedadN.Eliminar(e.CommandArgument.ToString());
                            cargar_Grilla();
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script type='text/javascript' language='javascript'> alert('" + ex.Message + "');</script>");
                        }
                    }
                }
            }
        }

        protected void btnCerrarEditar_Click(object sender, EventArgs e)
        {
            formModificar.Visible = false;
        }

        protected void btnVerImagenEditar_Click(object sender, EventArgs e)
        {
            //if (fuImagenEditar.PostedFile != null)
            //{
            HttpPostedFile myFile = fuImagenEditar.PostedFile;
            if (myFile.FileName != null & myFile.FileName != "")
            {
                int nFileLen = myFile.ContentLength;
                // Allocate a buffer for reading of the file
                // make sure the size of the file is > 0
                if (nFileLen > 0)
                {
                    byte[] myData = new byte[nFileLen];
                    myFile.InputStream.Read(myData, 0, nFileLen);

                    // Create a name for the file to store
                    string strFilename = "\\Novedad\\" + Path.GetFileName(myFile.FileName);

                    // Write data into a file
                    WriteToFile(Server.MapPath(strFilename), ref myData);
                    imgMuestraEditar.ImageUrl = ".." + strFilename;
                    //imagen = strFilename.Substring(strFilename.LastIndexOf("\\") + 1);
                    vioImagen = true;
                }
                //}

            }
            else
            {
                // No file

            }
        }
        protected void fuImagenEditar_Load(object sender, EventArgs e)
        {
            //HttpPostedFile myFile = Request.Files["fuEditar"];
            if (fuImagenEditar.PostedFile != null)
            {
                imagenEditar = fuImagenEditar.PostedFile.FileName.Substring(fuImagenEditar.PostedFile.FileName.LastIndexOf("\\") + 1);
            }
        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            oNovedad unaNovedadModif = new oNovedad();
            if (vioImagen)
                imagenEditar = imgMuestraEditar.ImageUrl.Substring(imgMuestraEditar.ImageUrl.LastIndexOf("\\") + 1);

            //btnVerImagenEditar_Click(sender, e);
            if (imagenEditar != "")
            {
                // Create a name for the file to store
                if (!vioImagen)
                {
                    HttpPostedFile myFile = fuImagenEditar.PostedFile;

                    if (myFile.FileName != null & myFile.FileName != "")
                    {
                        int nFileLen = myFile.ContentLength;
                        // Allocate a buffer for reading of the file
                        // make sure the size of the file is > 0
                        if (nFileLen > 0)
                        {
                            byte[] myData = new byte[nFileLen];
                            myFile.InputStream.Read(myData, 0, nFileLen);

                            // Create a name for the file to store
                            string strFilename = "\\Novedad\\" + Path.GetFileName(myFile.FileName);

                            // Write data into a file
                            WriteToFile(Server.MapPath(strFilename), ref myData);
                            imgMuestraEditar.ImageUrl = ".." + strFilename;
                            //imagen = strFilename.Substring(strFilename.LastIndexOf("\\") + 1);

                            unaNovedadModif.imagen = imagenEditar;
                        }
                    }
                }
                else
                {
                    unaNovedadModif.imagen = imagenEditar;
                }
            }

            unaNovedadModif.id = int.Parse(hId.Value.ToString());
            unaNovedadModif.titulo = txtTituloEditar.Text;
            unaNovedadModif.imagen = imagenEditar;
            unaNovedadModif.cuerpo = txtCuerpoEditar.Text;

            nNovedad nNovedad = new nNovedad();
            nNovedad.Modificar(unaNovedadModif);

            string sError = cargar_Grilla();

            formModificar.Visible = false;
            vioImagen = false;
        }

        

        
    }
}