using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class RecorridoDAL
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

        public int TerminalInicioId
        {
            get { return _terminalInicioId; }
            set { _terminalInicioId = value; }
        }

        private int _terminalFinId;

        public int TerminalFinId
        {
            get { return _terminalFinId; }
            set { _terminalFinId = value; }
        }
        #endregion

        public static List<RecorridoDAL> ListarTodos()
        {
            string query = "SELECT id, linea, ramal, terminal_inicio_id, terminal_fin_id FROM recorrido";
            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);
            return table.Select().Select(r => new RecorridoDAL
            {
                Id = int.Parse(r["id"].ToString()),
                Linea = int.Parse(r["linea"].ToString()),
                Ramal = r.IsNull("ramal") ? "" : r["ramal"].ToString(),
                TerminalInicioId = int.Parse(r["terminal_inicio_id"].ToString()),
                TerminalFinId = int.Parse(r["terminal_fin_id"].ToString())
            }).ToList();
        }
    }
}
