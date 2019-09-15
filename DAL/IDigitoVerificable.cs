using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    internal interface IDigitoVerificable
    {
        string ObtenerNombreTabla();
        List<RegistroParaDV> ObtenerRegistrosParaDV();
    }
}
