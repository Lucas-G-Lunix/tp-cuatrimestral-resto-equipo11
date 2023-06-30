<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CrearPedido.aspx.cs" Inherits="Resto_Web.CrearPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        img {
            max-width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Pedido</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="mb-3">
                    <label for="txtNumeroMesa" class="form-label">Numero Mesa</label>
                    <asp:TextBox runat="server" ID="txtNumeroMesa" CssClass="form-control" ReadOnly />
                </div>

                <div class="mb-3">
                    <label for="txtNumeroPedido" class="form-label">Numero Pedido</label>
                    <asp:TextBox runat="server" ID="txtNumeroPedido" CssClass="form-control" ReadOnly />
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
                        <asp:Button Text="Guardar" CssClass="btn btn-success" ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" />
                        <a href="Default.aspx" class="btn btn-warning">Volver</a>
                    </div>
                </div>
            </div>
            <div class="col">

                <div class="d-flex">
                                <div class="col">
                                    <div class="overflow-auto" style="height: 600px">
                                        <div class="card mb-3">
                                            <div class="row g-0">
                                                <div class="col-md-3 d-flex">
                                                    <img src="/Images/Platos/plato-5.jpg" class="img-fluid rounded-start" />
                                                </div>

                                                <div class="col-md-8">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Producto 1</h5>
                                                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                        <a href="#" class="btn btn-primary">Button</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card mb-3">
                                            <div class="row g-0">
                                                <div class="col-md-3 d-flex">
                                                    <img src="/Images/Platos/plato-6.jpg" class="img-fluid rounded-start" />
                                                </div>

                                                <div class="col-md-8">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Producto 2</h5>
                                                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                        <a href="#" class="btn btn-primary">Button</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card mb-3">
                                            <div class="row g-0">
                                                <div class="col-md-3 d-flex">
                                                    <img src="/Images/Platos/plato-7.jpg" class="img-fluid rounded-start" />
                                                </div>

                                                <div class="col-md-8">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Producto 3</h5>
                                                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                        <a href="#" class="btn btn-primary">Button</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card mb-3">
                                            <div class="row g-0">
                                                <div class="col-md-3 d-flex">
                                                    <img src="/Images/Platos/plato-8.jpg" class="img-fluid rounded-start" />
                                                </div>

                                                <div class="col-md-8">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Producto 4</h5>
                                                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                        <a href="#" class="btn btn-primary">Button</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <a href="#" class="btn btn-success ">Finalizar Pedido</a>
                                        <%--<asp:Button Text="Finalizar Pedido" CssClass="btn btn-success" ID="btnFinalizarPedido" runat="server" OnClick="btnTerminarPedido_Click" />--%>
                                    </div>
                                </div>
                            </div>
            </div>
        </div>
    </div>
</asp:Content>
