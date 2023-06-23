<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Resto_Web.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #img-cards {
            margin-top: 3px;
            height: 100%;
            width: 100%;
            object-fit: contain;
            max-height: 300px;
            border-radius: 30px;
        }

        #container-img {
            min-height: 300px;
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

                <div class="row row-cols-1 row-cols-md-3 g-4">

                    <asp:Repeater ID="rpMenu" runat="server">
                        <ItemTemplate>
                            <div class="col">
                                <div class="card h-100">
                                    <div id="container-img">
                                        <img src="<%# Eval("ImagenURL") %>" class="card-img-top" id="img-cards" alt="..." onerror="this.onerror=null; this.src='Images/Design/no_image.svg'">
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                        <p class="card-text">Tipo: <%# Eval("Tipo") %></p>
                                        <p class="card-text">Categoria: <%# Eval("Categoria") %></p>
                                        <p class="card-text">Precio: <%# Eval("Precio") %></p>
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
