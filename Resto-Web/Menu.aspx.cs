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
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PlatoNegocio platoNegocio = new PlatoNegocio();
                List<Plato> platos = platoNegocio.listar();
                rpMenu.DataSource = platos;
                rpMenu.DataBind();
            }
        }

        protected void btnModificarPlato_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;
            Response.Redirect("FormPlato.aspx?IdPlato=" +  valor, false);
        }
    }
}