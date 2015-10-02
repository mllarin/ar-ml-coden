<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion/Gestion.Master" AutoEventWireup="true" CodeBehind="Novedades.aspx.cs" Inherits="Codene.Gestion.Novedades" %>

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
                <h3>Gestión - Novedades</h3>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server" enctype="multipart/form-data">
    <div id="GestionNovedades">
        <div>
            <h4>Nueva Novedad</h4>
            <br />
            <div>
                <label for="nombre">Titulo</label>
                <asp:TextBox ID="txtTitulo" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="imagen">Imagen</label>
                <input id="fuImagen" type="file" size="53" name="fuCurriculum" runat="server" onload="fuImagen_Load" />
                <asp:Button ID="btnVerImagen" runat="server" Style="margin-top: 10px;" Text="ver imagen" OnClick="btnVerImagen_Click" />
            </div>
            <div>
                <label for="nombre">Cuerpo de la Novedad</label>
                <asp:TextBox Width="250" Height="250" ID="txtCuerpo" runat="server"></asp:TextBox>
            </div>
            
            <asp:Button ID="btnGuardar" runat="server" Style="margin-top: 10px;" Text="Guardar" OnClick="btnGuardar_Click" />
        </div>
        <div>
            <asp:Image ID="imgMuestra" runat="server" />
        </div>
        <div>
            <hr />
            <h4>Novedades</h4>
            <br />

            <asp:GridView ID="grdNovedades" runat="server" CssClass="grilla" AutoGenerateColumns="False" Style="min-width: 800px;" OnRowCommand="grdNovedades_RowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="titulo" HeaderText="TITULO" />
                    <asp:ImageField DataImageUrlField="imagen" HeaderText="IMAGEN" />
                    <asp:BoundField DataField="cuerpo" HeaderText="CUERPO" />
                    
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:ImageButton ID="Modificar" runat="server" ImageUrl="~/Images/Editar.png" Height="20" Width="20" CommandArgument='<%#Eval("id")%>' CommandName="Editar" OnClientClick="popUp();" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:ImageButton ID="Eliminar" runat="server" ImageUrl="~/Images/Eliminar.png" Height="20" Width="20" CommandArgument='<%#Eval("id")%>' CommandName="Eliminar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div id="formModificar" runat="server" style="font-family: Arial, Verdana, Helvetica, sans-serif; border-top-left-radius: 10px; border-top-right-radius: 10px; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; left: 404.5px; top: 213px; position: absolute; background-color: #53b460; border: 1px solid #515151; padding-bottom: 10px;">
                <div id="head" style="width: 100%; height: 20px; background-color: #e6e6e6; padding-top: 8px; border-top-left-radius: 10px; border-top-right-radius: 10px; border-bottom: solid 1px gray; text-align: left;">
                    <label id="lblTituloEditar" style="padding-left: 10px;">Editar Novedad</label>
                    <asp:Button ID="btnCerrarEditar" runat="server" Text="X" title="Cerrar" Style="border: 1px solid #515151; float: right; margin-right: 5px; margin-top: -5px; height: 20px; cursor: pointer; border-radius: 3px; padding: 0px 4px 0px 4px; font-size: 0.85em;" OnClick="btnCerrarEditar_Click" />
                </div>
                <asp:HiddenField ID="hId" runat="server" />
                <div style="text-align: left; padding-top: 20px; padding-left: 10px;">
                    <div>
                        <label for="tituloEditar">Titulo</label>
                        <asp:TextBox ID="txtTituloEditar" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <label for="imagen">Imagen</label>
                        <input id="fuImagenEditar" type="file" accept="jpg,png,gif" size="53" name="fuCurriculum1" runat="server" onload="fuImagenEditar_Load" />
                        <asp:Button ID="btnVerImagenEditar" runat="server" Style="margin-top: 10px;" Text="ver imagen" OnClick="btnVerImagenEditar_Click" />
                        <div style="clear: both;">
                            <asp:Image ID="imgMuestraEditar" runat="server" Style="max-height: 300px; max-width: 300px;" />
                            <canvas id="dragNdrop" runat="server" style="width:200px;height:200px;"></canvas>
                        </div>
                    </div>
                    <div>
                <label for="cuerpoEditar">Cuerpo de la Novedad</label>
                <asp:TextBox ID="txtCuerpoEditar" runat="server"></asp:TextBox>
                </div>
                    <asp:Button ID="BtnModificar" runat="server" Style="margin-top: 10px;" Text="Modificar" OnClick="BtnModificar_Click" />
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>

