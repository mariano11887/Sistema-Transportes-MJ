using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class PlanillaHorariaBE
    {
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private ChoferBE _chofer;

        public ChoferBE Chofer
        {
            get { return _chofer; }
            set { _chofer = value; }
        }

        private VehiculoBE _vehiculo;

        public VehiculoBE Vehiculo
        {
            get { return _vehiculo; }
            set { _vehiculo = value; }
        }

        private RecorridoBE _recorrido;

        public RecorridoBE Recorrido
        {
            get { return _recorrido; }
            set { _recorrido = value; }
        }

        private DateTime _fecha;

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private List<ViajeBE> _viajes;

        public List<ViajeBE> Viajes
        {
            get { return _viajes; }
            set { _viajes = value; }
        }
    }
}
