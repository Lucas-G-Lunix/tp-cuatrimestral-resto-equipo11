using Dominio;
using Negocio;
using System;

namespace Resto_Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();
                try
                {
                    usuario.Email = txtEmail.Text;
                    usuario.Pass = txtPassword.Text;
                    if (negocio.Login(usuario))
                    {
                        Session.Add("usuario", usuario);
                        Response.Redirect("Default.aspx", false);
                    }
                    else
                    {
                        Session.Add("error", "User o Pass incorrectos");
                        Response.Redirect("Error.aspx", false);
                    }
                }
                catch (System.Threading.ThreadAbortException)
                {

                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.ToString());
                    Response.Redirect("Error.aspx");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx");
            }
        }
        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();
            Session.Add("error", exc.ToString());
            Server.Transfer("Error.aspx");
        }
    }
}