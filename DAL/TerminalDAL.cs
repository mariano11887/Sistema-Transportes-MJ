using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class TerminalDAL
    {
        #region Propiedades
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

        private decimal _latitud;

        public decimal Latitud
        {
            get { return _latitud; }
            set { _latitud = value; }
        }

        private decimal _longitud;

        public decimal Longitud
        {
            get { return _longitud; }
            set { _longitud = value; }
        }
        #endregion

        public static TerminalDAL Obtener(int id)
        {
            string query = "SELECT id, nombre, direccion, latitud, longitud FROM terminal WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };

            DataTable table = SqlHelper.Obtener(query, parameters);
            return table.Select().Select(r => new TerminalDAL
            {
                Direccion = r["direccion"].ToString(),
                Id = int.Parse(r["id"].ToString()),
                Latitud = decimal.Parse(r["latitud"].ToString()),
                Longitud = decimal.Parse(r["longitud"].ToString()),
                Nombre = r["nombre"].ToString()
            }).FirstOrDefault();
        }
    }
}
