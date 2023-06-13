using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pedido
    {
        public int IdPedido { get; set; }

        public int IdPlato { get; set; }

        public int IdMesa { get; set; }

   

        public string NombreCliente { get; set; }
        public DateTime FechaPedido { get; set; }

    }
}
