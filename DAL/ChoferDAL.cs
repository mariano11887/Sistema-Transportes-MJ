using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class ChoferDAL
    {
        public static List<ChoferBE> Buscar(string nombre, int dni, bool? deLicencia, int idCochePreferido)
        {
            string queryLicencia;
            if(deLicencia == true)
            {
                queryLicencia = "(fecha_fin_licencia IS NOT NULL AND fecha_fin_licencia > GETDATE())";
            }
            else if(deLicencia == false)
            {
                queryLicencia = "(fecha_fin_licencia IS NULL OR fecha_fin_licencia < GETDATE())";
            }
            else
            {
                queryLicencia = "1 = 1";
            }

            List<SqlParameter> parameters = new List<SqlParameter>();

            string queryCochePreferido;
            if(idCochePreferido > 0)
            {
                queryCochePreferido = "coche_preferido_id = @cochePreferidoId";
                parameters.Add(new SqlParameter("@cochePreferidoId", idCochePreferido));
            }
            else
            {
                queryCochePreferido = "1 = 1";
            }

            string queryTemplate = "SELECT id, nombre, dni, coche_preferido_id, fecha_fin_licencia, habilitado " +
                "FROM chofer WHERE habilitado = 1 AND nombre LIKE {0} AND dni = {1} " +
                "AND " + queryLicencia + " AND " + queryCochePreferido;

            string sqlNombre, sqlDni;

            if(string.IsNullOrWhiteSpace(nombre))
            {
                sqlNombre = "nombre";
            }
            else
            {
                sqlNombre = "@nombre";
                parameters.Add(new SqlParameter("@nombre", "%" + nombre + "%"));
            }

            if(dni <= 0)
            {
                sqlDni = "dni";
            }
            else
            {
                sqlDni = "@dni";
                parameters.Add(new SqlParameter("@dni", dni));
            }

            string query = string.Format(queryTemplate, sqlNombre, sqlDni);

            return HacerBusqueda(query, parameters.ToArray()).ToList();
        }

        public static List<ChoferBE> ListarTodos()
        {
            string query = "SELECT id, nombre, dni, coche_preferido_id, fecha_fin_licencia FROM chofer " +
                "WHERE habilitado = 1 AND (fecha_fin_licencia IS NULL OR fecha_fin_licencia <= GETDATE())";

            DataTable table = SqlHelper.Obtener(query, new SqlParameter[0]);
            return table.Select().Select(r => new ChoferBE
            {
                Id = int.Parse(r["id"].ToString()),
                Nombre = r["nombre"].ToString(),
                Dni = int.Parse(r["dni"].ToString()),
                CochePreferido = r.IsNull("coche_preferido_id") ? null : VehiculoDAL.Obtener(int.Parse(r["coche_preferido_id"].ToString())),
                FechaFinLicencia = r.IsNull("fecha_fin_licencia") ? default : DateTime.Parse(r["fech_fin_licencia"].ToString())
            }).ToList();
        }

        public static ChoferBE Obtener(int id)
        {
            string query = "SELECT id, nombre, dni, coche_preferido_id, fecha_fin_licencia, habilitado FROM chofer " +
                "WHERE habilitado = 1 AND id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };

            return HacerBusqueda(query, parameters).FirstOrDefault();
        }

        public static void Guardar(ChoferBE chofer)
        {
            if(chofer.Id > 0)
            {
                Actualizar(chofer);
            }
            else
            {
                Insertar(chofer);
            }
        }

        public static void Borrar(int id)
        {
            string query = "UPDATE chofer SET habilitado = 0 WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };

            SqlHelper.Ejecutar(query, parameters);
        }

        private static IEnumerable<ChoferBE> HacerBusqueda(string query, SqlParameter[] parameters)
        {
            DataTable table = SqlHelper.Obtener(query, parameters);
            return table.Select().Select(r => new ChoferBE
            {
                CochePreferido = r.IsNull("coche_preferido_id") ? null : VehiculoDAL.Obtener(int.Parse(r["coche_preferido_id"].ToString())),
                Dni = int.Parse(r["dni"].ToString()),
                FechaFinLicencia = r.IsNull("fecha_fin_licencia") ? default : DateTime.Parse(r["fecha_fin_licencia"].ToString()),
                Id = int.Parse(r["id"].ToString()),
                Nombre = r["nombre"].ToString()
            });
        }

        private static void Insertar(ChoferBE chofer)
        {
            string query = "INSERT INTO chofer (nombre, dni, coche_preferido_id, habilitado) " +
                "OUTPUT INSERTED.id VALUES (@nombre, @dni, @cochePreferidoId, 1)";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@nombre", chofer.Nombre),
                new SqlParameter("@dni", chofer.Dni),
                new SqlParameter("@cochePreferidoId", chofer.CochePreferido == null ? DBNull.Value : (object)chofer.CochePreferido.Id)
            };

            chofer.Id = SqlHelper.Insertar(query, parameters);
        }

        private static void Actualizar(ChoferBE chofer)
        {
            string query = "UPDATE chofer SET nombre = @nombre, dni = @dni, coche_preferido_id = @cochePreferidoId, " +
                "fecha_fin_licencia = @fechaFinLicencia WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@nombre", chofer.Nombre),
                new SqlParameter("@dni", chofer.Dni),
                new SqlParameter("@cochePreferidoId", chofer.CochePreferido == null ? DBNull.Value : (object)chofer.CochePreferido.Id),
                new SqlParameter("@fechaFinLicencia", chofer.FechaFinLicencia >= DateTime.Today ? (object)chofer.FechaFinLicencia : DBNull.Value),
                new SqlParameter("@id", chofer.Id)
            };

            SqlHelper.Ejecutar(query, parameters);
        }
    }
}
