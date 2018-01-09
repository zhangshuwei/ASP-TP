<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsulterAnnoncesParRegion.aspx.cs" Inherits="ConsulterAnnoncesParRegion" Title="Consulter les annonces par r�gion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="dsRegions" runat="server" 
            ConnectionString="<%$ ConnectionStrings:csAffairesSansRisque %>" 
            SelectCommand="SELECT [Reg_Id], [Reg_Nom] FROM [Regions]">
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="dsRegions" DataTextField="Reg_Nom" DataValueField="Reg_Id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="dsAnnonces" runat="server" ConnectionString="<%$ ConnectionStrings:csAffairesSansRisque %>" SelectCommand="SELECT * FROM [Annonces] WHERE ([Reg_Id] = @Reg_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Reg_Id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Ann_Id" DataSourceID="dsAnnonces">
            <ItemTemplate>
                <div id="annonce">
                <div id="entete">
                <asp:Label ID="Ann_VilleLabel" runat="server" Text='<%# Eval("Ann_Ville") %>'
                EnableTheming="false">
                </asp:Label>
                (<asp:Label ID="Ann_CodePostalLabel" runat="server" Text='<%# Eval("Ann_CodePostal") %>'
                EnableTheming="false">
                </asp:Label>)
                </div>
                <div id="email">
                <asp:Label ID="Ann_Email" runat="server" Text='<%# Eval("Ann_Email") %>'></asp:Label>
                </div>
                </div>
                <asp:Label ID="Ann_TexteLabel" runat="server" Text='<%# Eval("Ann_Texte") %>'
                EnableTheming="false"></asp:Label>
            </ItemTemplate>
        </asp:DataList>
    </form>
</asp:Content>

