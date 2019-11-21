using BE;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class AlertaInsuficienciaDAL
    {
        public static void Guardar(AlertaInsuficienciaBE alertaInsuficiencia)
        {
            string query = "INSERT INTO alerta_insuficiencia (fecha, choferes_faltantes, coches_faltantes) " +
                "OUTPUT INSERTED.id VALUES (@fecha, @choferesFaltantes, @cochesFaltantes)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@fecha", alertaInsuficiencia.Fecha),
                new SqlParameter("@choferesFaltantes", alertaInsuficiencia.ChoferesFaltantes),
                new SqlParameter("@cochesFaltantes", alertaInsuficiencia.VehiculosFaltantes)
            };

            alertaInsuficiencia.Id = SqlHelper.Insertar(query, parameters);
        }

        public static void MarcarLeida(AlertaInsuficienciaBE alertaInsuficiencia, int idUsuario)
        {
            string query = "INSERT INTO alerta_usuario (alerta_id, usuario_id) VALUES (@idAlerta, @idUsuario)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@idAlerta", alertaInsuficiencia.Id),
                new SqlParameter("@idUsuario", idUsuario)
            };

            SqlHelper.Ejecutar(query, parameters);
        }

        public static AlertaInsuficienciaBE ObtenerPorUsuario(int idUsuario)
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
                return table.Select().Select(r => new AlertaInsuficienciaBE
                {
                    Id = int.Parse(r["id"].ToString()),
                    Fecha = DateTime.Parse(r["fecha"].ToString()),
                    ChoferesFaltantes = int.Parse(r["choferes_faltantes"].ToString()),
                    VehiculosFaltantes = int.Parse(r["coches_faltantes"].ToString())
                }).FirstOrDefault();
            }
            else
            {
                return null;
            }
        }
    }
}
