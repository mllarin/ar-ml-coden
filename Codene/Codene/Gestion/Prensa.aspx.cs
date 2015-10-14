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
    public partial class Prensa : System.Web.UI.Page{
    
        static string documento = "";
        static string documentoEditar = "";
        private static bool viodocumento = false;
        protected System.Web.UI.HtmlControls.HtmlInputFile File1;
        protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("login.aspx");

            // Cargo grilla con las entradas de Prensa
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

            nPrensa unaPrensaN = new nPrensa();
            sError = unaPrensaN.Buscar_Todos(ref dt);

            grdPrensa.DataSource = dt;
            grdPrensa.DataBind();

            return sError;
        }

        protected void fuDocumento_Load(object sender, EventArgs e)
        {
            if (fuDocumento.PostedFile != null)
            {
                documento = fuDocumento.PostedFile.FileName.Substring(fuDocumento.PostedFile.FileName.LastIndexOf("\\") + 1);
            }
        }

        protected void btnVerDocumento_Click(object sender, EventArgs e)
        {
            if (fuDocumento.PostedFile != null)
            {
                HttpPostedFile myFile = fuDocumento.PostedFile;
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
                        string strFilename = "\\Prensa\\" + Path.GetFileName(myFile.FileName);

                        // Write data into a file
                        WriteToFile(Server.MapPath(strFilename), ref myData);

                        //Open the file in cuestion
                        System.Diagnostics.Process.Start(Server.MapPath(strFilename));
                       
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

            System.IO.Directory.CreateDirectory("\\Prensa\\"); 

            // Create a file
            FileStream newFile = new FileStream(strPath, FileMode.Create);

            // Write data to the file
            newFile.Write(Buffer, 0, Buffer.Length);

            // Close file
            newFile.Close();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (documento != "")
            {
                // Create a name for the file to store
                HttpPostedFile myFile = fuDocumento.PostedFile;

                if (!DocumentoExiste(documento))
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
                            string strFilename = "\\Prensa\\" + Path.GetFileName(myFile.FileName);

                            // Write data into a file
                            WriteToFile(Server.MapPath(strFilename), ref myData);
                            
                        }
                    }

                    oPrensa unaPrensa = new oPrensa();
                    unaPrensa.titulo = txtTitulo.Text;
                    unaPrensa.adjunto = documento;
                    
                    nPrensa nPrensa = new nPrensa();
                    nPrensa.Alta(ref unaPrensa);

                    string sError = cargar_Grilla();
                }
            }
            else
            {
                Response.Write("<script type='text/javascript' language='javascript'> alert('La entrada de prensa seleccionada ya se encuentra cargada.');</script>");
            }
        }

        private bool DocumentoExiste(string adjunto)
        {
            nPrensa unaPrensaN = new nPrensa();
            return unaPrensaN.Buscar_Uno(adjunto);
        }

        protected void grdPrensa_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string sError = "";
                try
                {
                    if (int.Parse(e.CommandArgument.ToString()) > 0)
                    {
                        nPrensa unaPrensaN = new nPrensa();
                        oPrensa unaPrensaO = new oPrensa();
                        sError = unaPrensaN.Buscar_Uno(int.Parse(e.CommandArgument.ToString()), ref unaPrensaO);

                        hId.Value = unaPrensaO.id.ToString();
                        txtTituloEditar.Text = unaPrensaO.titulo;
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
                if (e.CommandName == "Ver")
                {
                    string sError = "";
                    if (int.Parse(e.CommandArgument.ToString()) > 0)
                    {
                        try
                        {
                            nPrensa unaPrensaN = new nPrensa();
                            oPrensa unaPrensaO = new oPrensa();
                            sError = unaPrensaN.Buscar_Uno(int.Parse(e.CommandArgument.ToString()), ref unaPrensaO);

                            System.Diagnostics.Process.Start(Server.MapPath(unaPrensaO.adjunto));
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script type='text/javascript' language='javascript'> alert('" + ex.Message + "');</script>");
                        }
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
                                nPrensa unaPrensaN = new nPrensa();
                                oPrensa unaPrensaO = new oPrensa();
                                sError = unaPrensaN.Eliminar(e.CommandArgument.ToString());
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
        }

        protected void btnCerrarEditar_Click(object sender, EventArgs e)
        {
            formModificar.Visible = false;
        }

        protected void btnVerdocumentoEditar_Click(object sender, EventArgs e)
        {
            
            HttpPostedFile myFile = fuDocumentoEditar.PostedFile;
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
                    string strFilename = "\\Prensa\\" + Path.GetFileName(myFile.FileName);

                    // Write data into a file
                    WriteToFile(Server.MapPath(strFilename), ref myData);
                    viodocumento = true;
                }
                //}

            }
            else
            {
                // No file

            }
        }
        protected void fuDocumentoEditar_Load(object sender, EventArgs e)
        {
            //HttpPostedFile myFile = Request.Files["fuEditar"];
            if (fuDocumentoEditar.PostedFile != null)
            {
                documentoEditar = fuDocumentoEditar.PostedFile.FileName.Substring(fuDocumentoEditar.PostedFile.FileName.LastIndexOf("\\") + 1);
            }
        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            oPrensa unaPrensaModif = new oPrensa();
           if (documentoEditar != "")
            {
                // Create a name for the file to store
                if (!viodocumento)
                {
                    HttpPostedFile myFile = fuDocumentoEditar.PostedFile;

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
                            string strFilename = "\\Prensa\\" + Path.GetFileName(myFile.FileName);

                            // Write data into a file
                            WriteToFile(Server.MapPath(strFilename), ref myData);
                            //documento = strFilename.Substring(strFilename.LastIndexOf("\\") + 1);

                            unaPrensaModif.adjunto = documentoEditar;
                        }
                    }
                }
                else
                {
                    unaPrensaModif.adjunto = documentoEditar;
                }
            }

            unaPrensaModif.id = int.Parse(hId.Value.ToString());
            unaPrensaModif.titulo = txtTituloEditar.Text;
            unaPrensaModif.adjunto = documentoEditar;

            nPrensa nPrensa = new nPrensa();
            nPrensa.Modificar(unaPrensaModif);

            string sError = cargar_Grilla();

            formModificar.Visible = false;
            viodocumento = false;
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
    public partial class Prensa : System.Web.UI.Page{
    
        static string documento = "";
        static string documentoEditar = "";
        private static bool viodocumento = false;
        protected System.Web.UI.HtmlControls.HtmlInputFile File1;
        protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("login.aspx");

            // Cargo grilla con las entradas de Prensa
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

            nPrensa unaPrensaN = new nPrensa();
            sError = unaPrensaN.Buscar_Todos(ref dt);

            grdPrensa.DataSource = dt;
            grdPrensa.DataBind();

            return sError;
        }

        protected void fuDocumento_Load(object sender, EventArgs e)
        {
            if (fuDocumento.PostedFile != null)
            {
                documento = fuDocumento.PostedFile.FileName.Substring(fuDocumento.PostedFile.FileName.LastIndexOf("\\") + 1);
            }
        }

        protected void btnVerDocumento_Click(object sender, EventArgs e)
        {
            if (fuDocumento.PostedFile != null)
            {
                HttpPostedFile myFile = fuDocumento.PostedFile;
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
                        string strFilename = "\\Prensa\\" + Path.GetFileName(myFile.FileName);

                        // Write data into a file
                        WriteToFile(Server.MapPath(strFilename), ref myData);

                        //Open the file in cuestion
                        System.Diagnostics.Process.Start(Server.MapPath(strFilename));
                       
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

            System.IO.Directory.CreateDirectory("\\Prensa\\"); 

            // Create a file
            FileStream newFile = new FileStream(strPath, FileMode.Create);

            // Write data to the file
            newFile.Write(Buffer, 0, Buffer.Length);

            // Close file
            newFile.Close();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (documento != "")
            {
                // Create a name for the file to store
                HttpPostedFile myFile = fuDocumento.PostedFile;

                if (!DocumentoExiste(documento))
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
                            string strFilename = "\\Prensa\\" + Path.GetFileName(myFile.FileName);

                            // Write data into a file
                            WriteToFile(Server.MapPath(strFilename), ref myData);
                            
                        }
                    }

                    oPrensa unaPrensa = new oPrensa();
                    unaPrensa.titulo = txtTitulo.Text;
                    unaPrensa.adjunto = documento;
                    
                    nPrensa nPrensa = new nPrensa();
                    nPrensa.Alta(ref unaPrensa);

                    string sError = cargar_Grilla();
                }
            }
            else
            {
                Response.Write("<script type='text/javascript' language='javascript'> alert('La entrada de prensa seleccionada ya se encuentra cargada.');</script>");
            }
        }

        private bool DocumentoExiste(string adjunto)
        {
            nPrensa unaPrensaN = new nPrensa();
            return unaPrensaN.Buscar_Uno(adjunto);
        }

        protected void grdPrensa_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string sError = "";
                try
                {
                    if (int.Parse(e.CommandArgument.ToString()) > 0)
                    {
                        nPrensa unaPrensaN = new nPrensa();
                        oPrensa unaPrensaO = new oPrensa();
                        sError = unaPrensaN.Buscar_Uno(int.Parse(e.CommandArgument.ToString()), ref unaPrensaO);

                        hId.Value = unaPrensaO.id.ToString();
                        txtTituloEditar.Text = unaPrensaO.titulo;
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
                if (e.CommandName == "Ver")
                {
                    string sError = "";
                    if (int.Parse(e.CommandArgument.ToString()) > 0)
                    {
                        try
                        {
                            nPrensa unaPrensaN = new nPrensa();
                            oPrensa unaPrensaO = new oPrensa();
                            sError = unaPrensaN.Buscar_Uno(int.Parse(e.CommandArgument.ToString()), ref unaPrensaO);

                            System.Diagnostics.Process.Start(Server.MapPath(unaPrensaO.adjunto));
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script type='text/javascript' language='javascript'> alert('" + ex.Message + "');</script>");
                        }
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
                                nPrensa unaPrensaN = new nPrensa();
                                oPrensa unaPrensaO = new oPrensa();
                                sError = unaPrensaN.Eliminar(e.CommandArgument.ToString());
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
        }

        protected void btnCerrarEditar_Click(object sender, EventArgs e)
        {
            formModificar.Visible = false;
        }

        protected void btnVerdocumentoEditar_Click(object sender, EventArgs e)
        {
            
            HttpPostedFile myFile = fuDocumentoEditar.PostedFile;
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
                    string strFilename = "\\Prensa\\" + Path.GetFileName(myFile.FileName);

                    // Write data into a file
                    WriteToFile(Server.MapPath(strFilename), ref myData);
                    viodocumento = true;
                }
                //}

            }
            else
            {
                // No file

            }
        }
        protected void fuDocumentoEditar_Load(object sender, EventArgs e)
        {
            //HttpPostedFile myFile = Request.Files["fuEditar"];
            if (fuDocumentoEditar.PostedFile != null)
            {
                documentoEditar = fuDocumentoEditar.PostedFile.FileName.Substring(fuDocumentoEditar.PostedFile.FileName.LastIndexOf("\\") + 1);
            }
        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            oPrensa unaPrensaModif = new oPrensa();
           if (documentoEditar != "")
            {
                // Create a name for the file to store
                if (!viodocumento)
                {
                    HttpPostedFile myFile = fuDocumentoEditar.PostedFile;

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
                            string strFilename = "\\Prensa\\" + Path.GetFileName(myFile.FileName);

                            // Write data into a file
                            WriteToFile(Server.MapPath(strFilename), ref myData);
                            //documento = strFilename.Substring(strFilename.LastIndexOf("\\") + 1);

                            unaPrensaModif.adjunto = documentoEditar;
                        }
                    }
                }
                else
                {
                    unaPrensaModif.adjunto = documentoEditar;
                }
            }

            unaPrensaModif.id = int.Parse(hId.Value.ToString());
            unaPrensaModif.titulo = txtTituloEditar.Text;
            unaPrensaModif.adjunto = documentoEditar;

            nPrensa nPrensa = new nPrensa();
            nPrensa.Modificar(unaPrensaModif);

            string sError = cargar_Grilla();

            formModificar.Visible = false;
            viodocumento = false;
        }

        

        
    }

>>>>>>> refs/remotes/origin/mllarin
}