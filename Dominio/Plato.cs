namespace Dominio
{
    public class Plato
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public int Stock { get; set; }

        public Etiqueta Tipo { get; set; }

        public Etiqueta Categoria { get; set; }

        public decimal Precio { get; set; }
        
        public string ImagenURL { get; set; }
    }
}
