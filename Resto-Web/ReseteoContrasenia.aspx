<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ReseteoContrasenia.aspx.cs" Inherits="Resto_Web.ReseteoContraseñia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Resetear Contraseña</h3>
                            <div class="row">
                                <div class="mb-4 pb-2">
                                    <div class="form-outline">
                                        <label class="form-label" for="txtContrasenia">Ingrese la contraseña:</label>
                                        <asp:TextBox ID="txtContrasenia" runat="server" Text="" CssClass="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-4 pb-2">
                                    <div class="form-outline">
                                        <label class="form-label" for="txtConfirmacionContraseña">Confirmar contraseña:</label>
                                        <asp:TextBox ID="txtConfirmacionContraseña" runat="server" Text="" CssClass="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-4 pb-2">
                                    <div class="form-outline">
                                        <asp:Button ID="btnConfirmar" runat="server" Text="Cambiar Contraseña" CssClass="btn btn-success btn-block btn-lg text-body" OnClientClick="return validar()" autopostback="false" OnClick="btnConfirmar_Click"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        function validar() {
            var contrasenia = document.getElementById("ContentPlaceHolder1_txtContrasenia").value;
            var confirmacionContrasenia = document.getElementById("ContentPlaceHolder1_txtConfirmacionContraseña").value;
            var patternContrasenia = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
            if (contrasenia === "" || confirmacionContrasenia === "") {
                alert("Debes completar ambos campo con la contraseña");
                return false;
            }
            if (!(contrasenia === confirmacionContrasenia)) {
                alert("Las contraseñas no coinciden");
                return false;
            }
            if (!patternContrasenia.test(contrasenia)) {
                alert("La contraseña no es valida. Esta debe contener al menos un numero, una letra mayuscula, una letra minuscula, y por lo menos 8 caracteres");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
