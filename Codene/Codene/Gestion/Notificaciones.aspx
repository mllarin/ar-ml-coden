<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion/Gestion.Master" enableEventValidation="true" AutoEventWireup="true" CodeBehind="Notificaciones.aspx.cs" Inherits="Codene.Gestion.Notificaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script src="../Scripts/jquery-1.8.2.js"></script>
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server" enctype="multipart/form-data">
    <div id="GestionNotificaciones">
        <div>
            <h4>Nueva Notificación</h4>
            <br />
            <div>
                <label for="titulo">Título</label>
                <asp:TextBox ID="txtTitulo" runat="server"></asp:TextBox>
               
            </div>
            <div>
                <label for="descripcion">Descripción</label>
                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Height="50px"></asp:TextBox>
               
            </div>
            <asp:Label runat="server" ID="lblCorrecto" Style="font-size: 1em; color: green;" Visible="false">La notificación fue guardada correctamente</asp:Label>
            <br />
            <asp:ValidationSummary ID="vsAlta" runat="server" CssClass="error" />
            <asp:Button ID="btnGuardar" runat="server" Style="margin-top: 10px;" Text="Guardar" OnClick="btnGuardar_Click" />
        </div>
        <div>
            <hr />
            <h4>Notificaciones</h4>
            <br />
            <asp:GridView ID="grdNotificaciones" runat="server" CssClass="grilla" AutoGenerateColumns="False" Style="min-width: 800px;" OnRowCommand="grdNotificaciones_RowCommand">
                <Columns>
                    <asp:BoundField DataField="idNotificacion" HeaderText="ID" />
                    <asp:BoundField DataField="titulo" HeaderText="TITULO" />
                    <asp:BoundField DataField="descripcion" HeaderText="DESCRIPCIÓN" />

                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:ImageButton ID="Editar" runat="server" ImageUrl="~/Images/Editar.png" Style="background-color: transparent;" ToolTip="Editar" Height="20" Width="20" CommandArgument='<%#Eval("idNotificacion")%>' CommandName="Editar" OnClientClick="popUp();" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div id="formModificar" runat="server" style="top: 30%; left: 25%; position: absolute; background-color: #53b460; border: 1px solid #515151; padding-bottom: 10px; min-width: 400px; max-width: 98%;">
                <div id="head" style="width: 100%; height: 20px; background-color: #e6e6e6; padding-top: 8px; border-bottom: solid 1px gray; text-align: left;">
                    <label id="lblTituloEditar" style="padding-left: 10px;">Editar Notificacion</label>
                    <asp:Button ID="btnCerrarEditar" runat="server" Text="X" title="Cerrar" Style="border: 1px solid #515151; float: right; margin-right: 5px; margin-top: -5px; height: 20px; cursor: pointer; border-radius: 3px; padding: 0px 4px 0px 4px; font-size: 0.85em;" OnClick="btnCerrarEditar_Click" />
                </div>
                <asp:HiddenField ID="hId" runat="server" />
                <div style="text-align: left; padding-top: 20px; padding-left: 10px;">
                    <div>
                        <label for="tituloEditar" style="float: none;">Titulo</label>
                        <asp:TextBox ID="txtTituloEditar" Enabled="false" runat="server"></asp:TextBox>
                    </div>
                    <br />
                    <div>
                        <label for="cuerpoEditar" style="float: none;">Descripción</label>
                        <asp:TextBox TextMode="MultiLine" ID="txtCuerpoEditar" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="BtnModificar" runat="server" Style="margin-top: 10px;" Text="Modificar" OnClick="BtnModificar_Click" />
                </div>
            </div>
        </div>

    </div>
</asp:Content>
