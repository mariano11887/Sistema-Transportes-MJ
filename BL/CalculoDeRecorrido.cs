using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    class CalculoDeRecorrido
    {
        private Recorrido _recorrido;

        public Recorrido Recorrido
        {
            get { return _recorrido; }
            set { _recorrido = value; }
        }

        private Dictionary<int, int> _frecuenciaPorIntervalo;

        public Dictionary<int, int> FrecuenciaPorIntervalo
        {
            get { return _frecuenciaPorIntervalo; }
            set { _frecuenciaPorIntervalo = value; }
        }

        private Dictionary<int, TimeSpan> _duracionPorIntervalo;

        public Dictionary<int, TimeSpan> DuracionPorIntervalo
        {
            get { return _duracionPorIntervalo; }
            set { _duracionPorIntervalo = value; }
        }

    }
}
