<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verPrensa.aspx.cs" Inherits="Codene.verPrensa" %>

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


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server" enctype="multipart/form-data">
    <div id="GestionPrensa">
        <div>
            <h2>Articulos de Prensa</h2>
            <br />
            <asp:GridView ID="grdPrensa" runat="server" CssClass="grilla" AutoGenerateColumns="False" Style="min-width: 800px;" OnRowCommand="grdPrensa_RowCommand">
                <Columns>
                    <asp:BoundField DataField="titulo" HeaderText="TITULO" />
                    <asp:TemplateField HeaderText="Ver">
                        <ItemTemplate>
                            <asp:ImageButton ID="VerAdjunto" runat="server" AlternateText="Ver Adjunto" ImageUrl="~/Images/pdf.png" Height="20" Width="20" CommandArgument='<%#Eval("id")%>' CommandName="Ver" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>



        </div>
    </div>
</asp:Content>

