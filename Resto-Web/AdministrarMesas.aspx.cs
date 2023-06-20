using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Resto_Web
{
    public partial class AdministrarMesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MesaNegocio mesaNegocio = new MesaNegocio();
            List<Mesa> mesas = mesaNegocio.listar();
            gvMesas.DataSource = mesas;
            gvMesas.DataBind();
        }

        protected void gvMesas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}