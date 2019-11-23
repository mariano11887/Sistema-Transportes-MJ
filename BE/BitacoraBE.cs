using System;

namespace BE
{
    public class BitacoraBE
    {
        private DateTime _fechaHora;
        public DateTime FechaHora
        {
            get { return _fechaHora; }
            set { _fechaHora = value; }
        }

        private UsuarioBE _usuario;
        public UsuarioBE Usuario
        {
            get { return _usuario; }
            set { _usuario = value; }
        }

        private string _detalle;
        public string Detalle
        {
            get { return _detalle; }
            set { _detalle = value; }
        }
    }
}
