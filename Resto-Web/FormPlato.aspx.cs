using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Collections.Specialized.BitVector32;

namespace Resto_Web
{
    public partial class FormPlato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de admin para acceder a esta pantalla");
                Response.Redirect("Error.aspx");
            }
            try
            {
                //configuración inicial de la pantalla.
                if (!IsPostBack)
                {
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

                //configuración si estamos modificando.
                string id = Request.QueryString["IdPlato"] != null ? Request.QueryString["IdPlato"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    PlatoNegocio platoNegocio = new PlatoNegocio();

                    Plato seleccionado = platoNegocio.listar(int.Parse(id));

                    Session.Add("platoSeleccionado", seleccionado);

                    txtId.Text = id;
                    
                    txtNombre.Text = seleccionado.Nombre;

                    txtPrecio.Text = seleccionado.Precio.ToString();

                    txtImagen.Text = seleccionado.ImagenURL;

                    imgPlato.ImageUrl = seleccionado.ImagenURL;
                    
                    ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                    ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Plato nuevo = new Plato();
                PlatoNegocio negocio = new PlatoNegocio();

                nuevo.Id = int.Parse(txtId.Text);
                nuevo.Nombre = txtNombre.Text;
                nuevo.Precio = decimal.Parse(txtPrecio.Text);
                nuevo.ImagenURL = txtImagen.Text;

                nuevo.Tipo = new Etiqueta();
                nuevo.Tipo.Id = int.Parse(ddlTipo.SelectedValue);
                nuevo.Categoria = new Etiqueta();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificar(nuevo);
                }
                else
                {
                    negocio.agregar(nuevo);
                }

                Response.Redirect("Menu.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}