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

        protected bool _editable;
        public bool Editable
        {
            get { return _editable; }
        }

        protected bool _esPerfil;
        public bool EsPerfil
        {
            get { return _esPerfil; }
        }
        #endregion

        #region Métodos
        public abstract void Guardar();

        public abstract void Borrar();

        public abstract List<Permiso> DevolverPerfil();

        public abstract List<Permiso> ObtenerPermisosHijos();

        public abstract void AgregarPermisoHijo(Permiso permiso);

        public static Permiso ObtenerPermisoRaiz()
        {
            PermisoDAL permisoDAL = PermisoDAL.ObtenerPorNombre(Permisos.RAIZ);
            return ConvertirDesdeDAL(permisoDAL);
        }

        public static List<Permiso> ObtenerPerfiles()
        {
            List<PermisoDAL> perfilesDAL = PermisoDAL.ObtenerPerfiles();
            List<Permiso> perfiles = new List<Permiso>();
            foreach(PermisoDAL perfilDAL in perfilesDAL)
            {
                perfiles.Add(ConvertirDesdeDAL(perfilDAL));
            }
            return perfiles;
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
            permiso._editable = permisoDAL.Editable;
            permiso._esPerfil = permisoDAL.EsPerfil;

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
