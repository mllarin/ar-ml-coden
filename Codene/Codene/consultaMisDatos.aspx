<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="consultaMisDatos.aspx.cs" Inherits="Codene.consultaMisDatos" %>

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
    <script src="Scripts/Mascara.js"></script>
    <script src="Scripts/ValidaFecha.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Consulta de mis datos</h2>
    <div id="consultaMisDatos" style="float: left; width: 700px;">
        <br />
        <div style="margin: auto; border-radius: 5px; padding-top: 7px; padding-bottom: 7px; text-align: left;">
            <div style="text-align: left; width: 610px; margin: auto;">
                <label for="persona">Persona *</label>
                <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ErrorMessage="Debe completar el campo persona"
                    Text="*" ControlToValidate="ddlSexo" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:DropDownList runat="server" ID="ddlSexo">
                    <asp:ListItem Text="Sexo femenino" Value="0" />
                    <asp:ListItem Text="Sexo masculino" Value="Masculino" />
                    <asp:ListItem Text="Persona jurídica" Value="Femenino" />
                </asp:DropDownList>
                <br />
                <label for="razonSocial">Razón Social</label>
                <asp:TextBox runat="server" ID="txtRazonSocial" ValidationGroup="valida"></asp:TextBox>
                <br />
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
                <label for="documento">DNI/CUIL/CUIT *</label>
                <asp:RequiredFieldValidator ID="rfvDocumento" runat="server" ErrorMessage="Debe completar el campo documento"
                    Text="*" ControlToValidate="txtDocumento" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtDocumento"></asp:TextBox>
                <br />
                <label for="nacionalidad">Nacionalidad</label>
                <asp:DropDownList runat="server" ID="ddlNacionalidad">
                    <asp:ListItem Text="Argentina" Value="Argentina" />
                    <asp:ListItem Text="Extranjera" Value="Extranjera" />
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
                <label for="cedulaPasaporte">Cédula / Pasaporte</label>
                <asp:TextBox runat="server" ID="txtCedulaPasaporte"></asp:TextBox>
                <br />
                <label for="provincia">Provincia</label>
                <asp:DropDownList runat="server" ID="ddlProvincia">
                    <asp:ListItem Text="Buenos Aires" Value="Buenos Aires" />
                    <asp:ListItem Text="Capital Federal" Value="Capital Federal"/>
                    <asp:ListItem Text="Catamarca" Value="Catamarca"/>
                    <asp:ListItem Text="Chaco" Value="Chaco"/>
                    <asp:ListItem Text="Chubut" Value="Chubut"/>
                    <asp:ListItem Text="Córdoba" Value="Cordoba"/>
                    <asp:ListItem Text="Corrientes" Value="Corrientes"/>
                    <asp:ListItem Text="Entre Ríos" Value="Entre Rios"/>
                    <asp:ListItem Text="Formosa" Value="Formosa"/>
                    <asp:ListItem Text="Jujuy" Value="Jujuy"/>
                    <asp:ListItem Text="La Pampa" Value="La Pampa"/>
                    <asp:ListItem Text="La Rioja" Value="La Rioja"/>
                    <asp:ListItem Text="Mendoza" Value="Mendoza"/>
                    <asp:ListItem Text="Misiones" Value="Misiones"/>
                    <asp:ListItem Text="Neuquén" Value="Neuquen"/>
                    <asp:ListItem Text="Río Negro" Value="Rio Negro"/>
                    <asp:ListItem Text="Salta" Value="Salta"/>
                    <asp:ListItem Text="San Juan" Value="San Juan"/>
                    <asp:ListItem Text="San Luis" Value="San Luis"/>
                    <asp:ListItem Text="Santa Cruz" Value="Santa Cruz"/>
                    <asp:ListItem Text="Santiago del Estero" Value="Santa Fe">Santa Fé</asp:ListItem>
                    <asp:ListItem Text="" Value="Santiago del Estero"/>
                    <asp:ListItem Text="Tierra del Fuego" Value="Tierra del Fuego"/>
                    <asp:ListItem Text="Tucumán" Value="Tucuman"/>
                </asp:DropDownList>
                <br />
                <label for="localidad">Localidad *</label>
                <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ErrorMessage="Debe completar el campo localidad"
                    Text="*" ControlToValidate="txtLocalidad" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtLocalidad"></asp:TextBox>
                <br />
                <label for="codigoPostal">Código Postal *</label>

                <asp:RequiredFieldValidator ID="rfvCodigoPostal" runat="server" ErrorMessage="Debe completar el campo código postal"
                    Text="*" ControlToValidate="txtCodigoPostal" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtCodigoPostal"></asp:TextBox>
                <br />
                <label for="calle">Calle *</label>
                <asp:RequiredFieldValidator ID="rfvCalle" runat="server" ErrorMessage="Debe completar el campo calle"
                    Text="*" ControlToValidate="txtCalle" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtCalle"></asp:TextBox>
                <br />
                <label for="numero">Número *</label>
                <asp:RequiredFieldValidator ID="rfvNumero" runat="server" ErrorMessage="Debe completar el campo número"
                    Text="*" ControlToValidate="txtNumero" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtNumero"></asp:TextBox>
                <br />
                <label for="pisoDpto">Piso / Dpto</label>
                <asp:TextBox runat="server" ID="txtPisoDpto"></asp:TextBox>
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
                <asp:RequiredFieldValidator ID="rfvMail" runat="server" ErrorMessage="Debe completar el campo email"
                    Text="*" ControlToValidate="txtMail" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtMail" ValidationGroup="valida"></asp:TextBox><br />
                <label for="comentarios">Comentarios</label>
                <asp:TextBox runat="server" ID="txtComentarios" TextMode="MultiLine" Style="width: 300px;"></asp:TextBox>
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
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="consultaMisDatos.aspx.cs" Inherits="Codene.consultaMisDatos" %>

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
    <script src="Scripts/Mascara.js"></script>
    <script src="Scripts/ValidaFecha.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Consulta de mis datos</h2>
    <div id="consultaMisDatos" style="float: left; width: 700px;">
        <br />
        <div style="margin: auto; border-radius: 5px; padding-top: 7px; padding-bottom: 7px; text-align: left;">
            <div style="text-align: left; width: 610px; margin: auto;">
                <label for="persona">Persona *</label>
                <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ErrorMessage="Debe completar el campo persona"
                    Text="*" ControlToValidate="ddlSexo" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:DropDownList runat="server" ID="ddlSexo">
                    <asp:ListItem Text="Sexo femenino" Value="0" />
                    <asp:ListItem Text="Sexo masculino" Value="Masculino" />
                    <asp:ListItem Text="Persona jurídica" Value="Femenino" />
                </asp:DropDownList>
                <br />
                <label for="razonSocial">Razón Social</label>
                <asp:TextBox runat="server" ID="txtRazonSocial" ValidationGroup="valida"></asp:TextBox>
                <br />
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
                <label for="documento">DNI/CUIL/CUIT *</label>
                <asp:RequiredFieldValidator ID="rfvDocumento" runat="server" ErrorMessage="Debe completar el campo documento"
                    Text="*" ControlToValidate="txtDocumento" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtDocumento"></asp:TextBox>
                <br />
                <label for="nacionalidad">Nacionalidad</label>
                <asp:DropDownList runat="server" ID="ddlNacionalidad">
                    <asp:ListItem Text="Argentina" Value="Argentina" />
                    <asp:ListItem Text="Extranjera" Value="Extranjera" />
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
                <label for="cedulaPasaporte">Cédula / Pasaporte</label>
                <asp:TextBox runat="server" ID="txtCedulaPasaporte"></asp:TextBox>
                <br />
                <label for="provincia">Provincia</label>
                <asp:DropDownList runat="server" ID="ddlProvincia">
                    <asp:ListItem Text="Buenos Aires" Value="Buenos Aires" />
                    <asp:ListItem Text="Capital Federal" Value="Capital Federal"/>
                    <asp:ListItem Text="Catamarca" Value="Catamarca"/>
                    <asp:ListItem Text="Chaco" Value="Chaco"/>
                    <asp:ListItem Text="Chubut" Value="Chubut"/>
                    <asp:ListItem Text="Córdoba" Value="Cordoba"/>
                    <asp:ListItem Text="Corrientes" Value="Corrientes"/>
                    <asp:ListItem Text="Entre Ríos" Value="Entre Rios"/>
                    <asp:ListItem Text="Formosa" Value="Formosa"/>
                    <asp:ListItem Text="Jujuy" Value="Jujuy"/>
                    <asp:ListItem Text="La Pampa" Value="La Pampa"/>
                    <asp:ListItem Text="La Rioja" Value="La Rioja"/>
                    <asp:ListItem Text="Mendoza" Value="Mendoza"/>
                    <asp:ListItem Text="Misiones" Value="Misiones"/>
                    <asp:ListItem Text="Neuquén" Value="Neuquen"/>
                    <asp:ListItem Text="Río Negro" Value="Rio Negro"/>
                    <asp:ListItem Text="Salta" Value="Salta"/>
                    <asp:ListItem Text="San Juan" Value="San Juan"/>
                    <asp:ListItem Text="San Luis" Value="San Luis"/>
                    <asp:ListItem Text="Santa Cruz" Value="Santa Cruz"/>
                    <asp:ListItem Text="Santiago del Estero" Value="Santa Fe">Santa Fé</asp:ListItem>
                    <asp:ListItem Text="" Value="Santiago del Estero"/>
                    <asp:ListItem Text="Tierra del Fuego" Value="Tierra del Fuego"/>
                    <asp:ListItem Text="Tucumán" Value="Tucuman"/>
                </asp:DropDownList>
                <br />
                <label for="localidad">Localidad *</label>
                <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ErrorMessage="Debe completar el campo localidad"
                    Text="*" ControlToValidate="txtLocalidad" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtLocalidad"></asp:TextBox>
                <br />
                <label for="codigoPostal">Código Postal *</label>

                <asp:RequiredFieldValidator ID="rfvCodigoPostal" runat="server" ErrorMessage="Debe completar el campo código postal"
                    Text="*" ControlToValidate="txtCodigoPostal" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtCodigoPostal"></asp:TextBox>
                <br />
                <label for="calle">Calle *</label>
                <asp:RequiredFieldValidator ID="rfvCalle" runat="server" ErrorMessage="Debe completar el campo calle"
                    Text="*" ControlToValidate="txtCalle" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtCalle"></asp:TextBox>
                <br />
                <label for="numero">Número *</label>
                <asp:RequiredFieldValidator ID="rfvNumero" runat="server" ErrorMessage="Debe completar el campo número"
                    Text="*" ControlToValidate="txtNumero" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtNumero"></asp:TextBox>
                <br />
                <label for="pisoDpto">Piso / Dpto</label>
                <asp:TextBox runat="server" ID="txtPisoDpto"></asp:TextBox>
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
                <asp:RequiredFieldValidator ID="rfvMail" runat="server" ErrorMessage="Debe completar el campo email"
                    Text="*" ControlToValidate="txtMail" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtMail" ValidationGroup="valida"></asp:TextBox><br />
                <label for="comentarios">Comentarios</label>
                <asp:TextBox runat="server" ID="txtComentarios" TextMode="MultiLine" Style="width: 300px;"></asp:TextBox>
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
>>>>>>> refs/remotes/origin/mllarin
