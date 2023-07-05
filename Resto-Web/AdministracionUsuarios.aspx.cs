using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class AdministracionUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RecargarGrilla();
            }
        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvUsuarios.SelectedDataKey.Value.ToString();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
        }

        protected void RecargarGrilla()
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            gvUsuarios.DataSource = usuarioNegocio.listarTodos();
            gvUsuarios.DataBind();
        }

        protected void btnCambiarAdmin_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            int rowIndex = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            int id = Convert.ToInt32(gvUsuarios.DataKeys[rowIndex].Value.ToString());
            usuarioNegocio.cambiarAdmin(id, true);
            RecargarGrilla();
        }

        protected void btnQuitarAdmin_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            int rowIndex = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            int id = Convert.ToInt32(gvUsuarios.DataKeys[rowIndex].Value.ToString());
            usuarioNegocio.cambiarAdmin(id, false);
            RecargarGrilla();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            int rowIndex = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            int id = Convert.ToInt32(gvUsuarios.DataKeys[rowIndex].Value.ToString());
            usuarioNegocio.eliminar(id);
            RecargarGrilla();
        }
    }
}