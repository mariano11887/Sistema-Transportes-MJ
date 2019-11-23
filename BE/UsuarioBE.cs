using System.Collections.Generic;

namespace BE
{
    public class UsuarioBE
    {
        private int _id;
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _nombreDeUsuario;
        public string NombreDeUsuario
        {
            get { return _nombreDeUsuario; }
            set { _nombreDeUsuario = value; }
        }

        private string _contrasenia;
        public string Contrasenia
        {
            get { return _contrasenia; }
            set { _contrasenia = value; }
        }

        private string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private List<PermisoBE> _perfil;
        public List<PermisoBE> Perfil
        {
            get { return _perfil; }
            set { _perfil = value; }
        }

        private IdiomaBE _idioma;
        public IdiomaBE Idioma
        {
            get { return _idioma; }
            set { _idioma = value; }
        }

        public override string ToString()
        {
            return Nombre;
        }
    }
}
