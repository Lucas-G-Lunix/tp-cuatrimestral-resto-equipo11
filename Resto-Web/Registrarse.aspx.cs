using Dominio;
using Negocio;
using System;

namespace Resto_Web
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = new Usuario();
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;
                usuario.Email = txtMail.Text;
                usuario.Pass = txtContraseña.Text;
                usuario.FechaNacimiento = Convert.ToDateTime(txtNacimiento.Text);

                usuarioNegocio.insertarNuevo(usuario);

                if (usuarioNegocio.Login(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Default.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }
        }
    }
}