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
    public class dPrensa{
    Connection oCon = new Connection();

        public string Alta(ref oPrensa pE_Prensa)
        {
            try
            {
                string[,] strParameters = { { "@pE_titulo", pE_Prensa.titulo },
                                            { "@pE_documento", pE_Prensa.adjunto}};

                pE_Prensa.id = int.Parse(oCon.ExecScalar("web_Prensa_Alta", CommandType.StoredProcedure, strParameters).ToString());

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
                oCon.Carga_Tabla("web_Prensa_BuscarTodos", ref pS_dt);

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
                oCon.Carga_Tabla("web_Prensa_BuscarTodosInicio", ref pS_dt);

                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Buscar_Uno(long pE_Id, ref oPrensa pS_Novedad)
        {
            string sError = "";
            try
            {
                SqlDataReader dr = null;

                string[,] strParameters = { { "@pE_Id", pE_Id.ToString() } };

                dr = oCon.ExecReader("web_Prensa_BuscarUno", CommandType.StoredProcedure, strParameters);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        pS_Novedad.id = Convert.ToInt32(dr["id"].ToString());
                        pS_Novedad.titulo = (dr["titulo"] == DBNull.Value ? "" : dr["titulo"].ToString());
                        pS_Novedad.adjunto = (dr["documento"] == DBNull.Value ? "" : dr["documento"].ToString());
                     
                    }
                }
                else
                {
                    throw new Exception("La entrada de Prensa seleccionada no existe");
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

        public Boolean Buscar_Uno(string pE_Documento)
        {
            string sError = "";
            try
            {
                SqlDataReader dr = null;

                string[,] strParameters = { { "@pE_documento", pE_Documento } };

                dr = oCon.ExecReader("web_Prensa_BuscarAdjunto", CommandType.StoredProcedure, strParameters);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        return (dr["resultado"].ToString().ToLower() == "false" ? false : true);
                    }
                }
                else
                {
                    throw new Exception("La entrada de Prensa seleccionada no existe");
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

        public string Modificar(oPrensa pE_Prensa)
        {


            try
            {
                string[,] strParameters = {{"@pE_id",pE_Prensa.id.ToString()},
                                        {"@pE_titulo",pE_Prensa.titulo},
                                        {"@pE_documento",pE_Prensa.adjunto}};


                oCon.ExecNonQuery("web_Prensa_Modificar", CommandType.StoredProcedure, strParameters);

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


                oCon.ExecNonQuery("web_Prensa_Eliminar", CommandType.StoredProcedure, strParameters);

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
    }
}
