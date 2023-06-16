namespace Dominio
{
    internal class Plato
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public int Tipo { get; set; }

        public CategoriaPlato Categoria { get; set; }

        public decimal Precio { get; set; }
    }
}
