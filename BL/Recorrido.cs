using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Recorrido
    {
        #region Propiedades
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

        private int _terminalInicioId;
        private Terminal _terminalInicio;

        public Terminal TerminalInicio
        {
            get
            {
                if(_terminalInicio == null && _terminalInicioId > 0)
                {
                    _terminalInicio = Terminal.Obtener(_terminalInicioId);
                }
                return _terminalInicio;
            }
            set { _terminalInicio = value; }
        }

        private int _terminalFinId;
        private Terminal _terminalFin;

        public Terminal TerminalFin
        {
            get
            {
                if(_terminalFin == null && _terminalFinId > 0)
                {
                    _terminalFin = Terminal.Obtener(_terminalFinId);
                }
                return _terminalFin;
            }
            set { _terminalFin = value; }
        }
        #endregion

        public static List<Recorrido> ListarTodos()
        {
            return RecorridoDAL.ListarTodos().Select(dal => new Recorrido
            {
                Id = dal.Id,
                Linea = dal.Linea,
                Ramal = dal.Ramal,
                _terminalInicioId = dal.TerminalInicioId,
                _terminalFinId = dal.TerminalFinId
            }).ToList();
        }

        public static Recorrido Obtener(int idRecorrido)
        {
            RecorridoDAL dal = RecorridoDAL.Obtener(idRecorrido);
            return new Recorrido
            {
                Id = dal.Id,
                Linea = dal.Linea,
                Ramal = dal.Ramal,
                _terminalFinId = dal.TerminalFinId,
                _terminalInicioId = dal.TerminalInicioId
            };
        }

        public override string ToString()
        {
            string valor = Linea > 0 ? Linea.ToString() : "";
            if(!string.IsNullOrEmpty(Ramal))
            {
                valor += " (" + Ramal + ")";
            }
            return valor;
        }
    }
}
