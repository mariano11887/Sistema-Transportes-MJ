﻿using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
