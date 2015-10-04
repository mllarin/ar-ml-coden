<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verNovedades.aspx.cs" Inherits="Codene.verNovedades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        label {
            width: 100px;
        }

        input, textarea {
            margin-left: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
    </style>
    <script src="../Scripts/jquery-1.8.2.js"></script>
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
    <section class="featured">
        <div class="content-wrapper">
            
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server" enctype="multipart/form-data">
    <div id="GestionBanners">
             
        <div>
            <hr />
            <h4>Novedades</h4>
            <br />

            <asp:GridView ID="grdNovedades" runat="server" CssClass="grilla" AutoGenerateColumns="False" Style="min-width: 800px;" OnRowCommand="grdNovedades_RowCommand">
                <Columns>
                    <asp:BoundField DataField="titulo" HeaderText="TITULO" />
                    <asp:BoundField ItemStyle-Wrap="false" DataField="cuerpo" HeaderText="CUERPO" />
                    <asp:TemplateField HeaderText="Ver">
                        <ItemTemplate>
                            <asp:ImageButton ID="Ver" runat="server" ImageUrl="~/Images/ConsultaTusDatos.jpg" Height="20" Width="20" CommandArgument='<%#Eval("id")%>' CommandName="Ver" OnClientClick="popUp();" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>

            <div id="formVer" runat="server" style="font-family: Arial, Verdana, Helvetica, sans-serif; border-top-left-radius: 10px; border-top-right-radius: 10px; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; left: 500.5px; top: 300px; position: absolute; background-color: #53b460; border: 1px solid #515151; padding-bottom: 10px;">
                <div id="head" style="width: 100%; height: 20px; background-color: #e6e6e6; padding-top: 8px; border-top-left-radius: 10px; border-top-right-radius: 10px; border-bottom: solid 1px gray; text-align: left;">
                    <label id="lblTituloVer" style="padding-left: 10px;">Ver Novedad</label>
                    <asp:Button ID="btnCerrarVer" runat="server" Text="X" title="Cerrar" Style="border: 1px solid #515151; float: right; margin-right: 5px; margin-top: -5px; height: 20px; cursor: pointer; border-radius: 3px; padding: 0px 4px 0px 4px; font-size: 0.85em;" OnClick="btnCerrarVer_Click" />
                </div>
                <asp:HiddenField ID="hId" runat="server" />
                <div style="text-align: left; padding-top: 20px; padding-left: 10px;">
                    <div>
                        <label for="lbltituloVer">Titulo</label>
                        <asp:TextBox ID="txtTituloVer" Enabled="false" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <label for="imagen">Imagen</label>
                        <div style="clear: both;">
                            <asp:Image ID="imgMuestraEditar" runat="server" Style="max-height: 300px; max-width: 300px;" />
                            
                        </div>
                    </div>
                    <div>
                <label for="lblCuerpoVer">Cuerpo de la Novedad</label>
                <asp:TextBox TextMode="MultiLine" ID="txtCuerpoVer" Wrap="true" Enabled="false" Height="250px" Width="300px" runat="server"></asp:TextBox>
                </div>
                    
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
