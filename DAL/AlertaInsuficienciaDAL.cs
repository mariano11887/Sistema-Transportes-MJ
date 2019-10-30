using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class AlertaInsuficienciaDAL
    {
        #region Propiedades
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private DateTime _fecha;

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private int _choferesFaltantes;

        public int ChoferesFaltantes
        {
            get { return _choferesFaltantes; }
            set { _choferesFaltantes = value; }
        }

        private int _vehiculosFaltantes;

        public int VehiculosFaltanes
        {
            get { return _vehiculosFaltantes; }
            set { _vehiculosFaltantes = value; }
        }
        #endregion

        public void Guardar()
        {
            string query = "INSERT INTO alerta_insuficiencia (fecha, choferes_faltantes, coches_faltantes) " +
                "OUTPUT INSERTED.id VALUES (@fecha, @choferesFaltantes, @cochesFaltantes)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@fecha", Fecha),
                new SqlParameter("@choferesFaltantes", ChoferesFaltantes),
                new SqlParameter("@cochesFaltantes", VehiculosFaltanes)
            };

            Id = SqlHelper.Insertar(query, parameters);
        }

        public void MarcarLeida(int idUsuario)
        {
            string query = "INSERT INTO alerta_usuario (alerta_id, usuario_id) VALUES (@idAlerta, @idUsuario)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@idAlerta", Id),
                new SqlParameter("@idUsuario", idUsuario)
            };

            SqlHelper.Ejecutar(query, parameters);
        }

        public static AlertaInsuficienciaDAL ObtenerPorUsuario(int idUsuario)
        {
            string query = "SELECT a2.* FROM (SELECT TOP 1 a.id, a.fecha, a.choferes_faltantes, a.coches_faltantes " +
                "FROM alerta_insuficiencia a " +
                "ORDER BY a.fecha DESC) a2 " +
                "WHERE NOT EXISTS(select alerta_id FROM alerta_usuario WHERE usuario_id = @idUsuario AND alerta_id = a2.id)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@idUsuario", idUsuario)
            };
            DataTable table = SqlHelper.Obtener(query, parameters);
            if(table.Rows.Count > 0)
            {
                return table.Select().Select(r => new AlertaInsuficienciaDAL
                {
                    Id = int.Parse(r["id"].ToString()),
                    Fecha = DateTime.Parse(r["fecha"].ToString()),
                    ChoferesFaltantes = int.Parse(r["choferes_faltantes"].ToString()),
                    VehiculosFaltanes = int.Parse(r["coches_faltantes"].ToString())
                }).FirstOrDefault();
            }
            else
            {
                return null;
            }
        }
    }
}
