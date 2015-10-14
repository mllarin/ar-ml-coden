<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion/Gestion.Master" AutoEventWireup="true" CodeBehind="Notificaciones.aspx.cs" Inherits="Codene.Gestion.Notificaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        label {
            width: 100px;
        }
    </style>
    <script type="text/javascript">
        function popUp() {
            popUpCerrar();

            $("#formModificar").show();
            $("#formModificar").css({
                'left': ($(window).width() / 2 - $("#formModificar").width()) + 'px',
                'top': ($(window).height() / 2 - $("#formModificar").height()) + 'px',
                'position': 'absolute'
            });
        }

        function popUpCerrar() {
            $("#formModificar").hide();
            //$("#formModificar").fadeOut(300);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h3>Gestión - Notificaciones</h3>

            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="GestionNotificaciones">
        <div style="float: left; padding-left: 10px;">
            <h4>Nueva Notififación</h4>
            <br />
            <div>
                <label for="titulo">Título</label>
                <asp:TextBox ID="txtTitulo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitulo" runat="server" ControlToValidate="txtTitulo" ErrorMessage="Debe completar el campo título" Text="*" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="descripcion">Descripción</label>
                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Height="50px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Debe completar el campo descripción" Text="*" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" ID="lblCorrecto" Style="font-size: 1em; color: green;" Visible="false">La notificación fue guardada correctamente</asp:Label>
            <br />
            <asp:ValidationSummary ID="vsAlta" runat="server" CssClass="error" />
            <asp:Button ID="btnGuardar" runat="server" Style="margin-top: 10px;" Text="Guardar" OnClick="btnGuardar_Click" />
        </div>
        <div style="float: left;">
            <asp:GridView ID="grdNotificaciones" runat="server" CssClass="grilla" AutoGenerateColumns="False" Style="min-width: 800px;">
                <Columns>
                    <asp:BoundField DataField="idNotificacion" HeaderText="ID" />
                    <asp:BoundField DataField="titulo" HeaderText="TITULO" />
                    <asp:BoundField DataField="descripcion" HeaderText="DESCRIPCIÓN" />

                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:ImageButton ID="Eliminar" runat="server" ImageUrl="~/Images/Eliminar.png" Style="background-color:transparent;" ToolTip="Eliminar" Height="20" Width="20" CommandArgument='<%#Eval("idNotificacion")%>' CommandName="Eliminar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion/Gestion.Master" AutoEventWireup="true" CodeBehind="Notificaciones.aspx.cs" Inherits="Codene.Gestion.Notificaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        label {
            width: 100px;
        }
    </style>
    <script type="text/javascript">
        function popUp() {
            popUpCerrar();

            $("#formModificar").show();
            $("#formModificar").css({
                'left': ($(window).width() / 2 - $("#formModificar").width()) + 'px',
                'top': ($(window).height() / 2 - $("#formModificar").height()) + 'px',
                'position': 'absolute'
            });
        }

        function popUpCerrar() {
            $("#formModificar").hide();
            //$("#formModificar").fadeOut(300);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h3>Gestión - Notificaciones</h3>

            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="GestionNotificaciones">
        <div style="float: left; padding-left: 10px;">
            <h4>Nueva Notififación</h4>
            <br />
            <div>
                <label for="titulo">Título</label>
                <asp:TextBox ID="txtTitulo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitulo" runat="server" ControlToValidate="txtTitulo" ErrorMessage="Debe completar el campo título" Text="*" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="descripcion">Descripción</label>
                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Height="50px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Debe completar el campo descripción" Text="*" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" ID="lblCorrecto" Style="font-size: 1em; color: green;" Visible="false">La notificación fue guardada correctamente</asp:Label>
            <br />
            <asp:ValidationSummary ID="vsAlta" runat="server" CssClass="error" />
            <asp:Button ID="btnGuardar" runat="server" Style="margin-top: 10px;" Text="Guardar" OnClick="btnGuardar_Click" />
        </div>
        <div style="float: left;">
            <asp:GridView ID="grdNotificaciones" runat="server" CssClass="grilla" AutoGenerateColumns="False" Style="min-width: 800px;">
                <Columns>
                    <asp:BoundField DataField="idNotificacion" HeaderText="ID" />
                    <asp:BoundField DataField="titulo" HeaderText="TITULO" />
                    <asp:BoundField DataField="descripcion" HeaderText="DESCRIPCIÓN" />

                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:ImageButton ID="Eliminar" runat="server" ImageUrl="~/Images/Eliminar.png" Style="background-color:transparent;" ToolTip="Eliminar" Height="20" Width="20" CommandArgument='<%#Eval("idNotificacion")%>' CommandName="Eliminar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
>>>>>>> refs/remotes/origin/mllarin
