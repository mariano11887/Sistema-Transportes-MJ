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
                Latitud = double.Parse(r["latitud"].ToString()),
                Longitud = double.Parse(r["longitud"].ToString()),
                Nombre = r["nombre"].ToString()
            }).FirstOrDefault();
        }

        public static List<TerminalDAL> ListarTodas()
        {
            string query = "SELECT id, nombre, direccion, latitud, longitud FROM terminal";

            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);
            return table.Select().Select(r => new TerminalDAL
            {
                Direccion = r["direccion"].ToString(),
                Id = int.Parse(r["id"].ToString()),
                Latitud = double.Parse(r["latitud"].ToString()),
                Longitud = double.Parse(r["longitud"].ToString()),
                Nombre = r["nombre"].ToString()
            }).ToList();
        }
    }
}
