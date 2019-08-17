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

        public static List<VehiculoDAL> Buscar(string patente, int numeroDeInterno, bool enCirculacion)
        {
            string queryTemplate = "SELECT id, patente, marca, modelo, fecha_adquisicion, anio_fabricacion, numero_interno, " +
                "capacidad, en_circulacion FROM coche WHERE patente = {0} AND numero_interno = {1} " +
                "AND en_circulacion = @enCirculacion AND habilitado = 1";
            
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter("@enCirculacion", enCirculacion)
            };
            string sqlPatente, sqlNumeroInterno;

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

            string query = string.Format(queryTemplate, sqlPatente, sqlNumeroInterno);
            DataTable table = SqlHelper.Instancia().Obtener(query, parameters.ToArray());
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

            SqlHelper.Instancia().Ejecutar(query, parameters);
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

            VehiculoId = SqlHelper.Instancia().Insertar(query, parameters);
        }
    }
}
