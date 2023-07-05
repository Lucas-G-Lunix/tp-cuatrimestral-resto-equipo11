<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="Resto_Web.Registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registrarse</h3>

                                <div class="row">
                                    <div class="col-md-6 mb-4">

                                        <div class="form-outline">
                                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control form-control-lg" type="text"></asp:TextBox>
                                            <label class="form-label" for="firstName">Nombre</label>
                                        </div>

                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control form-control-lg" type="text"></asp:TextBox>
                                            <label class="form-label" for="lastName">Apellido</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="mb-4 pb-2">
                                        <div class="form-outline">
                                            <asp:TextBox ID="txtMail" runat="server" TextMode="Email" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label class="form-label" for="emailAddress">Email</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="mb-4 pb-2">
                                        <div class="form-outline">
                                            <asp:TextBox ID="txtContraseña" runat="server" CssClass="form-control form-control-lg" TextMode="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="La contraseña debe contener al menos un numero, una letra mayuscula, una letra minuscula, y por lo menos 8 caracteres"></asp:TextBox>
                                            <label class="form-label" for="txtContraseña">Contraseña</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-4 pb-2">
                                        <div class="form-outline datepicker w-100">
                                            <asp:TextBox ID="txtNacimiento" runat="server" TextMode="Date" CssClass="form-control form-control-lg"></asp:TextBox>
                                            <label for="birthdayDate" class="form-label">Fecha Nacimiento</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 d-flex justify-content-center">
                                        <div class="form-outline">
                                            <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar Registro" CssClass="btn btn-success btn-block btn-lg text-body" OnClientClick="return validar()" OnClick="btnConfirmar_Click" autopostback="false" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        function validar() {
            var nombre = document.getElementById("ContentPlaceHolder1_txtNombre").value;
            var apellido = document.getElementById("ContentPlaceHolder1_txtApellido").value;
            var mail = document.getElementById("ContentPlaceHolder1_txtMail").value;
            var contraseña = document.getElementById("ContentPlaceHolder1_txtContraseña").value;

            var patternTexto = /^[a-zA-Z ]*$/;
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

            if (contraseña === "") {
                alert("Debes completar el campo de la contraseña");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
