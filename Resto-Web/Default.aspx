<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Resto_Web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .centered {
            position: absolute;
            top: 25%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

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
    <div class="container my-3">
        <div class="row my-2">
            <div class="col">
                <% if (Negocio.Seguridad.esAdmin(Session["usuario"]))
                    { %>
                <asp:Button ID="btnAgregarMesa" runat="server" Text="Agregar Mesa" CssClass="btn btn-success" OnClick="btnAgregarMesa_Click"/>
                <% } %>
            </div>
        </div>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <asp:Repeater ID="rpMesas" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card">
                            <div class="container" id="container-img">
                                <img src="Images/Design/mesa.svg" class="card-img-top" id="img-cards" alt="..." onerror="this.onerror=null; this.src='Images/Design/no_image.svg'" height="500">
                                <div class="centered display-1 fw-bold"><%# Eval("NumeroMesa") %></div>
                            </div>
                            <div class="card-body">
                                <h6 class="card-title">Numero Mesero: <%# Convert.ToInt32(Eval("IdMesero")) == 0 ? "No Asignado" : Eval("IdMesero")%></h6>
                                <h6 class="card-title">Numero Pedido: <%# Convert.ToInt32(Eval("IdPedido")) == 0 ? "No Asignado" : Eval("IdPedido")%></h6>
                                <hr />
                                <div class="d-grid gap-2 d-md-block">

                                    <%
                                        bool hayPedido = true;
                                        if (hayPedido)
                                        {
                                    %>
                                    <asp:Button ID="btnDetallePedido" runat="server" Text="Mostrar Pedido" CssClass="btn btn-primary" type="button" />
                                    <%
                                        }
                                        else
                                        {
                                    %>
                                    <asp:Button ID="btnCrearPedido" runat="server" Text="Crear Pedido" CssClass="btn btn-primary" type="button" />
                                    <% 
                                        }
                                    %>

                                    <% 
                                        if (Negocio.Seguridad.esAdmin(Session["usuario"]))
                                        {
                                    %>
                                    <asp:Button ID="btnEliminarMesa" runat="server" Text="Eliminar Mesa" CssClass="btn btn-info" OnClick="btnEliminarMesa_Click" CommandArgument='<%# Eval("Id") %>' CommandName="Id" />
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
