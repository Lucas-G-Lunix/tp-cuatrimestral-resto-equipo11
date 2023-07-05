using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

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

                    txtStock.Text = seleccionado.Stock.ToString();

                    txtPrecio.Text = Convert.ToInt32(seleccionado.Precio).ToString();

                    imgPlato.ImageUrl = seleccionado.ImagenURL;

                    Session.Add("seleccionado", seleccionado);


                    if (!string.IsNullOrEmpty(seleccionado.ImagenURL))
                        imgPlato.ImageUrl = "~/Images/Platos/" + seleccionado.ImagenURL;

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
                Plato seleccionado = (Plato)Session["seleccionado"] != null ? (Plato)Session["seleccionado"] : null; 
                Plato nuevo = new Plato();
                PlatoNegocio negocio = new PlatoNegocio();

                if (Request.QueryString["IdPlato"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                }
                else
                {
                    nuevo.Id = negocio.ultimoId();
                }
                nuevo.Nombre = txtNombre.Text;
                nuevo.Stock = int.Parse(txtStock.Text);
                nuevo.Precio = decimal.Parse(txtPrecio.Text);

                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Images/Platos/");
                    txtImagen.PostedFile.SaveAs(ruta + "plato-" + nuevo.Id + ".jpg");
                    nuevo.ImagenURL = "plato-" + nuevo.Id + ".jpg";
                } else if (seleccionado != null)
                {
                    nuevo.ImagenURL = seleccionado.ImagenURL;
                }

                nuevo.Tipo = new Etiqueta();
                nuevo.Tipo.Id = int.Parse(ddlTipo.SelectedValue);
                nuevo.Categoria = new Etiqueta();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

                if (Request.QueryString["IdPlato"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificar(nuevo);
                    Response.Redirect("Menu.aspx?plato=false", false);
                }
                else
                {
                    negocio.agregar(nuevo);
                    Response.Redirect("Menu.aspx?plato=true", false);
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}