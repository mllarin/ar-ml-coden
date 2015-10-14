<<<<<<< HEAD
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

        public string BuscarTodas(ref DataTable pS_dt)
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
        
    }

}
=======
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

        public string BuscarTodas(ref DataTable pS_dt)
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
        
    }

}
>>>>>>> refs/remotes/origin/mllarin
