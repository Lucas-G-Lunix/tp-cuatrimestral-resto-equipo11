<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Resto_Web.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #img-cards {
            margin-top: 1px;
            height: 100%;
            width: 100%;
            object-fit: contain;
            max-height: 280px;
            border-radius: 10px;
        }

        #container-img {
            min-height: 300px;
        }

        #ContentPlaceHolder1_btnRecargarFiltros {
            margin-top: 38px;
        }

        ContentPlaceHolder1_chkCombinarFiltros {
            margin-top: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="smUpdate" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upMenu" runat="server">
        <ContentTemplate>
            <div class="container my-3">
                <div class="row my-1">
                    <div class="input-group rounded my-2">
                        <% if (Negocio.Seguridad.esAdmin(Session["usuario"]))
                            { %>
                        <a href="FormPlato.aspx" class="btn btn-primary">Agregar Plato</a>
                        <% } %>
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
                    <div class="col-3">
                        <asp:LinkButton ID="btnRecargarFiltros" runat="server" CssClass="btn btn-primary" OnClick="btnRecargarFiltros_Click">
                            <i class="bi bi-arrow-clockwise"></i> Recargar Filtros
                        </asp:LinkButton>
                    </div>
                </div>

                <div class="row my-2 ms-2">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="chkCombinarFiltros" runat="server">
                        <label class="form-check-label" for="chkCombinarFiltros">
                            Combinar Filtros
                        </label>
                    </div>
                </div>

                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <asp:Repeater ID="rpMenu" runat="server">
                        <ItemTemplate>
                            <div class="col">
                                <div class="card h-100">
                                    <div id="container-img">
                                        <img src="<%# "/Images/Platos/" + Eval("ImagenURL") %>" class="card-img-top" id="img-cards" alt="..." onerror="this.onerror=null; this.src='Images/Design/no_image.svg'">
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                        <p class="card-text">Stock: <%# Eval("Stock") %></p>
                                        <p class="card-text">Tipo: <%# Eval("Tipo") %></p>
                                        <p class="card-text">Categoria: <%# Eval("Categoria") %></p>
                                        <p class="card-text">Precio: <%# Convert.ToInt32(Eval("Precio")) %> $</p>
                                        <%--
                                    Si tiene pedido asignado mostrar Detalle pedido
                                    <asp:Button ID="btnDetallePedido" runat="server" Text="Mostrar Pedido" CssClass="btn btn-primary" />
                                    
                                <asp:Button ID="btnCrearPedido" runat="server" Text="Crear Pedido" CssClass="btn btn-primary" />
                                        --%>
                                        <% if (Negocio.Seguridad.esAdmin(Session["usuario"]))
                                            { %>
                                        <asp:Button ID="btnModificarPlato" runat="server" Text="Modificar" CssClass="btn btn-info" OnClick="btnModificarPlato_Click" CommandArgument='<%# Eval("Id") %>' CommandName="Id" />
                                        <asp:Button ID="btnEliminarPlato" runat="server" Text="Eliminar" CssClass="btn btn-warning" OnClick="btnEliminarPlato_Click" CommandArgument='<%# Eval("Id") %>' CommandName="Id" />
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
