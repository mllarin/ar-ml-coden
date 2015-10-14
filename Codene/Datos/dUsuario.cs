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
    public class dUsuario
    {
        Connection oCon = new Connection();

        public string Alta(ref oUsuario pE_Usuario)
        {
            try
            {
                string[,] strParameters = { { "@pE_usuario", pE_Usuario.usuario },
                                            { "@pE_password", pE_Usuario.password},
                                            { "@pE_activo", (pE_Usuario.activo==true?"1":"0")}};

                pE_Usuario.id = int.Parse(oCon.ExecScalar("web_Usuario_Alta", CommandType.StoredProcedure, strParameters).ToString());

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public string Buscar_Uno(long pE_Id, ref oUsuario pS_Usuario)
        {
            string sError = "";
            try
            {
                SqlDataReader dr = null;

                string[,] strParameters = { { "@pE_Id", pE_Id.ToString() } };

                dr = oCon.ExecReader("web_Usuario_BuscarUno", CommandType.StoredProcedure, strParameters);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        pS_Usuario.id = Convert.ToInt32(dr["id"].ToString());
                        pS_Usuario.usuario = (dr["usuario"] == DBNull.Value ? "" : dr["usuario"].ToString());
                        pS_Usuario.password = (dr["password"] == DBNull.Value ? "" : dr["password"].ToString());
                        pS_Usuario.activo = (dr["activo"].ToString().ToLower() == "false" ? false : true);
                    }
                }
                else
                {
                    throw new Exception("El usuario seleccionado no existe");
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

        public string Validar(ref oUsuario pS_Usuario)
        {
            string sError = "";
            try
            {
                SqlDataReader dr = null;

                string[,] strParameters = { {"@pE_usuario", pS_Usuario.usuario},
                                            {"@pE_password", pS_Usuario.password} };

                dr = oCon.ExecReader("web_Usuario_Validar", CommandType.StoredProcedure, strParameters);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        pS_Usuario.id = Convert.ToInt32(dr["id"].ToString());

                        if (pS_Usuario.id == 0)
                            throw new Exception("El usuario o contraseña son incorrectos");

                        pS_Usuario.usuario = (dr["usuario"] == DBNull.Value ? "" : dr["usuario"].ToString());
                        pS_Usuario.password = (dr["password"] == DBNull.Value ? "" : dr["password"].ToString());
                        pS_Usuario.activo = (dr["activo"].ToString().ToLower() == "false" ? false : true);

                    }
                }
                else
                {
                    throw new Exception("El usuario o contraseña son incorrectos");
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

    }
}
