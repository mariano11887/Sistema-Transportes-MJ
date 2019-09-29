using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public abstract class Permiso
    {
        #region Propiedades
        protected int _id;
        public int Id
        {
            get { return _id; }
        }

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
        #endregion

        #region Métodos
        public abstract void Guardar();

        public abstract void Borrar();

        public abstract List<Permiso> DevolverPerfil();

        public abstract List<Permiso> ObtenerPermisosHijos();

        public abstract void AgregarPermisoHijo(Permiso permiso);

        public abstract void QuitarPermisoHijo(Permiso permiso);

        public static List<Permiso> ObtenerPerfiles()
        {
            List<PermisoDAL> perfilesDAL = PermisoDAL.ObtenerPerfiles();
            return perfilesDAL.Select(dal => ConvertirDesdeDAL(dal)).ToList();
        }

        public static List<Permiso> ObtenerPermisosSimples()
        {
            List<PermisoDAL> permisosDAL = PermisoDAL.ObtenerPermisos();
            return permisosDAL.Select(dal => ConvertirDesdeDAL(dal)).ToList();
        }

        public override string ToString()
        {
            return _nombre;
        }

        public static Permiso ConvertirDesdeDAL(PermisoDAL permisoDAL)
        {
            Permiso permiso;
            if (permisoDAL.PermisosHijosIds.Count == 0)
            {
                permiso = new PermisoSimple();
            }
            else
            {
                permiso = new PermisoCompuesto();
            }

            permiso._id = permisoDAL.PermisoId;
            permiso.Nombre = permisoDAL.Nombre;
            permiso.Descripcion = permisoDAL.Descripcion;

            return permiso;
        }

        public static Permiso NuevoPerfil()
        {
            return new PermisoCompuesto();
        }
        #endregion

        public class Comparador : IEqualityComparer<Permiso>
        {
            public bool Equals(Permiso x, Permiso y)
            {
                return x.Id == y.Id;
            }

            public int GetHashCode(Permiso obj)
            {
                return obj.GetHashCode();
            }
        }
    }
}
