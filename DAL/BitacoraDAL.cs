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
        #region Constructores
        public BitacoraDAL()
        {
            _fechaHora = DateTime.Now;
        }
        #endregion

        #region Propiedades
        private DateTime _fechaHora;
        public DateTime FechaHora
        {
            get { return _fechaHora; }
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
        #endregion

        #region Métodos
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

        public static List<BitacoraDAL> Buscar(DateTime fechaInicio, DateTime fechaFin, int usuarioId, string texto)
        {
            string query = "SELECT fecha_hora, usuario_id, detalle FROM bitacora WHERE fecha_hora BETWEEN @fechaInicio AND @fechaFin";
            List<SqlParameter> paramList = new List<SqlParameter> {
                new SqlParameter("@fechaInicio", fechaInicio),
                new SqlParameter("@fechaFin", fechaFin)
            };
            if(usuarioId > 0)
            {
                query += " AND usuario_id = @usuarioId";
                paramList.Add(new SqlParameter("@usuarioId", usuarioId));
            }
            if(!string.IsNullOrEmpty(texto))
            {
                query += " AND detalle LIKE @detalle";
                paramList.Add(new SqlParameter("@detalle", "%" + texto + "%"));
            }
            DataTable table = SqlHelper.Instancia().Obtener(query, paramList.ToArray(), SqlHelper.Bd.Bitacora);
            List<BitacoraDAL> bitacorasDAL = new List<BitacoraDAL>();
            foreach(DataRow row in table.Rows)
            {
                BitacoraDAL bitacoraDAL = new BitacoraDAL
                {
                    _fechaHora = DateTime.Parse(row["fecha_hora"].ToString()),
                    UsuarioId = int.Parse(row["usuario_id"].ToString()),
                    Detalle = row["detalle"].ToString()
                };
                bitacorasDAL.Add(bitacoraDAL);
            }
            return bitacorasDAL;
        }
        #endregion
    }
}
