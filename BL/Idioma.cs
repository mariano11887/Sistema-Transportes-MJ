using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Idioma
    {
        #region Constructores
        public Idioma() { }

        public Idioma(int Id)
        {
            IdiomaDAL idiomaDAL = IdiomaDAL.Obtener(Id);
            ConvertirDesdeDAL(idiomaDAL);
        }
        #endregion

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

        private bool _editable;
        public bool Editable
        {
            get { return _editable; }
            set { _editable = value; }
        }

        private List<Leyenda> _leyendas;
        public List<Leyenda> Leyendas
        {
            get
            {
                if(_leyendas == null)
                {
                    _leyendas = Leyenda.ObtenerTodas(this);
                }
                return _leyendas;
            }
            set { _leyendas = value; }
        }
        #endregion

        #region Métodos públicos
        public void Guardar()
        {
            // Primero el idioma en sí
            IdiomaDAL idiomaDAL = new IdiomaDAL()
            {
                IdiomaId = Id,
                Editable = Editable,
                Nombre = Nombre
            };
            idiomaDAL.Guardar();
            Id = idiomaDAL.IdiomaId;

            // Ahora las leyendas
            LeyendaDAL leyendaDAL = new LeyendaDAL();
            leyendaDAL.IdiomaId = Id;
            foreach(Leyenda leyenda in Leyendas)
            {
                leyendaDAL.NombreControl = leyenda.NombreControl;
                leyendaDAL.NombreForm = leyenda.NombreForm;
                leyendaDAL.Texto = leyenda.Texto;
                leyendaDAL.Guardar();
            }

            // Registro en la bitácora
            BitacoraDAL bitacora = new BitacoraDAL()
            {
                Detalle = "Se guardó el idioma con el id " + Id,
                UsuarioId = Sesion.Instancia().UsuarioLogueado.Id
            };
            bitacora.Guardar();
        }

        public static List<Idioma> ListarTodos()
        {
            List<Idioma> idiomas = new List<Idioma>();
            List<IdiomaDAL> idiomasDAL = IdiomaDAL.ObtenerTodos();
            foreach(IdiomaDAL idiomaDAL in idiomasDAL)
            {
                Idioma idioma = new Idioma();
                idioma.ConvertirDesdeDAL(idiomaDAL);
                idiomas.Add(idioma);
            }
            return idiomas;
        }

        public void Buscar()
        {

        }

        public void Eliminar()
        {

        }

        public override string ToString()
        {
            return Nombre;
        }
        #endregion

        #region Métodos privados
        private void ConvertirDesdeDAL(IdiomaDAL IdiomaDAL)
        {
            Id = IdiomaDAL.IdiomaId;
            Nombre = IdiomaDAL.Nombre;
            Editable = IdiomaDAL.Editable;
        }
        #endregion
    }
}
