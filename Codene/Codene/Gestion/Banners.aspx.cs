<<<<<<< HEAD
﻿using System;
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
    public partial class Banners : System.Web.UI.Page
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

            // Cargo grilla con los banners
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

            nBanner unBannerN = new nBanner();
            sError = unBannerN.Buscar_Todos(ref dt);

            grdBanners.DataSource = dt;
            grdBanners.DataBind();

            return sError;
        }

        protected void fuImagen_Load(object sender, EventArgs e)
        {
            if (fuImagen.PostedFile != null)
            {
                //imagen = fuImagen.PostedFile.FileName;
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
                        string strFilename = "\\Banners\\" + Path.GetFileName(myFile.FileName);

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
                            string strFilename = "\\Banners\\" + Path.GetFileName(myFile.FileName);

                            // Write data into a file
                            WriteToFile(Server.MapPath(strFilename), ref myData);
                            imgMuestra.ImageUrl = ".." + strFilename;
                            //imagen = strFilename.Substring(strFilename.LastIndexOf("\\") + 1);
                        }
                    }

                    oBanner unBanner = new oBanner();
                    unBanner.nombre = txtNombre.Text;
                    unBanner.imagen = imagen;
                    unBanner.columna = ddlColumna.SelectedValue;
                    unBanner.activo = chkActivo.Checked;
                    unBanner.link = txtLink.Text;

                    nBanner nBanner = new nBanner();
                    nBanner.Alta(ref unBanner);

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
            nBanner unBannerN = new nBanner();
            return unBannerN.Buscar_Uno(imagen);
        }

        protected void grdBanners_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string sError = "";
                try
                {
                    if (int.Parse(e.CommandArgument.ToString()) > 0)
                    {
                        nBanner unBannerN = new nBanner();
                        oBanner unBannerO = new oBanner();
                        sError = unBannerN.Buscar_Uno(int.Parse(e.CommandArgument.ToString()), ref unBannerO);

                        hId.Value = unBannerO.id.ToString();
                        txtNombreEditar.Text = unBannerO.nombre;
                        imgMuestraEditar.ImageUrl = unBannerO.imagen;
                        chkActivoEditar.Checked = unBannerO.activo;
                        ddlColumnaEditar.SelectedValue = unBannerO.columna;
                        txtLinkEditar.Text = unBannerO.link;

                        formModificar.Visible = true;

                        //HtmlGenericControl formModificar = new HtmlGenericControl("formModificar");
                        //formModificar.FindControl("");

                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script type='text/javascript' language='javascript'> alert('" + sError + "');</script>");
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
                    string strFilename = "\\Banners\\" + Path.GetFileName(myFile.FileName);

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
            oBanner unBannerModificar = new oBanner();
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
                            string strFilename = "\\Banners\\" + Path.GetFileName(myFile.FileName);

                            // Write data into a file
                            WriteToFile(Server.MapPath(strFilename), ref myData);
                            imgMuestraEditar.ImageUrl = ".." + strFilename;
                            //imagen = strFilename.Substring(strFilename.LastIndexOf("\\") + 1);

                            unBannerModificar.imagen = imagenEditar;
                        }
                    }
                }
                else
                {
                    unBannerModificar.imagen = imagenEditar;
                }
            }

            unBannerModificar.id = int.Parse(hId.Value.ToString());
            unBannerModificar.nombre = txtNombreEditar.Text;
            unBannerModificar.columna = ddlColumnaEditar.SelectedValue;
            unBannerModificar.imagen = imagenEditar;
            unBannerModificar.activo = chkActivoEditar.Checked;

            nBanner nBanner = new nBanner();
            nBanner.Modificar(unBannerModificar);

            string sError = cargar_Grilla();

            formModificar.Visible = false;
            vioImagen = false;
        }

        protected void ddlColumna_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlColumna.SelectedValue == "I")
                divLink.Visible = false;
            else
                divLink.Visible = true;

        }

        protected void ddlColumnaEditar_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlColumnaEditar.SelectedValue == "I")
                divLinkEditar.Visible = false;
            else
                divLinkEditar.Visible = true;
        }
    }
