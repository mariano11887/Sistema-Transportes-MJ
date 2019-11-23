namespace BE
{
    public class TerminalBE
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

        private string _direccion;

        public string Direccion
        {
            get { return _direccion; }
            set { _direccion = value; }
        }

        private double _latitud;

        public double Latitud
        {
            get { return _latitud; }
            set { _latitud = value; }
        }

        private double _longitud;

        public double Longitud
        {
            get { return _longitud; }
            set { _longitud = value; }
        }
    }
}
