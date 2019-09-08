using DAL;
using System;
using System.Collections.Generic;
using System.Device.Location;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Terminal
    {
        // Guardo todas las terminales acá para no ir a buscar los mismos datos a la BD muchas veces
        private static List<Terminal> terminales;

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

        public Terminal ObtenerTerminalCercana(int indiceCercania)
        {
            if(terminales == null)
            {
                terminales = TerminalDAL.ListarTodas().Select(dal => new Terminal
                {
                    Direccion = dal.Direccion,
                    Id = dal.Id,
                    Latitud = dal.Latitud,
                    Longitud = dal.Longitud,
                    Nombre = dal.Nombre
                }).ToList();
            }

            if(indiceCercania >= terminales.Count - 1)
            {
                return null;
            }

            GeoCoordinate ubicacion = new GeoCoordinate(Latitud, Longitud);

            // Las ordeno por distancia
            List<Terminal> terminalesOrdenadas = terminales.Where(t => t.Id != Id).Select(t => new
            {
                Distancia = ubicacion.GetDistanceTo(new GeoCoordinate(t.Latitud, t.Longitud)),
                Terminal = t
            }).OrderBy(x => x.Distancia).Select(x => x.Terminal).ToList();

            return terminalesOrdenadas[indiceCercania];
        }

        public static Terminal Obtener(int id)
        {
            TerminalDAL dal = TerminalDAL.Obtener(id);
            return new Terminal
            {
                Direccion = dal.Direccion,
                Id = dal.Id,
                Latitud = dal.Latitud,
                Longitud = dal.Longitud,
                Nombre = dal.Nombre
            };
        }
    }
}
