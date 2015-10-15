<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EnviaTuCV.aspx.cs" Inherits="Codene.EnviaTuCV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Content/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/jquery-ui.min.js"></script>
    <%--    <script src="Scripts/jquery.ui.datepicker-es.js"></script>--%>
    <style type="text/css">
        label {
            width: 150px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#txtFechaNacimiento").datepicker({
                showOn: 'button',
                buttonImage: 'Images/calendar.jpg',
                buttonImageOnly: true
            });
        });

        function guardarFecha() {

            var txtFechaNacimiento = document.getElementById("txtFechaNacimiento");
            document.getElementById('<%=txtFechaNacimientoHide.ClientID%>').value = txtFechaNacimiento.value;
        }
    </script>
    <script src="Scripts/jquery.MultiFile.js"></script>
    <style type="text/css">
        .MultiFile-label a {
            width: 50px;
            height: 30px;
            background-color: #fb4141;
            color: #FFF;
            border: 0;
            padding: 3px 7px;
            text-decoration: none;
        }

            .MultiFile-label a:hover {
                width: 50px;
                height: 30px;
                background-color: red;
                color: #e5e5e5;
                border: 0;
                padding: 3px 7px;
                text-decoration: none;
            }

        .MultiFile-list {
            height: 300px;
            width: 300px;
            padding: 10px 16px;
            border: dashed silver 1px;
            background-color: #f9f4f4;
        }

        .MultiFile-label {
            padding-top: 5px;
            padding-bottom: 5px;
            margin-top: 10px;
        }

        .Multifile-UploadAllButton {
            width: 75px;
            height: 30px;
            background-color: #6262e9;
            color: #FFF;
            border: 0;
            text-decoration: none;
            text-align: center;
        }

            .Multifile-UploadAllButton:hover {
                width: 75px;
                height: 30px;
                background-color: #2f2fe7;
                color: #e5e5e5;
                border: 0;
                text-decoration: none;
                text-align: center;
                cursor: pointer;
            }

        .Multifile-UploadAll-div-Button {
            text-align: right;
        }

        .Multifile-vk-panel {
            width: 335px;
            height: 350px;
        }
    </style>
    <script src="Scripts/Mascara.js"></script>
    <script src="Scripts/ValidaFecha.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <%--<section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h3>Enviá tu CV</h3>
            </hgroup>
        </div>
    </section>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Enviá tu CV</h2>
    <div id="Contactanos" style="float: left; width: 700px;">
        <br />
        <div style="margin: auto; border-radius: 5px; padding-top: 7px; padding-bottom: 7px; text-align: left;">
            <div style="text-align: left; width: 610px; margin: auto;">
                <label for="nombres">Nombre *</label>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Debe completar el campo nombre"
                    Text="*" ControlToValidate="txtNombre" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtNombre" ValidationGroup="valida"></asp:TextBox>
                <br />
                <label for="apellido">Apellido *</label>
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ErrorMessage="Debe completar el campo apellido"
                    Text="*" ControlToValidate="txtApellido" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtApellido"></asp:TextBox>
                <br />
                <label for="documento">Documento *</label>
                <asp:RequiredFieldValidator ID="rfvDocumento" runat="server" ErrorMessage="Debe completar el campo documento"
                    Text="*" ControlToValidate="txtDocumento" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtDocumento"></asp:TextBox>
                <br />
                <label for="sexo">Sexo *</label>
                <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ErrorMessage="Debe completar el campo sexo"
                    Text="*" ControlToValidate="ddlSexo" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:DropDownList runat="server" ID="ddlSexo">
                    <asp:ListItem Text="(Seleccione)" Value="0" />
                    <asp:ListItem Text="Femenino" Value="Femenino" />
                    <asp:ListItem Text="Masculino" Value="Masculino" />
                </asp:DropDownList>
                <br />
                <label for="fechaNacimiento">Fecha de Nacimiento *</label>
                <asp:HiddenField ID="hfFechaNacimiento" runat="server" />
                <asp:TextBox runat="server" name="txtFechaNacimientoHide" visi ID="txtFechaNacimientoHide" Style="display: none"></asp:TextBox>
                <%--<asp:UpdatePanel ID="udpFechaNacimiento" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                <input name="txtFechaNacimiento" type="text" id="txtFechaNacimiento" maxlength="10" onblur="valFecha(this);guardarFecha()" onkeyup="mascara(this,'/',patron,true)" tabindex="9" style="width: 70px">
                <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
                <%--<img src="../Images/calendar.jpg" alt="Fecha de Nacimiento" title="Fecha de Nacimiento">--%>
                <br />
                <label for="telefono1">Teléfono 1 *</label>
                <asp:RequiredFieldValidator ID="rfvTelefono1" runat="server" ErrorMessage="Debe completar el campo teléfono 1"
                    Text="*" ControlToValidate="txtTelefono1" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtTelefono1" ValidationGroup="valida"></asp:TextBox>
                <br />
                <label for="telefono2">Teléfono 2</label>
                <asp:TextBox runat="server" ID="txtTelefono2"></asp:TextBox>
                <br />
                <label for="telefono3">Teléfono 3</label>
                <asp:TextBox runat="server" ID="txtTelefono3"></asp:TextBox>
                <br />
                <label for="email">Email *</label>
                <asp:RequiredFieldValidator ID="rfvMail" runat="server" ErrorMessage="Debe completar el campo mail"
                    Text="*" ControlToValidate="txtMail" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtMail" ValidationGroup="valida"></asp:TextBox><br />
                <label for="mensaje">Adjunte su Curriculum *</label>
                <asp:RequiredFieldValidator ID="rfvCurriculum" runat="server" ErrorMessage="Debe adjuntar un archivo"
                    Text="*" ControlToValidate="fuCurriculum" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="Multifile-vk-panel">
                    <div>
                        <asp:FileUpload ID="fuadjuntar" runat="server" class="multi" />
                    </div>
                    <div class="Multifile-UploadAll-div-Button">
                        <asp:Button ID="btnUpload" runat="server" Text="Adjuntar" CssClass="Multifile-UploadAllButton" OnClick="btnUpload_Click" />
                    </div>
                </div>
                <input id="fuCurriculum" type="file" size="53" name="fuCurriculum" runat="server"
                    style="height: 22px;" />
                <br />

                <label for="ultimoEmpleo">Último empleo</label>
                <asp:TextBox runat="server" ID="txtUltimoEmpleo" TextMode="MultiLine" Style="width: 300px;"></asp:TextBox>
                <br />
                <br />

                <asp:Button ID="btnEnviar" runat="server" CssClass="Enviar" Height="30px" Text="ENVIAR"
                    ValidationGroup="valida" OnClick="btnEnviar_Click" />

                <label for="Obs" style="font-size: 10px; width: 220px;">
                    Los campos marcados con (*) son obligatorios</label>
                <div id="sumary" class="formulario" runat="server">
                    <asp:ValidationSummary ID="vsErrores" CssClass="vsErrores" runat="server" ValidationGroup="valida" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
