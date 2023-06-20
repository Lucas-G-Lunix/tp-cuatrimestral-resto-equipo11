<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Resto_Web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .centered {
            position: absolute;
            top: 34%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
    <div class="container my-3">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <asp:Repeater ID="rpMesas" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card h-100">
                            <div class="container">
                                <img src="Images/mesa.svg" class="card-img-top" alt="..." onerror="this.onerror=null; this.src='Images/no_image.svg'" height="500">
                                <div class="centered fs-1 fw-bold"><%# Eval("NumeroMesa") %></div>
                            </div>

                            <div class="card-body">
                                <p class="card-text">Numero Mesero: <%# Eval("IdMesero") %></p>
                                <%--Si tiene pedido asignado mostrar Detalle pedido
                                    <asp:Button ID="btnDetallePedido" runat="server" Text="Mostrar Pedido" CssClass="btn btn-primary" />
                                    --%>
                                <asp:Button ID="btnCrearPedido" runat="server" Text="Crear Pedido" CssClass="btn btn-primary" />
                                <asp:Button ID="btnDetallePedido" runat="server" Text="Mostrar Pedido" CssClass="btn btn-primary" />
                                
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
