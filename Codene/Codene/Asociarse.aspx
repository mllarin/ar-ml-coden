<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Asociarse.aspx.cs" Inherits="Codene.asociarse" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
     <%--<section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h3>Sea Nuestro Cliente</h3>
            </hgroup>
        </div>
    </section>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div id="Asociarse" style="float: left; width: 700px;">
         <h3>Sea Nuestro Cliente</h3>
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
                <label for="documento">>DNI/CUIL/CUIT *</label>
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
                    <asp:ListItem Text="Femenino" Value="1" />
                    <asp:ListItem Text="Masculino" Value="2" />
                </asp:DropDownList>
                <br />
                <label for="razonsocial">Razon Social</label>
                 <asp:TextBox runat="server" ID="txtRazonsocial"></asp:TextBox>
                <br />
                <label for="rubro">Rubro</label>
                 <asp:TextBox runat="server" ID="txtRubro"></asp:TextBox>
                <br />
                <label for="calle">Calle  *</label>
                <asp:RequiredFieldValidator ID="rfvCalle" runat="server" ErrorMessage="Debe completar el campo calle"
                    Text="*" ControlToValidate="txtCalle" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtCalle" ValidationGroup="valida"></asp:TextBox>
                <br />
                <label for="numero">Numero  *</label>
                <asp:RequiredFieldValidator ID="rfvNumero" runat="server" ErrorMessage="Debe completar el campo numero"
                    Text="*" ControlToValidate="txtNumero" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtNumero" ValidationGroup="valida"></asp:TextBox>
                <br />
                <label for="piso">Piso</label>
                <asp:TextBox runat="server" ID="txtPiso" ValidationGroup="valida"></asp:TextBox>
                <br />
                <label for="depto">Depto</label>
                <asp:TextBox runat="server" ID="txtDepto" ValidationGroup="valida"></asp:TextBox>
                <br />
                <label for="codigopostal">Codigo Postal  *</label>
                <asp:RequiredFieldValidator ID="rfvCodPostal" runat="server" ErrorMessage="Debe completar el campo codigo postal"
                    Text="*" ControlToValidate="txtCodPostal" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtCodPostal" ValidationGroup="valida"></asp:TextBox>
                <br />

                <label for="localidad">Localidad  *</label>
                <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ErrorMessage="Debe completar el campo localidad"
                    Text="*" ControlToValidate="txtLocalidad" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtLocalidad" ValidationGroup="valida"></asp:TextBox>
                <br />

                <label for="ciudad">Ciudad  *</label>
                <asp:RequiredFieldValidator ID="rfvCiudad" runat="server" ErrorMessage="Debe completar el campo ciudad"
                    Text="*" ControlToValidate="txtCiudad" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtCiudad" ValidationGroup="valida"></asp:TextBox>
                <br />

                <label for="provincia">Provincia *</label>
                <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ErrorMessage="Debe completar el campo provincia"
                    Text="*" ControlToValidate="ddlProvincia" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:DropDownList runat="server" ID="ddlProvincia">
                    <asp:ListItem Text="(Seleccione)" Value="0" />
                    <asp:ListItem Text="Buenos Aires" Value="1" />
                    <asp:ListItem Text="Capital Federal" Value="2" />
                    <asp:ListItem Text="Catamarca" Value="3" />
                    <asp:ListItem Text="Chaco" Value="4" />
                    <asp:ListItem Text="Chubut" Value="5" />
                    <asp:ListItem Text="Cordoba" Value="6" />
                    <asp:ListItem Text="Corrientes" Value="7" />
                    <asp:ListItem Text="Entre Ríos" Value="8" />
                    <asp:ListItem Text="Formosa" Value="9" />
                    <asp:ListItem Text="Jujuy" Value="10" />
                    <asp:ListItem Text="La Pampa" Value="11" />
                    <asp:ListItem Text="La Rioja" Value="12" />
                    <asp:ListItem Text="Mendoza" Value="13" />
                    <asp:ListItem Text="Misiones" Value="14" />
                    <asp:ListItem Text="Neuquén" Value="15" />
                    <asp:ListItem Text="Rio Negro" Value="16" />
                    <asp:ListItem Text="Salta" Value="17" />
                    <asp:ListItem Text="San Juan" Value="18" />
                    <asp:ListItem Text="San Luis" Value="19" />
                    <asp:ListItem Text="Santa Cruz" Value="20" />
                    <asp:ListItem Text="Santa Fé" Value="21" />
                    <asp:ListItem Text="Santiago del Estero" Value="22" />
                    <asp:ListItem Text="Tierra del Fuego" Value="23" />
                    <asp:ListItem Text="Tucumán" Value="24" />
                </asp:DropDownList>
                <br />
                 <label for="email">Email *</label>
                <asp:RequiredFieldValidator ID="rfvMail" runat="server" ErrorMessage="Debe completar el campo mail"
                    Text="*" ControlToValidate="txtMail" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtMail" ValidationGroup="valida"></asp:TextBox><br />
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
                <label for="tipocontacto">Tipo de Contacto</label>
               <asp:DropDownList runat="server" ID="dlltipocontacto">
                    <asp:ListItem Text="Asesoramiento sobre la compra de productos y servicios " Value="0" />
                    <asp:ListItem Text="Actualización de la información" Value="1" />
                    <asp:ListItem Text="Sea nuestro cliente" Value="2" />
                </asp:DropDownList>
                <br />
                <label for="ultimoEmpleo">Comentario</label>
                <asp:RequiredFieldValidator ID="rvfComentario" runat="server" ErrorMessage="Debe completar el campo comentario"
                    Text="*" ControlToValidate="txtComentario" ValidationGroup="valida" CssClass="Errores"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtComentario" TextMode="MultiLine" Style="width: 300px;"></asp:TextBox>
                <br />
                <br />

                <asp:Button ID="btnAsociarse" runat="server" CssClass="Asociarse" Height="30px" Text="Asociarse"
                    ValidationGroup="valida" OnClick="btnAsociarse_Click" />

                <label for="Obs" style="font-size: 10px; width: 220px;">
                    Los campos marcados con (*) son obligatorios</label>
                <div id="sumary" class="formulario" runat="server">
                    <asp:ValidationSummary ID="vsErrores" CssClass="vsErrores" runat="server" ValidationGroup="valida" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
