using System;

namespace BE
{
    public class ViajeBE
    {
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private bool _esIda;

        public bool EsIda
        {
            get { return _esIda; }
            set { _esIda = value; }
        }

        private DateTime _horaSalida;

        public DateTime HoraSalida
        {
            get { return _horaSalida; }
            set { _horaSalida = value; }
        }

        private DateTime _horaEstimadaLlegada;

        public DateTime HoraEstimadaLlegada
        {
            get { return _horaEstimadaLlegada; }
            set { _horaEstimadaLlegada = value; }
        }

        private DateTime? _horaRealLlegada;

        public DateTime? HoraRealLlegada
        {
            get { return _horaRealLlegada; }
            set { _horaRealLlegada = value; }
        }

        private bool? _completado;

        public bool? Completado
        {
            get { return _completado; }
            set { _completado = value; }
        }

        private CompletitudViaje _completitud = CompletitudViaje.Nulo;

        public CompletitudViaje Completitud
        {
            get { return _completitud; }
            set { _completitud = value; }
        }

        private TerminalBE _terminalOrigen;

        public TerminalBE TerminalOrigen
        {
            get { return _terminalOrigen; }
            set { _terminalOrigen = value; }
        }


        private TerminalBE _terminalDestino;

        public TerminalBE TerminalDestino
        {
            get { return _terminalDestino; }
            set { _terminalDestino = value; }
        }
    }
}
