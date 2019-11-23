using DAL;

namespace BL
{
    public class DigitoVerificador
    {
        public static bool ChequearDVs()
        {
            return DigitoVerificadorDAL.ChequearDVs();
        }
    }
}
