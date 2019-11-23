namespace UI
{
    public interface IPublicadorIdioma
    {
        void RegistrarObservador(IObservadorIdioma observador);
        void QuitarObservador(IObservadorIdioma observador);

        void Notificar();
    }
}
