<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verNovedades.aspx.cs" Inherits="Codene.verNovedades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--<style type="text/css">
        label {
            width: 100px;
        }

        input, textarea {
            margin-left: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
    </style>--%>
    <script type="text/javascript">
        function popUp() {
            popUpCerrar();

            $("#formVer").show();
            $("#formVer").css({
                'left': ($(window).width() / 2 - $("#formVer").width()) + 'px',
                'top': ($(window).height() / 2 - $("#formVer").height()) + 'px',
                'position': 'absolute'
            });
        }

        function popUpCerrar() {
            $("#formVer").hide();

        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <%--<section class="featured">
        <div class="content-wrapper">
        </div>
    </section>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server" enctype="multipart/form-data">
    <div id="Novedades">
        <h2>Novedades</h2>
        <br />

        <asp:GridView ID="grdNovedades" runat="server" CssClass="grilla" AutoGenerateColumns="False" Style="min-width: 400px;" OnRowCommand="grdNovedades_RowCommand">
            <Columns>
                <asp:BoundField DataField="titulo" HeaderText="TITULO" />
                <asp:TemplateField HeaderText="Ver">
                    <ItemTemplate>
                        <asp:ImageButton ID="Ver" runat="server" ImageUrl="~/Images/ConsultaTusDatos.jpg" Height="20" Width="20" CommandArgument='<%#Eval("id")%>' CommandName="Ver" OnClientClick="popUp();" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>

        <div id="formVer" runat="server" style="margin-top:20px; border: 1px solid #515151; padding-bottom: 10px; width:98%;">
            <div id="head" style="height:20px; background-color: #e6e6e6; padding-top: 8px; border-bottom: solid 1px gray; text-align: left;">
                <label id="lblTituloVer" style="padding-left: 10px;">Ver Novedad</label>
                <asp:Button ID="btnCerrarVer" runat="server" Text="X" title="Cerrar" Style="border: 1px solid #515151; float: right; margin-right: 5px; margin-top: -5px; height: 20px; cursor: pointer; border-radius: 3px; padding: 0px 4px 0px 4px; font-size: 0.85em;" OnClick="btnCerrarVer_Click" />
            </div>
            <asp:HiddenField ID="hId" runat="server" />
            <div style="text-align: left; padding: 10px;">
                <div style="padding-bottom:5px;">
                    <%--<label for="lbltituloVer">Titulo</label>--%>
                    <asp:Label ID="lblTituloVer" runat="server" style="text-decoration:underline;"></asp:Label>
                </div>
                <div style="padding-bottom:5px;">
                    <%--<label for="imagen">Imagen</label>--%>
                    <div style="clear: both;">
                        <asp:Image ID="imgMuestraEditar" runat="server" Style="max-height: 300px; max-width: 300px;" />

                    </div>
                </div>
                <div style="padding-bottom:5px;">
                    <%--<label for="lblCuerpoVer">Cuerpo de la Novedad</label>--%>
                    <asp:Label ID="lblCuerpoVer" style="min-height:100px;width:300px;" runat="server"></asp:Label>
                </div>

            </div>
        </div>

    </div>
</asp:Content>
