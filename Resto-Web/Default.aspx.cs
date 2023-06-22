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
            MesaNegocio mesaNegocio = new MesaNegocio();
            List<Mesa> mesas = mesaNegocio.listar();
            rpMesas.DataSource = mesas;
            rpMesas.DataBind();
        }

        protected void btnEliminarMesa_Click(object sender, EventArgs e)
        {

        }
    }
}