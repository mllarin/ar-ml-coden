<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="consumirNotificaciones.aspx.cs" Inherits="Codene.consumirNotificaciones" %>

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
<%--<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h3>Notificaciones</h3>
            </hgroup>
        </div>
    </section>
</asp:Content>--%>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server" enctype="multipart/form-data">--%>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div style="float: left;">


        <asp:GridView ID="grdNotificaciones" runat="server" CssClass="grilla" AutoGenerateColumns="False" Style="min-width: 800px;" OnRowCommand="grdNotificaciones_RowCommand">
            <Columns>
                <asp:BoundField DataField="idNotificacion" HeaderText="ID" />
                <asp:BoundField DataField="titulo" HeaderText="TITULO" />
                <asp:BoundField DataField="descripcion" HeaderText="DESCRIPCIÓN" />

                <asp:TemplateField HeaderText="Ver">
                    <ItemTemplate>
                        <asp:ImageButton ID="Ver" runat="server" ImageUrl="~/Images/ConsultaTusDatos.jpg" Style="background-color: transparent;" ToolTip="Ver" Height="20" Width="20" CommandArgument='<%#Eval("idNotificacion")%>' CommandName="Ver" OnClientClick="popUp();" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div id="formularioVer" runat="server" style="top: 30%; left: 25%; position: relative; background-color: #53b460; border: 1px solid #515151; padding-bottom: 10px; min-width: 400px; max-width: 98%;">
            <div id="head" style="width: 100%; height: 20px; background-color: #e6e6e6; padding-top: 8px; border-bottom: solid 1px gray; text-align: left;">
                <label id="lblTitulo" style="padding-left: 10px;">Ver Notificación</label>
                <asp:Button ID="btnCerrarVer" runat="server" Text="X" title="Cerrar" Style="border: 1px solid #515151; float: right; margin-right: 5px; margin-top: -5px; height: 20px; cursor: pointer; border-radius: 3px; padding: 0px 4px 0px 4px; font-size: 0.85em;" OnClick="btnCerrarVer_Click" />
            </div>
            <asp:HiddenField ID="hId" runat="server" />
            <div style="text-align: left; padding-top: 20px; padding-left: 10px;">
                <div>
                    <label for="tituloVer" style="float: none;">Titulo</label>
                    <asp:TextBox ID="txtTituloVer" runat="server"></asp:TextBox>
                </div>
                <br />
                <div>
                    <label for="descripcionVer" style="float: none;">Descripcion de la Notificación</label>
                    <asp:TextBox TextMode="MultiLine" ID="txtDescipcionVer" runat="server"></asp:TextBox>
                </div>

            </div>
        </div>
    </div>



</asp:Content>
