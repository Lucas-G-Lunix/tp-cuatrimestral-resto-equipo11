using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Resto_Web
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                recargarCards();
            }
        }

        protected void btnEliminarMesa_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;
            MesaNegocio mesaNegocio = new MesaNegocio();
            mesaNegocio.eliminar(Convert.ToInt32(valor));
            recargarCards();
        }

        protected void btnAgregarMesa_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;
            MesaNegocio mesaNegocio = new MesaNegocio();
            mesaNegocio.agregar();
            recargarCards();
        }

        protected void recargarCards()
        {
            MesaNegocio mesaNegocio = new MesaNegocio();
            if (Seguridad.esAdmin(Session["usuario"]))
            {
                List<Mesa> mesas = mesaNegocio.listar();
                rpMesas.DataSource = mesas;
                rpMesas.DataBind();
            } else
            {
                if ((Usuario)Session["usuario"] != null)
                {
                    Usuario usuario = (Usuario)Session["usuario"];
                    List<Mesa> mesas = mesaNegocio.listarMesero(usuario.Id);
                    rpMesas.DataSource = mesas;
                    rpMesas.DataBind();
                }
            }
        }

        protected void btnCrearPedido_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;
            Response.Redirect("CrearPedido.aspx?IdMesa=" + valor, false);
        }
    }
}