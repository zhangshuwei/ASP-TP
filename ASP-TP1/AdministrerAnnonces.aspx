<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdministrerAnnonces.aspx.cs" Inherits="AdministrerAnnonces" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <form id="form1" runat="server">
        <asp:GridView skinId="tableMaitre" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Ann_Id" DataSourceID="dsAnnonces" EmptyDataText="There are no data records to display." EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="Ann_Ville" HeaderText="Ville" SortExpression="Ann_Ville" />
                <asp:BoundField DataField="Ann_CodePostal" HeaderText="Code Postal" SortExpression="Ann_CodePostal" />
                <asp:BoundField DataField="Ann_Email" HeaderText="Email" SortExpression="Ann_Email" />
                <asp:HyperLinkField 
                    DataNavigateUrlFields="Ann_Id"
                    DataNavigateUrlFormatString="DetailsAnnonce.aspx?ID={0}" 
                    HeaderText="Détails" Text="Détails..." />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dsAnnonces" runat="server" 
            ConnectionString="<%$ ConnectionStrings:csAffairesSansRisque %>" 
            ProviderName="<%$ ConnectionStrings:csAffairesSansRisque.ProviderName %>" 
            SelectCommand="SELECT [Ann_Id], [Ann_Texte], [Ann_Telephone], [Ann_Email], [Ann_Prix], [Ann_Ville], [Ann_CodePostal], [Ann_UserEmail], [Reg_Id], [Cat_Id] FROM [Annonces]" >
            <DeleteParameters>
                <asp:Parameter Name="Ann_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ann_Texte" Type="String" />
                <asp:Parameter Name="Ann_Telephone" Type="String" />
                <asp:Parameter Name="Ann_Email" Type="String" />
                <asp:Parameter Name="Ann_Prix" Type="String" />
                <asp:Parameter Name="Ann_Ville" Type="String" />
                <asp:Parameter Name="Ann_CodePostal" Type="String" />
                <asp:Parameter Name="Ann_UserEmail" Type="String" />
                <asp:Parameter Name="Reg_Id" Type="Int32" />
                <asp:Parameter Name="Cat_Id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ann_Texte" Type="String" />
                <asp:Parameter Name="Ann_Telephone" Type="String" />
                <asp:Parameter Name="Ann_Email" Type="String" />
                <asp:Parameter Name="Ann_Prix" Type="String" />
                <asp:Parameter Name="Ann_Ville" Type="String" />
                <asp:Parameter Name="Ann_CodePostal" Type="String" />
                <asp:Parameter Name="Ann_UserEmail" Type="String" />
                <asp:Parameter Name="Reg_Id" Type="Int32" />
                <asp:Parameter Name="Cat_Id" Type="Int32" />
                <asp:Parameter Name="Ann_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>



