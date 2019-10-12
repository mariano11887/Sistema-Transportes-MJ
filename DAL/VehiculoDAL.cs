using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class VehiculoDAL
    {
        #region Propiedades
        private int _vehiculoId;
        public int VehiculoId
        {
            get { return _vehiculoId; }
            set { _vehiculoId = value; }
        }

        private string _patente;
        public string Patente
        {
            get { return _patente; }
            set { _patente = value; }
        }

        private string _marca;
        public string Marca
        {
            get { return _marca; }
            set { _marca = value; }
        }

        private string _modelo;
        public string Modelo
        {
            get { return _modelo; }
            set { _modelo = value; }
        }

        private DateTime _fechaAdquisicion;
        public DateTime FechaAdquisicion
        {
            get { return _fechaAdquisicion; }
            set { _fechaAdquisicion = value; }
        }

        private int _anioFabricacion;
        public int AnioFabricacion
        {
            get { return _anioFabricacion; }
            set { _anioFabricacion = value; }
        }

        private int _numeroInterno;
        public int NumeroInterno
        {
            get { return _numeroInterno; }
            set { _numeroInterno = value; }
        }

        private int _capacidad;
        public int Capacidad
        {
            get { return _capacidad; }
            set { _capacidad = value; }
        }

        private bool _enCirculacion;
        public bool EnCirculacion
        {
            get { return _enCirculacion; }
            set { _enCirculacion = value; }
        }

        private bool _habilitado;
        public bool Habilitado
        {
            get { return _habilitado; }
            set { _habilitado = value; }
        }
        #endregion

        public void Guardar()
        {
            if (VehiculoId > 0)
            {
                Actualizar();
            }
            else
            {
                Insertar();
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

        public static List<VehiculoDAL> Buscar(string patente, int numeroDeInterno, bool? enCirculacion)
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

        public static VehiculoDAL Buscar(int id)
        {
            string query = "SELECT id, patente, marca, modelo, fecha_adquisicion, anio_fabricacion, numero_interno, " +
                "capacidad, en_circulacion FROM coche WHERE id = @id AND habilitado = 1";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@id", id)
            };
            return RealizarBusqueda(query, parameters).FirstOrDefault();
        }

        public static List<VehiculoDAL> ListarTodos()
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

        private static List<VehiculoDAL> RealizarBusqueda(string query, SqlParameter[] parameters)
        {
            DataTable table = SqlHelper.Obtener(query, parameters);
            return table.Select().Select(r => new VehiculoDAL
            {
                AnioFabricacion = int.Parse(r["anio_fabricacion"].ToString()),
                Capacidad = int.Parse(r["capacidad"].ToString()),
                EnCirculacion = bool.Parse(r["en_circulacion"].ToString()),
                FechaAdquisicion = DateTime.Parse(r["fecha_adquisicion"].ToString()),
                Habilitado = true,
                Marca = r["marca"].ToString(),
                Modelo = r["modelo"].ToString(),
                NumeroInterno = int.Parse(r["numero_interno"].ToString()),
                Patente = r["patente"].ToString(),
                VehiculoId = int.Parse(r["id"].ToString())
            }).ToList();
        }

        private void Actualizar()
        {
            string query = "UPDATE coche SET patente = @patente, marca = @marca, modelo = @modelo, " +
                "fecha_adquisicion = @fechaAdquisicion, anio_fabricacion = @anioFabricacion, numero_interno = @numeroInterno, " +
                "capacidad = @capacidad, en_circulacion = @enCirculacion, habilitado = @habilitado WHERE id = @vehiculoId";
            SqlParameter[] parameters =
            {
                new SqlParameter("@patente", Patente),
                new SqlParameter("@marca", Marca),
                new SqlParameter("@modelo", Modelo),
                new SqlParameter("@fechaAdquisicion", FechaAdquisicion),
                new SqlParameter("@anioFabricacion", AnioFabricacion),
                new SqlParameter("@numeroInterno", NumeroInterno),
                new SqlParameter("@capacidad", Capacidad),
                new SqlParameter("@enCirculacion", EnCirculacion),
                new SqlParameter("@habilitado", Habilitado),
                new SqlParameter("@vehiculoId", VehiculoId)
            };

            SqlHelper.Ejecutar(query, parameters);
        }

        private void Insertar()
        {
            string query = "INSERT INTO coche (patente, marca, modelo, fecha_adquisicion, anio_fabricacion, numero_interno, capacidad, en_circulacion) " +
                "OUTPUT INSERTED.id VALUES (@patente, @marca, @modelo, @fechaAdquisicion, @anioFabricacion, @numeroInterno, @capacidad, @enCirculacion)";
            SqlParameter[] parameters =
            {
                new SqlParameter("@patente", Patente),
                new SqlParameter("@marca", Marca),
                new SqlParameter("@modelo", Modelo),
                new SqlParameter("@fechaAdquisicion", FechaAdquisicion),
                new SqlParameter("@anioFabricacion", AnioFabricacion),
                new SqlParameter("@numeroInterno", NumeroInterno),
                new SqlParameter("@capacidad", Capacidad),
                new SqlParameter("@enCirculacion", EnCirculacion)
            };

            VehiculoId = SqlHelper.Insertar(query, parameters);
        }
    }
}
