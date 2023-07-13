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
            panelNotificaciones.Visible = false;
            string reseteo = Request.QueryString["Reseteo"] != null ? Request.QueryString["Reseteo"].ToString() : "";
            if (reseteo != "")
            {
                if (bool.Parse(reseteo))
                {
                    string Error = "Contraseña reestablecida correctamente";
                    lblNotification.Text = Error;
                    divNotifications.Attributes["class"] = "alert alert-success alert-dismissible fade show alert-fixed";
                    panelNotificaciones.Visible = true;
                }            }
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

        protected void btnOlvidoContraseña_Click(object sender, EventArgs e)
        {
            EmailService emailService = new EmailService();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            try
            {
                if (usuarioNegocio.existeUser(txtEmail.Text))
                {
                    string mail = "<h1>Has solicitado reestablecer la contraseña!<h1>" +
                        "<br/> <span>Ingrese al siguiente link para reestablecerla </span><a href=\"https://localhost:44385/ReseteoContrasenia.aspx?IdUser=" + usuarioNegocio.idUser(txtEmail.Text) + "\">link</a>";
                    emailService.armarCorreo(txtEmail.Text, "Solicitud de reestablecimiento de contraseña", mail);
                    emailService.enviarEmail();
                    string Error = "Se envio un mail para la recuperación de la contraseña";
                    lblNotification.Text = Error;
                    divNotifications.Attributes["class"] = "alert alert-success alert-dismissible fade show alert-fixed";
                    panelNotificaciones.Visible = true;
                } else
                {
                    string Error = "El mail ingresado no existe";
                    lblNotification.Text = Error;
                    divNotifications.Attributes["class"] = "alert alert-warning alert-dismissible fade show alert-fixed";
                    panelNotificaciones.Visible = true;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}