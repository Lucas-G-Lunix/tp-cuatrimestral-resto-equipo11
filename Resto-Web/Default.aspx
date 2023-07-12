<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Resto_Web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        .alert-fixed {
            position: fixed;
            top: 0px;
            left: 0px;
            width: 100%;
            z-index: 9999;
            border-radius: 0px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="smUpdate" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upMenu" runat="server">
        <ContentTemplate>
            <div class="container my-3">
                <asp:PlaceHolder ID="panelNotificaciones" runat="server">
                    <div role="alert" id="divNotifications" runat="server" class="alert-fixed">
                        <asp:Label ID="lblNotification" runat="server" Text="Label"></asp:Label>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </asp:PlaceHolder>
                <div class="row my-2">
                    <div class="col">
                        <% if (Negocio.Seguridad.esAdmin(Session["usuario"]))
                            { %>
                        <asp:Button ID="btnAgregarMesa" runat="server" Text="Agregar Mesa" CssClass="btn btn-success" OnClick="btnAgregarMesa_Click" />
                        <% } %>
                    </div>
                </div>
                <div class="row row-cols-1 row-cols-md-4 g-4">
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
                                            <asp:Button ID="btnCrearPedido" runat="server" Text='<%# Convert.ToInt32(Eval("IdPedido")) == 0 ? "Crear Pedido" : "Mostrar Pedido"%>' CssClass="btn btn-info" type="button" OnClick="btnCrearPedido_Click" CommandArgument='<%# Eval("Id") %>' CommandName="Id" />
                                            <% 
                                                if (Negocio.Seguridad.esAdmin(Session["usuario"]))
                                                {
                                            %>
                                            <asp:Button ID="btnEliminarMesa" runat="server" Text="Eliminar Mesa" CssClass="btn btn-danger" Visible='<%#Container.ItemIndex==(rpMesas.DataSource as IList).Count-1? true : false %>' type="button" OnClick="btnEliminarMesa_Click" CommandArgument='<%# Eval("Id") %>' CommandName="Id" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
