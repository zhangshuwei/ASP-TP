<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsulterAnnoncesJournaux.aspx.cs" Inherits="ConsulterAnnoncesJournaux" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <form id="form1" runat="server">
        <asp:GridView skinId="tableMaitre" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Ann_Id" DataSourceID="dsAnnonces" EmptyDataText="There are no data records to display." EnableModelValidation="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Ann_Ville" HeaderText="Ville" SortExpression="Ann_Ville" />
                <asp:BoundField DataField="Ann_CodePostal" HeaderText="Code Postal" SortExpression="Ann_CodePostal" />
                <asp:BoundField DataField="Ann_Email" HeaderText="Email" SortExpression="Ann_Email" />
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
        <asp:SqlDataSource ID="dsJournaux" runat="server" 
            ConnectionString="<%$ ConnectionStrings:csAffairesSansRisque %>" 
            SelectCommand="SELECT * FROM [ListeJournauxParAnnonce] WHERE ([Ann_Id] = @Ann_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Ann_Id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView SkinID="tableDetails" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="dsJournaux" >
            <Columns>
                <asp:BoundField DataField="Jou_Publication" HeaderText="Publication" SortExpression="Jou_Publication" />
                <asp:BoundField DataField="Jou_Tirage" HeaderText="Tirage" SortExpression="Jou_Tirage" />
                <asp:BoundField DataField="Jou_LimiteDepot" HeaderText="LimiteDepot" SortExpression="Jou_LimiteDepot" />
                <asp:BoundField DataField="Jou_Parution" HeaderText="Parution" SortExpression="Jou_Parution" />
            </Columns>
        </asp:GridView>
    </form>
</asp:Content>



