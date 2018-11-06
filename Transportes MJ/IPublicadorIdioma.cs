using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UI
{
    public interface IPublicadorIdioma
    {
        void RegistrarObservador(IObservadorIdioma observador);
        void QuitarObservador(IObservadorIdioma observador);

        void Notificar();
    }
}
