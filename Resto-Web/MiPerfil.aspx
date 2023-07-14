<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Resto_Web.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Mi Perfil</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" MaxLength="8">
                </asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha de Nacimiento</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtFechaNacimiento" TextMode="Date" />
            </div>
        </div>
        <div class="col-md-4">
            <div class="mb-3">
                <label class="form-label">Imagen Perfil</label>
                <input type="file" id="txtImagen" runat="server" class="form-control" />
            </div>
            <asp:Image ID="imgNuevoPerfil" ImageUrl="./Images/Design/no_image.svg"
                runat="server" CssClass="img-fluid mb-3" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <asp:Button Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" OnClientClick="return validar();"/>
            <a href="Default.aspx">Regresar</a>
        </div>
    </div>

    <script>
        function validar() {
            var nombre = document.getElementById("ContentPlaceHolder1_txtNombre").value;
            var apellido = document.getElementById("ContentPlaceHolder1_txtApellido").value;
            var mail = document.getElementById("ContentPlaceHolder1_txtEmail").value;
            var fechaNacimiento = document.getElementById("ContentPlaceHolder1_txtFechaNacimiento").value;

            var patternTexto = /^[A-Za-zñÑáéíóúÁÉÍÓÚ\s]*$/;
            var patternMail = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

            if (nombre === "") {
                alert("Debes completar el campo nombre");
                return false;
            }
            if (!patternTexto.test(nombre)) {
                alert("El campo nombre solo puede contener texto");
                return false;
            }

            if (apellido === "") {
                alert("Debes completar el campo apellido");
                return false;
            }
            if (!patternTexto.test(apellido)) {
                alert("El campo apellido solo puede contener texto");
                return false;
            }

            if (mail === "") {
                alert("Debes completar el campo mail");
                return false;
            }
            if (!patternMail.test(mail)) {
                alert("El mail no es valido");
                return false;
            }

            if (fechaNacimiento === "") {
                alert("Debes completar el campo de la fecha de nacimiento");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
