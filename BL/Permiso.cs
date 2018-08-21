using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public abstract class Permiso
    {
        protected int _id;

        protected string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        protected string _descripcion;
        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }

        public abstract void Guardar();

        public abstract void Borrar();

        public abstract List<Permiso> DevolverPerfil();

        public abstract void AgregarPermisoHijo();

        public static Permiso ObtenerPermisoRaiz()
        {
            return new PermisoSimple();
        }
    }
}
