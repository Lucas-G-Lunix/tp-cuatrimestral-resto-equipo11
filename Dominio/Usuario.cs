using System;

namespace Dominio
{
    public class Usuario
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public string Email { get; set; }

        public string ImagenURL { get; set; }

        public string Pass { get; set; }

        public DateTime FechaNacimiento { get; set; }
    }
}
