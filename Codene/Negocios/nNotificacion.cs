<<<<<<< HEAD
﻿using System;
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

        public string BuscarTodas(ref DataTable pS_dt)
        {
            return dNotifica.BuscarTodas(ref pS_dt);
        }

        public string NotificarLeida(long pE_idNotificacion, string pE_idUsuario)
        {
            return dNotifica.NotificarLeida(pE_idNotificacion, pE_idUsuario);
        }
    }
}
=======
﻿using System;
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

        public string BuscarTodas(ref DataTable pS_dt)
        {
            return dNotifica.BuscarTodas(ref pS_dt);
        }

        public string NotificarLeida(long pE_idNotificacion, string pE_idUsuario)
        {
            return dNotifica.NotificarLeida(pE_idNotificacion, pE_idUsuario);
        }
    }
}
>>>>>>> refs/remotes/origin/mllarin
