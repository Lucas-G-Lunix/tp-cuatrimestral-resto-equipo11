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
                RecargarMenu();
                EtiquetaNegocio negocio = new EtiquetaNegocio();
                List<Etiqueta> listaTipo = negocio.listar(true);

                ddlTipo.DataSource = listaTipo;
                ddlTipo.DataValueField = "Id";
                ddlTipo.DataTextField = "Descripcion";
                ddlTipo.DataBind();

                listaTipo = negocio.listar(false);
                ddlCategoria.DataSource = listaTipo;
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataTextField = "Descripcion";
                ddlCategoria.DataBind();
            }
        }

        protected void btnModificarPlato_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;
            Response.Redirect("FormPlato.aspx?IdPlato=" +  valor, false);
        }

        protected void btnEliminarPlato_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;
            PlatoNegocio platoNegocio = new PlatoNegocio();
            platoNegocio.eliminar(Convert.ToInt32(valor));
            RecargarMenu();
        }

        protected void txtFiltrar_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string filtro = txtFiltrar.Text;
                PlatoNegocio platoNegocio = new PlatoNegocio();
                List<Plato> listaPlatos = platoNegocio.listar();
                List<Plato> listaFiltrada;
                listaFiltrada = listaPlatos.FindAll(x =>
                    x.Nombre.ToLower().Contains(filtro.ToLower()));
                rpMenu.DataSource = listaFiltrada;
                rpMenu.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int filtro = int.Parse(ddlTipo.SelectedValue);
                PlatoNegocio platoNegocio = new PlatoNegocio();
                List<Plato> listaPlatos = platoNegocio.listar();
                List<Plato> listaFiltrada;
                listaFiltrada = listaPlatos.FindAll(x =>
                    x.Tipo.Id == filtro);
                rpMenu.DataSource = listaFiltrada;
                rpMenu.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int filtro = int.Parse(ddlCategoria.SelectedValue);
                PlatoNegocio platoNegocio = new PlatoNegocio();
                List<Plato> listaPlatos = platoNegocio.listar();
                List<Plato> listaFiltrada;
                listaFiltrada = listaPlatos.FindAll(x =>
                    x.Categoria.Id == filtro);
                rpMenu.DataSource = listaFiltrada;
                rpMenu.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }

        protected void filtrosCombinados()
        {
            try
            {

            } catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }

        protected void RecargarMenu()
        {
            PlatoNegocio platoNegocio = new PlatoNegocio();
            List<Plato> platos = platoNegocio.listar();
            rpMenu.DataSource = platos;
            rpMenu.DataBind();
        }

        protected void btnRecargarFiltros_Click(object sender, EventArgs e)
        {
            RecargarMenu();
        }
    }
}