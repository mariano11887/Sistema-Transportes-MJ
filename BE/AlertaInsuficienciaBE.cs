using System;

namespace BE
{
    public class AlertaInsuficienciaBE
    {
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private DateTime _fecha;

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private int _choferesFaltantes;

        public int ChoferesFaltantes
        {
            get { return _choferesFaltantes; }
            set { _choferesFaltantes = value; }
        }

        private int _vehiculosFaltantes;

        public int VehiculosFaltantes
        {
            get { return _vehiculosFaltantes; }
            set { _vehiculosFaltantes = value; }
        }
    }
}
