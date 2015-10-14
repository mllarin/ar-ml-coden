using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Specialized;

namespace Datos
{
    public class Connection
    {
        private string StrCnn;

        public Connection()
        {
            NameValueCollection appSettings = WebConfigurationManager.AppSettings as NameValueCollection;
            //StrCnn = "Data Source = localhost;Initial Catalog=v0030993_codene;Integrated Security=SSPI";
            StrCnn = "data source=" + appSettings["ServidorSql"] + ";initial catalog=" + appSettings["BaseDatos"] + ";User Id=" + appSettings["UserId"] + ";Password=" + appSettings["Password"] + ";";
            //StrCnn = "data source=NB-DESARROLLO\\SQL2008;initial catalog=Codene;Integrated Security= SSPI";
        }

        public SqlDataReader ExecReader(string pE_Query, CommandType pE_Commandtype)
        {
            string[,] param = null;
            SqlTransaction tran = null;
            return ExecReader(pE_Query, pE_Commandtype, param, ref tran);
        }

        public SqlDataReader ExecReader(string pE_Query, CommandType pE_Commandtype, string[,] pE_Parameters)
        {
            SqlTransaction tran = null;
            return ExecReader(pE_Query, pE_Commandtype, pE_Parameters, ref tran);
        }

        public SqlDataReader ExecReader(string pE_Query, CommandType pE_Commandtype,
                               string[,] pE_Parameters, ref SqlTransaction pE_Trans)
        {
            try
            {
                SqlConnection conn = new SqlConnection(StrCnn);
                SqlDataReader Dr = null;
                int intQtyParameters;
                SqlCommand comm;

                if (pE_Trans == null)
                {
                    conn.ConnectionString = StrCnn;
                    comm = new SqlCommand(pE_Query, conn);
                }
                else
                {
                    comm = new SqlCommand(pE_Query, pE_Trans.Connection, pE_Trans);
                }

                //Determino si el commandtype es un SP y si tiene parametros.
                if (pE_Commandtype == CommandType.StoredProcedure)
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    if (pE_Parameters != null)
                    {
                        intQtyParameters = pE_Parameters.Length / 2;

                        if (pE_Parameters.Rank > 0)
                        {
                            for (int i = 0; i < intQtyParameters; i++)
                            {
                                comm.Parameters.AddWithValue(pE_Parameters[i, 0], pE_Parameters[i, 1]);
                            }
                        }
                    }
                }
                else
                {
                    comm.CommandType = pE_Commandtype;
                }

                comm.CommandTimeout = 600;
                if (pE_Trans == null) { conn.Open(); }
                Dr = comm.ExecuteReader();
                    
                return Dr;
            }
            catch (System.Exception)
            {
                throw;
            }
        }

        public long ExecScalar(string pE_Query, CommandType pE_Commandtype)
        {
            string[,] param = null;
            SqlTransaction tran = null;
            return ExecScalar(pE_Query, pE_Commandtype, param, ref tran);
        }

        public long ExecScalar(string pE_Query, CommandType pE_Commandtype, string[,] pE_Parameters)
        {
            SqlTransaction tran = null;
            return ExecScalar(pE_Query, pE_Commandtype, pE_Parameters, ref tran);
        }

