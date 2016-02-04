using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos;
using Objetos;
using System.Data;

namespace Negocios
{
    public class nNotificacion
    {
        dNotificacion dNotifica = new dNotificacion();

        public string Alta(ref oNotificacion pE_Notificacion)
        {
            return dNotifica.Alta(ref pE_Notificacion);
        }

        public string BuscarXUsuario(string pE_idUsuario, ref DataTable pS_dt)
        {
            return dNotifica.BuscarXUsuario(pE_idUsuario, ref pS_dt);
        }

        public string Buscar_Todas(ref DataTable pS_dt)
        {
            return dNotifica.Buscar_Todas(ref pS_dt);
        }

        public string BuscarUna(long pE_Id,ref oNotificacion pS_Notificacion)
        {
            return dNotifica.Buscar_Una(pE_Id,ref pS_Notificacion);
        }

        public string NotificarLeida(long pE_idNotificacion, string pE_idUsuario)
        {
            return dNotifica.NotificarLeida(pE_idNotificacion, pE_idUsuario);
        }

        public string Modificar(long pE_idNotificacion, string pE_idUsuario, string pE_texto, bool pE_cuerpo)
        {
            return dNotifica.Modificar(pE_idNotificacion, pE_idUsuario, pE_texto, pE_cuerpo);
        }
    }
}
