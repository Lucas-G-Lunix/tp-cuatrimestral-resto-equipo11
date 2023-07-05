<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CrearPedido.aspx.cs" Inherits="Resto_Web.CrearPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="smPlatos" runat="server"></asp:ScriptManager>
    <h1>Pedido</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4 needs-validation">
                <div class="mb-3">
                    <label for="txtNumeroMesa" class="form-label">Numero Mesa</label>
                    <asp:TextBox runat="server" ID="txtNumeroMesa" CssClass="form-control" ReadOnly="true" />
                </div>

                <div class="mb-3">
                    <label for="txtNumeroPedido" class="form-label">Numero Pedido</label>
                    <asp:TextBox runat="server" ID="txtNumeroPedido" CssClass="form-control" ReadOnly="true" />
                </div>

                <div class="mb-3">
                    <label for="txtNombreCliente" class="form-label">Nombre Cliente</label>
                    <asp:TextBox runat="server" ID="txtNombreCliente" CssClass="form-control" required/>
                </div>
                <% if (Negocio.Seguridad.esAdmin(Session["usuario"]))
                    { %>
                <div class="mb-3">
                    <label for="txtTipo" class="form-label">Seleccione el mesero a asignar el pedido:</label>
                    <asp:DropDownList ID="ddlMesero" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
                <% } %>
                <div class="row">
                    <div class="col">
                        <asp:Button Text="Guardar" CssClass="btn btn-success" ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" OnClientClick="return validar()" autopostback="false"/>
                        <a href="Default.aspx" class="btn btn-warning">Volver</a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="d-flex">
                    <asp:UpdatePanel ID="upPlatos" runat="server">
                        <ContentTemplate>
                            <div class="col">
                                <div class="overflow-auto" style="height: 600px" data-bs-spy="scroll">
                                    <asp:Repeater ID="rpPlatosPedido" runat="server" OnItemDataBound="rpPlatosPedido_ItemDataBound">
                                        <ItemTemplate>
                                            <div class="card mb-3">
                                                <div class="row g-0">
                                                    <div class="col-md-3 d-flex">
                                                        <img style="width: 100%; object-fit: cover" src="/Images/Platos/plato-<%# Eval("IdPlato") %>.jpg" class="img-fluid rounded-start" onerror="this.onerror=null; this.src='Images/Design/no_image.svg'" />
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="card-body">
                                                            <div class="container mb-3">
                                                                <asp:Label ID="lblNombre" runat="server" Text="" CssClass="card-title" Style="display: block;"></asp:Label>
                                                                <span style="display: block;">
                                                                    <asp:Label ID="lblPrecio" runat="server" Text="" CssClass="card-subtitle"></asp:Label>$</span>
                                                            </div>
                                                            <div class="d-flex mb-3">
                                                                <asp:LinkButton ID="btnMenosCantidad" runat="server" OnClick="btnMenosCantidad_Click" OnClientClick="this.parentNode.querySelector('input[type=number]').stepDown()" CssClass="btn btn-link px-2" CommandName="IdPlato" CommandArgument='<%# Eval("IdPlato")%>'>
                                                    <i class="bi bi-dash-square"></i>
                                                                </asp:LinkButton>
                                                                <input name="txtCantidad<%# Eval("IdPlato") %>" min="1" value='<%# Eval("Cantidad") %>' type="number" class="form-control form-control-sm" />

                                                                <asp:LinkButton ID="btnMasCantidad" runat="server" OnClick="btnMasCantidad_Click" OnClientClick="this.parentNode.querySelector('input[type=number]').stepUp()" CssClass="btn btn-link px-2" CommandName="IdPlato" CommandArgument='<%# Eval("IdPlato")%>'>
                                    <i class="bi bi-plus-square"></i>
                                                                </asp:LinkButton>
                                                            </div>
                                                            <div class="d-flex flex-row-reverse">
                                                                <asp:LinkButton ID="btnEliminar" runat="server" CssClass="btn btn-danger" OnClick="btnEliminar_Click" CommandName="IdPlato" CommandArgument='<%# Eval("Id")%>'><i class="bi bi-trash"></i></asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="row">
                                    <div class="d-grid gap-2">
                                        <asp:Button Text="Agregar Platos" CssClass="btn btn-success" ID="btnAgregarProductos" runat="server" OnClick="btnAgregarProductos_Click" />
                                        <asp:Button Text="Finalizar Pedido" CssClass="btn btn-danger" ID="btnFinalizarPedido" runat="server" OnClick="btnFinalizarPedido_Click" />
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
        </div>
    </div>
    <script>
        function validar() {
            var nombreCliente = document.getElementById("ContentPlaceHolder1_txtNombreCliente").value;
            var pattern = /^[a-zA-Z ]*$/;
            if (nombreCliente === "") {
                alert("Debes completar el campo nombre del cliente");
                return false;
            }
            if (!pattern.test(nombreCliente)) {
                alert("Solo se admite texto en el nombre del cliente");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