        public long ExecScalar(string pE_Query, CommandType pE_Commandtype,
                               string[,] pE_Parameters, ref SqlTransaction pE_Trans)
        {
            try
            {
                SqlConnection conn = new SqlConnection(StrCnn);
                long lngResultado;
                int intQtyParameters;
                SqlCommand comm;

                if (pE_Trans == null)
                {
                    conn.ConnectionString = StrCnn;
                    comm = new SqlCommand(pE_Query, conn);
                }
                else
                {
                    comm = new SqlCommand(pE_Query, pE_Trans.Connection, pE_Trans);
                }

                //Determino si el commandtype es un SP y si tiene parametros.
                if (pE_Commandtype == CommandType.StoredProcedure)
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    if (pE_Parameters != null)
                    {
                        intQtyParameters = pE_Parameters.Length / 2;

                        if (pE_Parameters.Rank > 0)
                        {
                            for (int i = 0; i < intQtyParameters; i++)
                            {
                                comm.Parameters.AddWithValue(pE_Parameters[i, 0], pE_Parameters[i, 1]);
                            }
                        }
                    }
                }
                else
                {
                    comm.CommandType = pE_Commandtype;
                }

                comm.CommandTimeout = 600;
                if (pE_Trans == null) { conn.Open(); }

                lngResultado = long.Parse(comm.ExecuteScalar().ToString());

                if (pE_Trans == null)
                {
                    conn.Close();
                    conn = null;
                }

                return lngResultado;
            }
            catch (System.Exception)
            {
                throw;
            }
        }


        public void ExecNonQuery(string pE_Query, CommandType pE_Commandtype)
        {
            string[,] param = null;
            SqlTransaction tran = null;
            ExecNonQuery(pE_Query, pE_Commandtype, param, ref tran);
        }

        public void ExecNonQuery(string pE_Query, CommandType pE_Commandtype, string[,] pE_Parameters)
        {
            SqlTransaction tran = null;
            ExecNonQuery(pE_Query, pE_Commandtype, pE_Parameters, ref tran);
        }

        public void ExecNonQuery(string pE_Query, CommandType pE_Commandtype,
                                 string[,] pE_Parameters, ref SqlTransaction pE_Trans)
        {
            try
            {
                SqlConnection conn = new SqlConnection(StrCnn);
                int intQtyParameters;
                SqlCommand comm;

                if (pE_Trans == null)
                {
                    conn.ConnectionString = StrCnn;
                    comm = new SqlCommand(pE_Query, conn);
                }
                else
                {
                    comm = new SqlCommand(pE_Query, pE_Trans.Connection, pE_Trans);
                }

                //Determino si el commandtype es un SP y si tiene parametros.
                if (pE_Commandtype == CommandType.StoredProcedure)
                {
                    comm.CommandType = CommandType.StoredProcedure;

                    if (pE_Parameters != null)
                    {
                        intQtyParameters = pE_Parameters.Length / 2;

                        if (pE_Parameters.Rank > 0)
                        {
                            for (int i = 0; i < intQtyParameters; i++)
                            {
                                comm.Parameters.AddWithValue(pE_Parameters[i, 0], pE_Parameters[i, 1]);
                            }
                        }
                    }
                }
                else
                {
                    comm.CommandType = pE_Commandtype;
                }

                comm.CommandTimeout = 600;
                if (pE_Trans == null) { conn.Open(); }

                comm.ExecuteNonQuery();

                if (pE_Trans == null)
                {
                    conn.Close();
                    conn = null;
                }

                comm.Dispose();
            }
            catch (System.Exception)
            {
                throw;
            }
        }

        public string Carga_Tabla(string pE_Query, ref DataTable pS_Tabla)
        {
            string[,] param = null;
            SqlTransaction tran = null;
            return Carga_Tabla(pE_Query, ref pS_Tabla, param, ref tran);
        }

        public string Carga_Tabla(string pE_Query, ref DataTable pS_Tabla, string[,] pE_Parameters)
        {
            SqlTransaction tran = null;
            return Carga_Tabla(pE_Query, ref pS_Tabla, pE_Parameters, ref tran);
        }

        public string Carga_Tabla(string pE_Query, ref DataTable pS_Tabla,
                                  string[,] pE_Parameters, ref SqlTransaction pE_Trans)
        {
            try
            {
                SqlConnection conn = new SqlConnection(StrCnn);
                int intQtyParameters;
                SqlCommand comm;
                SqlDataAdapter da;
                DataSet ds = new DataSet();

                if (pE_Trans == null)
                {
                    conn.ConnectionString = StrCnn;
                    comm = new SqlCommand(pE_Query, conn);
                }
                else
                {
                    comm = new SqlCommand(pE_Query, pE_Trans.Connection, pE_Trans);
                }


                if (pE_Parameters != null)
                {
                    intQtyParameters = pE_Parameters.Length / 2;
                    comm.CommandType = CommandType.StoredProcedure;
                    if (pE_Parameters.Rank > 0)
                    {
                        for (int i = 0; i < intQtyParameters; i++)
                        {
                            comm.Parameters.AddWithValue(pE_Parameters[i, 0], pE_Parameters[i, 1]);
                        }
                    }
                }

                comm.CommandTimeout = 600;
                if (pE_Trans == null) { conn.Open(); }

                da = new SqlDataAdapter(comm);
                da.Fill(ds);
                pS_Tabla = ds.Tables[0];

                if (pE_Trans == null)
                {
                    conn.Close();
                    conn = null;
                }

                comm.Dispose();
                return "";
            }
            catch (System.Exception ex)
            {
                return ex.Message;
                throw;
            }
        }
    }
}
