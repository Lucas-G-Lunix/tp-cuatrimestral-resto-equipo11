using System;

namespace Dominio
{
    public class Pedido
    {
        public int Id { get; set; }

        public string NombreCliente { get; set; }

        public int IdMesa { get; set; }

        public int IdMesero { get; set; }

        public DateTime FechaPedido { get; set; }

    }
}
