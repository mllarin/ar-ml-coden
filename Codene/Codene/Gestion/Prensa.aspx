
<%@ Page Title="" Language="C#" MasterPageFile="~/Gestion/Gestion.Master" AutoEventWireup="true" CodeBehind="Prensa.aspx.cs" Inherits="Codene.Gestion.Prensa" %>
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
                <h3>Gestión - Prensa</h3>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server" enctype="multipart/form-data">
    <div id="GestionPrensa">
        <div>
            <h4>Nueva Entrada de Prensa</h4>
            <br />
            <div>
                <label for="nombre">Titulo</label>
                <asp:TextBox ID="txtTitulo" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="documento">Adjunto</label>
                <input id="fuDocumento" type="file" size="53" name="fuDocumento" runat="server" onload="fuDocumento_Load" />
                <asp:Button ID="btnVerDocumento" runat="server" Style="margin-top: 10px;" Text="ver documento" OnClick="btnVerDocumento_Click" />
            </div>
                        
            <asp:Button ID="btnGuardar" runat="server" Style="margin-top: 10px;" Text="Guardar" OnClick="btnGuardar_Click" />
        </div>
        <div>
            <hr />
            <h4>Prensa</h4>
            <br />

            <asp:GridView ID="grdPrensa" runat="server" CssClass="grilla" AutoGenerateColumns="False" Style="min-width: 800px;" OnRowCommand="grdPrensa_RowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="titulo" HeaderText="TITULO" />
                    <asp:BoundField DataField="documento" HeaderText="ADJUNTO" />

                    <asp:TemplateField HeaderText="Ver Adjunto">
                        <ItemTemplate>
                            <asp:ImageButton ID="Ver" runat="server" ImageUrl="~/Images/Pdf.png" Height="20" Width="20" CommandArgument='<%#Eval("id")%>' CommandName="Ver"  />
                        </ItemTemplate>
                    </asp:TemplateField>
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
                    <label id="lblTituloEditar" style="padding-left: 10px;">Editar Prensa</label>
                    <asp:Button ID="btnCerrarEditar" runat="server" Text="X" title="Cerrar" Style="border: 1px solid #515151; float: right; margin-right: 5px; margin-top: -5px; height: 20px; cursor: pointer; border-radius: 3px; padding: 0px 4px 0px 4px; font-size: 0.85em;" OnClick="btnCerrarEditar_Click" />
                </div>
                <asp:HiddenField ID="hId" runat="server" />
                <div style="text-align: left; padding-top: 20px; padding-left: 10px;">
                    <div>
                        <label for="tituloEditar">Titulo</label>
                        <asp:TextBox ID="txtTituloEditar" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <label for="documento">Adjunto</label>
                        <input id="fuDocumentoEditar" type="file" accept="pdf" size="53" name="fuDocumento1" runat="server" onload="fuDocumentoEditar_Load" />
                        <asp:Button ID="btnVerDocumentoEditar" runat="server" Style="margin-top: 10px;" Text="ver documento" OnClick="btnVerdocumentoEditar_Click" />
                        
                    </div>
                    
            </div>
            </div>
        </div>
    </div>
</asp:Content>


