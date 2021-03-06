﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Objetos;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class dNotificacion
    {
        Connection oCon = new Connection();

        public string Alta(ref oNotificacion pE_Notificacion)
        {
            try
            {
                string[,] strParameters = { { "@pE_titulo", pE_Notificacion.Titulo },
                                            { "@pE_descripcion", pE_Notificacion.Descripcion}};

                oCon.ExecNonQuery("web_Notificaciones_Alta", CommandType.StoredProcedure, strParameters);

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public string BuscarXUsuario(string pE_idUsuario, ref DataTable pS_dt)
        {
            try
            {
                string[,] strParameters = { { "@pE_idUsuario", pE_idUsuario } };
                oCon.Carga_Tabla("web_Notificaciones_BuscarXUsuario", ref pS_dt, strParameters);

                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Buscar_Todas(ref DataTable pS_dt)
        {
            try
            {
                oCon.Carga_Tabla("web_Notificaciones_BuscarTodas", ref pS_dt);

                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Buscar_Una(long pE_Id, ref oNotificacion pS_Notificacion)
        {
            string sError = "";
            try
            {
                SqlDataReader dr = null;

                string[,] strParameters = { { "@pE_idNotificacion", pE_Id.ToString() } };

                dr = oCon.ExecReader("web_Notificaciones_BuscarUna", CommandType.StoredProcedure, strParameters);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        pS_Notificacion.idNotificacion = Convert.ToInt32(dr["idNotificacion"].ToString());
                        pS_Notificacion.Titulo = (dr["Titulo"] == DBNull.Value ? "" : dr["Titulo"].ToString());
                        pS_Notificacion.Descripcion = (dr["Descripcion"] == DBNull.Value ? "" : dr["Descripcion"].ToString());
                    }
                }
                else
                {
                    throw new Exception("La Notificacion seleccionada no existe");
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

        public string NotificarLeida(long pE_idNotificacion, string pE_idUsuario)
        {
            try
            {
                string[,] strParameters = { { "@pE_idNotificacion", pE_idNotificacion.ToString() }, { "@pE_idUsuario", pE_idUsuario } };

                oCon.ExecNonQuery("web_Notificaciones_Leida", CommandType.StoredProcedure, strParameters);

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public string Modificar(long pE_idNotificacion, string pE_idUsuario, string texto, bool cuerpo)
        {
            try
            {
                if (cuerpo)
                {
                    string[,] strParameters = { { "@pE_idNotificacion", pE_idNotificacion.ToString() }, { "@pE_idUsuario", pE_idUsuario }, { "@pE_texto", texto } };

                    oCon.ExecNonQuery("web_Notificaciones_Modificar", CommandType.StoredProcedure, strParameters);

                    return "";
                }
                else
                {
                    string[,] strParameters = { { "@pE_idNotificacion", pE_idNotificacion.ToString() }, { "@pE_idUsuario", pE_idUsuario }, { "@pE_texto", texto } };

                    oCon.ExecNonQuery("web_Notificaciones_ModificarTitulo", CommandType.StoredProcedure, strParameters);

                    return "";
                }

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
        
    }

}
