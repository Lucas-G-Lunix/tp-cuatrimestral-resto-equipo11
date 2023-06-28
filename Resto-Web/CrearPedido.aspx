<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CrearPedido.aspx.cs" Inherits="Resto_Web.CrearPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Pedido</h1>
        <hr />
        <div class="container">
            <div class="row">
                <div class="col-md-4">

                    <div class="mb-3">
                        <label for="txtNumeroMesa" class="form-label">Numero Mesa</label>
                        <asp:TextBox runat="server" ID="txtNumeroMesa" CssClass="form-control" readonly/>
                    </div>

                    <div class="mb-3">
                        <label for="txtNumeroPedido" class="form-label">Numero Pedido</label>
                        <asp:TextBox runat="server" ID="txtNumeroPedido" CssClass="form-control" readonly/>
                    </div>

                    <div class="mb-3">
                        <label for="txtID" class="form-label">Nombre Cliente</label>
                        <asp:TextBox runat="server" ID="txtNombreCliente" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label for="txtTipo" class="form-label">Seleccione el mesero a asignar el pedido:</label>
                        <asp:DropDownList ID="ddlMesero" CssClass="form-select" runat="server"></asp:DropDownList>
                    </div>

                    <div class="row">
                    <div class="col">
                        <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" />
                        <a href="Default.aspx" class="btn btn-warning">Volver</a>
                    </div>
                </div>
                </div>
            </div>
        </div>
</asp:Content>
