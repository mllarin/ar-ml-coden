using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Objetos;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class dBanner
    {

        Connection oCon = new Connection();

        public string Alta(ref oBanner pE_Banner)
        {
            try
            {
                string[,] strParameters = { { "@pE_nombre", pE_Banner.nombre },
                                            { "@pE_imagen", pE_Banner.imagen},
                                            { "@pE_activo", (pE_Banner.activo==true?"1":"0")},
                                            { "@pE_columna", pE_Banner.columna},
                                            { "@pE_link", pE_Banner.link}};

                pE_Banner.id = int.Parse(oCon.ExecScalar("web_Banner_Alta", CommandType.StoredProcedure, strParameters).ToString());

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public string Buscar_Todos(ref DataTable pS_dt)
        {
            try
            {
                oCon.Carga_Tabla("web_Banner_BuscarTodos", ref pS_dt);

                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Buscar_TodosInicio(ref DataTable pS_dt)
        {
            try
            {
                oCon.Carga_Tabla("web_Banner_BuscarTodosInicio", ref pS_dt);

                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Buscar_Uno(long pE_Id, ref oBanner pS_Banner)
        {
            string sError = "";
            try
            {
                SqlDataReader dr = null;

                string[,] strParameters = { { "@pE_Id", pE_Id.ToString() } };

                dr = oCon.ExecReader("web_Banner_BuscarUno", CommandType.StoredProcedure, strParameters);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        pS_Banner.id = Convert.ToInt32(dr["id"].ToString());
                        pS_Banner.nombre = (dr["nombre"] == DBNull.Value ? "" : dr["nombre"].ToString());
                        pS_Banner.imagen = (dr["imagen"] == DBNull.Value ? "" : dr["imagen"].ToString());
                        pS_Banner.activo = (dr["activo"].ToString().ToLower() == "false" ? false : true);
                        pS_Banner.columna = (dr["columna"] == DBNull.Value ? "" : dr["columna"].ToString());
                        pS_Banner.link = (dr["link"] == DBNull.Value ? "" : dr["link"].ToString());
                    }
                }
                else
                {
                    throw new Exception("El banner seleccionado no existe");
                }

                dr.Close();
                dr = null;
            }
            catch (Exception ex)
            {
                sError = ex.Message;
            }

            return sError;

        }

        public Boolean Buscar_Uno(string pE_Imagen)
        {
            string sError = "";
            try
            {
                SqlDataReader dr = null;

                string[,] strParameters = { { "@pE_Imagen", pE_Imagen } };

                dr = oCon.ExecReader("web_Banner_BuscarImagen", CommandType.StoredProcedure, strParameters);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        return (dr["resultado"].ToString().ToLower() == "false" ? false : true);
                    }
                }
                else
                {
                    throw new Exception("El banner seleccionado no existe");
                }

                dr.Close();
                dr = null;
            }
            catch (Exception ex)
            {
                sError = ex.Message;
            }

            return false;

        }

        public string Modificar(oBanner pE_Banner)
        {


            try
            {
                string[,] strParameters = {{"@pE_id",pE_Banner.id.ToString()},
                                        {"@pE_nombre",pE_Banner.nombre},
                                        {"@pE_imagen",pE_Banner.imagen},
                                        {"@pE_activo",pE_Banner.activo.ToString()},
                                        {"@pE_columna",pE_Banner.columna},
                                        {"@pE_link",pE_Banner.link}};


                oCon.ExecNonQuery("web_Banner_Modificar", CommandType.StoredProcedure, strParameters);

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
    }
}
