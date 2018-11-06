using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UI
{
    public class GestorDeIdioma : IPublicadorIdioma
    {
        private static GestorDeIdioma _instancia;

        private readonly List<IObservadorIdioma> _observadores;

        private GestorDeIdioma()
        {
            _observadores = new List<IObservadorIdioma>();
        }

        public static GestorDeIdioma Instancia()
        {
            if(_instancia == null)
            {
                _instancia = new GestorDeIdioma();
            }
            return _instancia;
        }

        public void Notificar()
        {
            foreach(IObservadorIdioma obs in _observadores)
            {
                obs.ActualizarLeyendas();
            }
        }

        public void QuitarObservador(IObservadorIdioma observador)
        {
            _observadores.Remove(observador);
        }

        public void RegistrarObservador(IObservadorIdioma observador)
        {
            _observadores.Add(observador);
        }
    }
}
