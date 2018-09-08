using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class BitacoraDAL
    {
        private DateTime _fechaHora;
        public DateTime FechaHora
        {
            get { return _fechaHora; }
            set { _fechaHora = value; }
        }

        private int _usuarioId;
        public int UsuarioId
        {
            get { return _usuarioId; }
            set { _usuarioId = value; }
        }


        private string _detalle;
        public string Detalle
        {
            get { return _detalle; }
            set { _detalle = value; }
        }

        public void Guardar()
        {
            string query = "INSERT INTO bitacora (fecha_hora, usuario_id, detalle) VALUES (@fechaHora, @usuarioId, @detalle);";
            SqlParameter[] parameters = new SqlParameter[3]
            {
                new SqlParameter("@fechaHora", _fechaHora),
                new SqlParameter("@usuarioId", _usuarioId),
                new SqlParameter("@detalle", _detalle)
            };
            SqlHelper.Instancia().Ejecutar(query, parameters, SqlHelper.Bd.Bitacora);
        }

        public static List<BitacoraDAL> ObtenerVarios(DateTime fechaInicio, DateTime fechaFin, string texto)
        {
            return new List<BitacoraDAL>();
        }
    }
}
