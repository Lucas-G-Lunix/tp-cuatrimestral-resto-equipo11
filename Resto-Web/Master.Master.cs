using Dominio;
using Negocio;
using System;

namespace Resto_Web
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgPerfil.ImageUrl = "Images/Design/no_image.svg";

            if (!(Page is Login || Page is Registrarse || Page is Error))
            {
                if (!Seguridad.sesionActiva(Session["usuario"]))
                    Response.Redirect("Login.aspx", false);
                else
                {
                    Usuario user = (Usuario)Session["usuario"];
                    //lblUser.Text = user.Email;
                    if (!string.IsNullOrEmpty(user.ImagenURL))
                    {
                        imgPerfil.ImageUrl = "~/Images/Usuarios/" + user.ImagenURL;
                    }
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}