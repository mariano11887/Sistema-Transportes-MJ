using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Chofer
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

        private int _dni;

        public int Dni
        {
            get { return _dni; }
            set { _dni = value; }
        }

        private Vehiculo _cochePreferido;
        private int _cochePreferidoId;

        public Vehiculo CochePreferido
        {
            get
            {
                if(_cochePreferido == null && _cochePreferidoId > 0)
                {
                    _cochePreferido = Vehiculo.Buscar(_cochePreferidoId);
                }
                return _cochePreferido;
            }
            set { _cochePreferido = value; }
        }

        private DateTime _fechaFinLicencia;

        public DateTime FechaFinLicencia
        {
            get { return _fechaFinLicencia; }
            set { _fechaFinLicencia = value; }
        }
        #endregion

        public static List<Chofer> Buscar(string nombre, int dni, bool? deLicencia, string patenteCochePreferido)
        {
            int cochePreferidoId = 0;
            if(!string.IsNullOrWhiteSpace(patenteCochePreferido))
            {
                Vehiculo cochePreferido = Vehiculo.Buscar(patenteCochePreferido, 0, null).FirstOrDefault();
                if(cochePreferido != null)
                {
                    cochePreferidoId = cochePreferido.Id;
                }
            }

            return ChoferDAL.Buscar(nombre, dni, deLicencia, cochePreferidoId).Select(c => new Chofer
            {
                _cochePreferidoId = c.CochePreferidoId,
                Dni = c.Dni,
                FechaFinLicencia = c.FechaFinLicencia,
                Id = c.Id,
                Nombre = c.Nombre
            }).ToList();
        }

        public void Guardar()
        {
            ChoferDAL choferDAL = new ChoferDAL
            {
                CochePreferidoId = CochePreferido?.Id ?? 0,
                Dni = Dni,
                FechaFinLicencia = FechaFinLicencia,
                Habilitado = true,
                Id = Id,
                Nombre = Nombre
            };
            choferDAL.Guardar();

            BitacoraDAL bitacoraDAL = new BitacoraDAL
            {
                Detalle = "Se guardó el chofer con Id " + choferDAL.Id,
                UsuarioId = Sesion.Instancia().UsuarioLogueado.Id
            };
            bitacoraDAL.Guardar();
        }

        public void Borrar()
        {
            ChoferDAL.Borrar(Id);

            BitacoraDAL bitacoraDAL = new BitacoraDAL
            {
                Detalle = "Se borró el chofer con Id " + Id,
                UsuarioId = Sesion.Instancia().UsuarioLogueado.Id
            };
            bitacoraDAL.Guardar();
        }
    }
}
