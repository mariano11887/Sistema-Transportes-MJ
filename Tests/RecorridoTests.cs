using System;
using System.Collections.Generic;
using BL;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Tests
{
    [TestClass]
    public class RecorridoTests
    {
        [TestMethod]
        public void ObtenerTodosLosRecorridos()
        {
            List<Recorrido> recorridos = Recorrido.ListarTodos();
            Assert.IsTrue(recorridos.Count > 0);
        }
    }
}
