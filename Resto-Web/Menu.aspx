<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Resto_Web.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #ContentPlaceHolder1_btnRecargarFiltros {
            margin-top: 38px;
        }

        ContentPlaceHolder1_chkCombinarFiltros {
            margin-top: 38px;
        }

        .card-img-top {
            width: 100%;
            height: 15vw;
            object-fit: cover;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="smUpdate" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upMenu" runat="server">
        <ContentTemplate>
            <div class="container my-3">
                <asp:Panel ID="panelNotifications" runat="server">
                </asp:Panel>
                <div class="row my-1">
                    <div class="input-group my-2">
                        <div class="d-grid gap-3 d-md-block mx-2">
                            <% if (Negocio.Seguridad.esAdmin(Session["usuario"]))
                                { %>
                            <a href="FormPlato.aspx" class="btn btn-outline-success">Agregar Plato</a>

                            <a href="AdministrarCategoria.aspx" class="btn btn-outline-info">Administrar Categorias</a>

                            <a href="AdministrarTipo.aspx" class="btn btn-outline-primary">Administrar Tipo</a>
                            <% } %>
                        </div>
                        <asp:TextBox ID="txtFiltrar" runat="server" AutoPostBack="true" CssClass="form-control rounded mx-1" placeholder="Buscar" aria-describedby="search-addon" OnTextChanged="txtFiltrar_TextChanged"></asp:TextBox>
                        <span class="input-group-text border-2 mx-2">
                            <i class="bi bi-search"></i>
                        </span>
                    </div>
                </div>

                <div class="row">
                    <div class="col">

                        <label for="txtTipo" class="form-label">Tipo</label>
                        <asp:DropDownList ID="ddlTipo" CssClass="form-select" runat="server" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <div class="col">
                        <label for="txtCategoria" class="form-label">Categoria</label>
                        <asp:DropDownList ID="ddlCategoria" CssClass="form-select" runat="server" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <div class="col-4">
                        <div class="row align-items-end gap-0">
                            <div class="col">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="chkCombinarFiltros" runat="server">
                                    <label class="form-check-label" for="chkCombinarFiltros">
                                        Combinar Filtros
                                    </label>
                                </div>
                            </div>
                            <div class="col">
                                <asp:LinkButton ID="btnRecargarFiltros" runat="server" CssClass="btn btn-primary" OnClick="btnRecargarFiltros_Click">
                                <i class="bi bi-arrow-clockwise"></i> Recargar Filtros
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row my-2 ms-2">
                </div>

                <div class="row row-cols-1 row-cols-md-4 g-4">
                    <asp:Repeater ID="rpMenu" runat="server">
                        <ItemTemplate>
                            <div class="col">
                                <div class="card h-100">
                                    <img src="<%# "/Images/Platos/" + Eval("ImagenURL") %>" class="card-img-top img-fluid" alt="..." onerror="this.onerror=null; this.src='Images/Design/no_image.svg'">
                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                        <p class="card-text">Stock: <%# Eval("Stock") %></p>
                                        <p class="card-text">Tipo: <%# Eval("Tipo") %></p>
                                        <p class="card-text">Categoria: <%# Eval("Categoria") %></p>
                                        <p class="card-text">Precio: <%# Convert.ToInt32(Eval("Precio")) %> $</p>
                                        <hr />
                                        <div class="d-grid gap-2 d-md-block">
                                            <% if (Request.QueryString["IdPedido"] != null)
                                                { %>
                                            <h6>Cantidad</h6>
                                            <div class="d-flex mb-2">
                                                <input id="txtCantidad<%# Eval("Id") %>" name="txtCantidad<%# Eval("Id") %>" min="1" value="1" type="number" class="form-control form-control-sm" />
                                            </div>
                                            <asp:Button ID="btnAgregarAlPedido" runat="server" Text="Agregar Al Pedido" CssClass="btn btn-success" OnClick="btnAgregarAlPedido_Click" CommandArgument='<%# Eval("Id") %>' CommandName="Id" />
                                            <% }
                                                else
                                                { %>
                                            <% if (Negocio.Seguridad.esAdmin(Session["usuario"]))
                                                { %>
                                            <asp:Button ID="btnModificarPlato" runat="server" Text="Modificar" CssClass="btn btn-warning" OnClick="btnModificarPlato_Click" CommandArgument='<%# Eval("Id") %>' CommandName="Id" />
                                            <asp:Button ID="btnEliminarPlato" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminarPlato_Click" CommandArgument='<%# Eval("Id") %>' CommandName="Id" />
                                            <% } %>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="position-fixed" style="position: fixed; bottom: 20px; right: 20px;">
                        <% if (Request.QueryString["IdPedido"] != null)
                            { %>
                        <asp:Button ID="btnFinalizarPedido" runat="server" Text="Finalizar Pedido" CssClass="btn btn-success" OnClick="btnFinalizarPedido_Click" />
                        <% } %>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
