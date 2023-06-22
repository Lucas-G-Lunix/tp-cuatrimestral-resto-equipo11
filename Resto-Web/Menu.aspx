<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Resto_Web.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-3">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <asp:Repeater ID="rpMenu" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card h-100">
                            <div class="container">
                                <img src="Images/mesa.svg" class="card-img-top" alt="..." onerror="this.onerror=null; this.src='Images/no_image.svg'" height="500">
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
                                    <asp:Button ID="btnModificarPlato" runat="server" Text="Modificar" CssClass="btn btn-info" OnClick="btnModificarPlato_Click" CommandArgument='<%# Eval("Id") %>' CommandName="Id"/>
                                <% } %>
                                
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
