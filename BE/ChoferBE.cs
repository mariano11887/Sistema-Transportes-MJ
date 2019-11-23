using System;

namespace BE
{
    public class ChoferBE
    {
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _nombre;

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private int _dni;

        public int Dni
        {
            get { return _dni; }
            set { _dni = value; }
        }

        private VehiculoBE _cochePreferido;

        public VehiculoBE CochePreferido
        {
            get { return _cochePreferido; }
            set { _cochePreferido = value; }
        }

        private DateTime _fechaFinLicencia;

        public DateTime FechaFinLicencia
        {
            get { return _fechaFinLicencia; }
            set { _fechaFinLicencia = value; }
        }
    }
}
