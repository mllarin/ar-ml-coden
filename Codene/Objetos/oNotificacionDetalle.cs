using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Objetos
{
    class oNotificacionDetalle
    {
        public long idNotificacion { get; set; }
        public string idUsuario { get; set; }
        public bool Leida { get; set; }
        public DateTime FechaAlta { get; set; }
        public DateTime FechaLeida { get; set; }
    }
}
