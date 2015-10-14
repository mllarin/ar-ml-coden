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
    public class dNovedad
    {
        Connection oCon = new Connection();

        public string Alta(ref oNovedad pE_Novedad)
        {
            try
            {
                string[,] strParameters = { { "@pE_titulo", pE_Novedad.titulo },
                                            { "@pE_imagen", pE_Novedad.imagen},
                                            { "@pE_cuerpo", pE_Novedad.cuerpo}};

                pE_Novedad.id = int.Parse(oCon.ExecScalar("web_Novedad_Alta", CommandType.StoredProcedure, strParameters).ToString());

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
                oCon.Carga_Tabla("web_Novedad_BuscarTodos", ref pS_dt);

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
                oCon.Carga_Tabla("web_Novedad_BuscarTodosInicio", ref pS_dt);

                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Buscar_Uno(long pE_Id, ref oNovedad pS_Novedad)
        {
            string sError = "";
            try
            {
                SqlDataReader dr = null;

                string[,] strParameters = { { "@pE_Id", pE_Id.ToString() } };

                dr = oCon.ExecReader("web_Novedad_BuscarUno", CommandType.StoredProcedure, strParameters);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        pS_Novedad.id = Convert.ToInt32(dr["id"].ToString());
                        pS_Novedad.titulo = (dr["titulo"] == DBNull.Value ? "" : dr["titulo"].ToString());
                        pS_Novedad.imagen = (dr["imagen"] == DBNull.Value ? "" : dr["imagen"].ToString());
                        pS_Novedad.cuerpo = (dr["cuerpo"] == DBNull.Value ? "" : dr["cuerpo"].ToString());
                    }
                }
                else
                {
                    throw new Exception("La Novedad seleccionada no existe");
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

                dr = oCon.ExecReader("web_Novedad_BuscarImagen", CommandType.StoredProcedure, strParameters);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        return (dr["resultado"].ToString().ToLower() == "false" ? false : true);
                    }
                }
                else
                {
                    throw new Exception("La Novedad seleccionada no existe");
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

        public string Modificar(oNovedad pE_Novedad)
        {


            try
            {
                string[,] strParameters = {{"@pE_id",pE_Novedad.id.ToString()},
                                        {"@pE_titulo",pE_Novedad.titulo},
                                        {"@pE_imagen",pE_Novedad.imagen},
                                        {"@pE_cuerpo",pE_Novedad.cuerpo}};


                oCon.ExecNonQuery("web_Novedad_Modificar", CommandType.StoredProcedure, strParameters);

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public string Eliminar(string pE_Id)
        {
            try
            {
                string[,] strParameters = {{"@pE_id",pE_Id}};


                oCon.ExecNonQuery("web_Novedad_Eliminar", CommandType.StoredProcedure, strParameters);

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
