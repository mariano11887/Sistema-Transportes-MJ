using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class RecorridoBE
    {
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private int _linea;

        public int Linea
        {
            get { return _linea; }
            set { _linea = value; }
        }

        private string _ramal;

        public string Ramal
        {
            get { return _ramal; }
            set { _ramal = value; }
        }

        private TerminalBE _terminalInicio;

        public TerminalBE TerminalInicio
        {
            get { return _terminalInicio; }
            set { _terminalInicio = value; }
        }

        private TerminalBE _terminalFin;

        public TerminalBE TerminalFin
        {
            get { return _terminalFin; }
            set { _terminalFin = value; }
        }

        public override string ToString()
        {
            string valor = Linea > 0 ? Linea.ToString() : "";
            if (!string.IsNullOrEmpty(Ramal))
            {
                valor += " (" + Ramal + ")";
            }
            return valor;
        }
    }
}
