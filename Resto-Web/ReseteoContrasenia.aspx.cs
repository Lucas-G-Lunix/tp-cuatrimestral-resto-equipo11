using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class ReseteoContraseñia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["IdUser"] != null ? Request.QueryString["IdUser"].ToString() : "";
            if (id == "")
            {
                Response.Redirect("Default.aspx", false);
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["IdUser"] != null ? Request.QueryString["IdUser"].ToString() : "";
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            usuarioNegocio.actualizarContraseña(int.Parse(id), txtContrasenia.Text);
            Response.Redirect("Login.aspx?Reseteo=true", false);
        }
    }
}