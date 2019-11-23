using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class VehiculoDAL
    {
        public static VehiculoBE Obtener(int id)
        {
            string query = "SELECT id, patente, marca, modelo, fecha_adquisicion, anio_fabricacion, numero_interno, " +
                "capacidad, en_circulacion FROM coche WHERE habilitado = 1 AND id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };

            return RealizarBusqueda(query, parameters).FirstOrDefault();
        }

        public static void Guardar(VehiculoBE vehiculo)
        {
            if (vehiculo.Id > 0)
            {
                Actualizar(vehiculo);
            }
            else
            {
                Insertar(vehiculo);
            }
        }

        public static void Borrar(int id)
        {
            string query = "UPDATE coche SET habilitado = 0 WHERE id = @id";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };
            SqlHelper.Ejecutar(query, parameters);
        }

        public static List<VehiculoBE> Buscar(string patente, int numeroDeInterno, bool? enCirculacion)
        {
            string queryTemplate = "SELECT id, patente, marca, modelo, fecha_adquisicion, anio_fabricacion, numero_interno, " +
                "capacidad, en_circulacion FROM coche WHERE patente = {0} AND numero_interno = {1} " +
                "AND en_circulacion = {2} AND habilitado = 1";
            
            List<SqlParameter> parameters = new List<SqlParameter>();
            string sqlPatente, sqlNumeroInterno, sqlEnCirculacion;

            if(string.IsNullOrEmpty(patente))
            {
                sqlPatente = "patente";
            }
            else
            {
                sqlPatente = "@patente";
                parameters.Add(new SqlParameter("@patente", patente));
            }

            if(numeroDeInterno == 0)
            {
                sqlNumeroInterno = "numero_interno";
            }
            else
            {
                sqlNumeroInterno = "@numeroInterno";
                parameters.Add(new SqlParameter("@numeroInterno", numeroDeInterno));
            }

            if(enCirculacion == null)
            {
                sqlEnCirculacion = "en_circulacion";
            }
            else
            {
                sqlEnCirculacion = "@enCirculacion";
                parameters.Add(new SqlParameter("@enCirculacion", (bool)enCirculacion));
            }

            string query = string.Format(queryTemplate, sqlPatente, sqlNumeroInterno, sqlEnCirculacion);
            return RealizarBusqueda(query, parameters.ToArray());
        }

        public static VehiculoBE Buscar(int id)
        {
            string query = "SELECT id, patente, marca, modelo, fecha_adquisicion, anio_fabricacion, numero_interno, " +
                "capacidad, en_circulacion FROM coche WHERE id = @id AND habilitado = 1";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };
            return RealizarBusqueda(query, parameters).FirstOrDefault();
        }

        public static List<VehiculoBE> ListarTodos()
        {
            string query = "SELECT id, patente, marca, modelo, fecha_adquisicion, anio_fabricacion, numero_interno, " +
                "capacidad, en_circulacion FROM coche WHERE habilitado = 1";
            return RealizarBusqueda(query, new SqlParameter[0]);
        }

        public static int ObtenerUltimaTerminalId(int vehiculoId)
        {
            string query = "SELECT CASE WHEN v.es_ida = 1 THEN r.terminal_fin_id ELSE r.terminal_inicio_id END AS ultima_terminal_id " +
                "FROM planilla_horaria ph " +
                "INNER JOIN viaje v ON v.planilla_horaria_id = ph.id " +
                "INNER JOIN recorrido r ON ph.recorrido_id = r.id " +
                "WHERE ph.coche_id = @vehiculoId";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@vehiculoId", vehiculoId)
            };

            return SqlHelper.ObtenerValor<int>(query, parameters);
        }

        private static List<VehiculoBE> RealizarBusqueda(string query, SqlParameter[] parameters)
        {
            DataTable table = SqlHelper.Obtener(query, parameters);
            return table.Select().Select(r => new VehiculoBE
            {
                AnioFabricacion = int.Parse(r["anio_fabricacion"].ToString()),
                Capacidad = int.Parse(r["capacidad"].ToString()),
                EnCirculacion = bool.Parse(r["en_circulacion"].ToString()),
                FechaAdquisicion = DateTime.Parse(r["fecha_adquisicion"].ToString()),
                Marca = r["marca"].ToString(),
                Modelo = r["modelo"].ToString(),
                NumeroInterno = int.Parse(r["numero_interno"].ToString()),
                Patente = r["patente"].ToString(),
                Id = int.Parse(r["id"].ToString())
            }).ToList();
        }

        private static void Actualizar(VehiculoBE vehiculo)
        {
            string query = "UPDATE coche SET patente = @patente, marca = @marca, modelo = @modelo, " +
                "fecha_adquisicion = @fechaAdquisicion, anio_fabricacion = @anioFabricacion, numero_interno = @numeroInterno, " +
                "capacidad = @capacidad, en_circulacion = @enCirculacion WHERE id = @vehiculoId";
            SqlParameter[] parameters =
            {
                new SqlParameter("@patente", vehiculo.Patente),
                new SqlParameter("@marca", vehiculo.Marca),
                new SqlParameter("@modelo", vehiculo.Modelo),
                new SqlParameter("@fechaAdquisicion", vehiculo.FechaAdquisicion),
                new SqlParameter("@anioFabricacion", vehiculo.AnioFabricacion),
                new SqlParameter("@numeroInterno", vehiculo.NumeroInterno),
                new SqlParameter("@capacidad", vehiculo.Capacidad),
                new SqlParameter("@enCirculacion", vehiculo.EnCirculacion),
                new SqlParameter("@vehiculoId", vehiculo.Id)
            };

            SqlHelper.Ejecutar(query, parameters);
        }

        private static void Insertar(VehiculoBE vehiculo)
        {
            string query = "INSERT INTO coche (patente, marca, modelo, fecha_adquisicion, anio_fabricacion, numero_interno, capacidad, en_circulacion) " +
                "OUTPUT INSERTED.id VALUES (@patente, @marca, @modelo, @fechaAdquisicion, @anioFabricacion, @numeroInterno, @capacidad, @enCirculacion)";
            SqlParameter[] parameters =
            {
                new SqlParameter("@patente", vehiculo.Patente),
                new SqlParameter("@marca", vehiculo.Marca),
                new SqlParameter("@modelo", vehiculo.Modelo),
                new SqlParameter("@fechaAdquisicion", vehiculo.FechaAdquisicion),
                new SqlParameter("@anioFabricacion", vehiculo.AnioFabricacion),
                new SqlParameter("@numeroInterno", vehiculo.NumeroInterno),
                new SqlParameter("@capacidad", vehiculo.Capacidad),
                new SqlParameter("@enCirculacion", vehiculo.EnCirculacion)
            };

            vehiculo.Id = SqlHelper.Insertar(query, parameters);
        }
    }
}