=======
﻿using System;
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
    public partial class Banners : System.Web.UI.Page
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

            // Cargo grilla con los banners
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

            nBanner unBannerN = new nBanner();
            sError = unBannerN.Buscar_Todos(ref dt);

            grdBanners.DataSource = dt;
            grdBanners.DataBind();

            return sError;
        }

        protected void fuImagen_Load(object sender, EventArgs e)
        {
            if (fuImagen.PostedFile != null)
            {
                //imagen = fuImagen.PostedFile.FileName;
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
                        string strFilename = "\\Banners\\" + Path.GetFileName(myFile.FileName);

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
                            string strFilename = "\\Banners\\" + Path.GetFileName(myFile.FileName);

                            // Write data into a file
                            WriteToFile(Server.MapPath(strFilename), ref myData);
                            imgMuestra.ImageUrl = ".." + strFilename;
                            //imagen = strFilename.Substring(strFilename.LastIndexOf("\\") + 1);
                        }
                    }

                    oBanner unBanner = new oBanner();
                    unBanner.nombre = txtNombre.Text;
                    unBanner.imagen = imagen;
                    unBanner.columna = ddlColumna.SelectedValue;
                    unBanner.activo = chkActivo.Checked;
                    unBanner.link = txtLink.Text;

                    nBanner nBanner = new nBanner();
                    nBanner.Alta(ref unBanner);

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
            nBanner unBannerN = new nBanner();
            return unBannerN.Buscar_Uno(imagen);
        }

        protected void grdBanners_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string sError = "";
                try
                {
                    if (int.Parse(e.CommandArgument.ToString()) > 0)
                    {
                        nBanner unBannerN = new nBanner();
                        oBanner unBannerO = new oBanner();
                        sError = unBannerN.Buscar_Uno(int.Parse(e.CommandArgument.ToString()), ref unBannerO);

                        hId.Value = unBannerO.id.ToString();
                        txtNombreEditar.Text = unBannerO.nombre;
                        imgMuestraEditar.ImageUrl = unBannerO.imagen;
                        chkActivoEditar.Checked = unBannerO.activo;
                        ddlColumnaEditar.SelectedValue = unBannerO.columna;
                        txtLinkEditar.Text = unBannerO.link;

                        formModificar.Visible = true;

                        //HtmlGenericControl formModificar = new HtmlGenericControl("formModificar");
                        //formModificar.FindControl("");

                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script type='text/javascript' language='javascript'> alert('" + sError + "');</script>");
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
                    string strFilename = "\\Banners\\" + Path.GetFileName(myFile.FileName);

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
            oBanner unBannerModificar = new oBanner();
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
                            string strFilename = "\\Banners\\" + Path.GetFileName(myFile.FileName);

                            // Write data into a file
                            WriteToFile(Server.MapPath(strFilename), ref myData);
                            imgMuestraEditar.ImageUrl = ".." + strFilename;
                            //imagen = strFilename.Substring(strFilename.LastIndexOf("\\") + 1);

                            unBannerModificar.imagen = imagenEditar;
                        }
                    }
                }
                else
                {
                    unBannerModificar.imagen = imagenEditar;
                }
            }

            unBannerModificar.id = int.Parse(hId.Value.ToString());
            unBannerModificar.nombre = txtNombreEditar.Text;
            unBannerModificar.columna = ddlColumnaEditar.SelectedValue;
            unBannerModificar.imagen = imagenEditar;
            unBannerModificar.activo = chkActivoEditar.Checked;

            nBanner nBanner = new nBanner();
            nBanner.Modificar(unBannerModificar);

            string sError = cargar_Grilla();

            formModificar.Visible = false;
            vioImagen = false;
        }

        protected void ddlColumna_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlColumna.SelectedValue == "I")
                divLink.Visible = false;
            else
                divLink.Visible = true;

        }

        protected void ddlColumnaEditar_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlColumnaEditar.SelectedValue == "I")
                divLinkEditar.Visible = false;
            else
                divLinkEditar.Visible = true;
        }
    }
>>>>>>> refs/remotes/origin/mllarin
}