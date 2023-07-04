namespace Dominio
{
    public class Mesa
    {
        public int Id { get; set; }

        public int NumeroMesa { get; set; }

        public int? IdMesero { get; set; }

        public int? IdPedido { get; set; }
    }
}
