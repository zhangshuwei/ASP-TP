<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DetailsAnnonce.aspx.vb" Inherits="DetailsAnnonce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="dsAnnonce" runat="server" ConnectionString="<%$ ConnectionStrings:csAffairesSansRisque %>"
            DeleteCommand="DELETE FROM [Annonces] WHERE [Ann_Id] = @Ann_Id" 
            SelectCommand="SELECT Annonces.Ann_Id, Annonces.Ann_Texte, Annonces.Ann_Telephone,
Annonces.Ann_Email, Annonces.Ann_Prix, Annonces.Ann_Ville, Annonces.Ann_CodePostal,
Ann_UserEmail, Annonces.Reg_Id, Annonces.Cat_Id, Regions.Reg_Nom, Categories.Cat_Nom FROM
Annonces
INNER JOIN Categories ON Annonces.Cat_Id = Categories.Cat_Id
INNER JOIN Regions ON Annonces.Reg_Id = Regions.Reg_Id
WHERE (Annonces.Ann_Id = @Ann_Id)" 
            UpdateCommand="UPDATE [Annonces] SET [Ann_Texte] = @Ann_Texte, [Ann_Telephone] = @Ann_Telephone, [Ann_Email] = @Ann_Email, [Ann_Prix] = @Ann_Prix, [Ann_Ville] = @Ann_Ville, [Ann_CodePostal] = @Ann_CodePostal, [Ann_UserEmail] = @Ann_UserEmail, [Reg_Id] = @Reg_Id, [Cat_Id] = @Cat_Id WHERE [Ann_Id] = @Ann_Id" 
            ><DeleteParameters>
                <asp:Parameter Name="Ann_Id" Type="Int32" />
            </DeleteParameters>
            
            <SelectParameters>
                <asp:QueryStringParameter Name="Ann_Id" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
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
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="dsAnnonce" DataKeyNames="Ann_Id" Height="50px" Width="125px" EnableModelValidation="True">
            <Fields>
                <asp:BoundField DataField="Ann_Id" HeaderText="Id de l'annonce" InsertVisible="False" ReadOnly="True" SortExpression="Ann_Id" />
                <asp:BoundField DataField="Ann_Texte" HeaderText="Texte de l'annonce" SortExpression="Ann_Texte" />
                <asp:BoundField DataField="Ann_Telephone" HeaderText="Telephone" SortExpression="Ann_Telephone" />
                <asp:BoundField DataField="Ann_Email" HeaderText="Adresse de messagerie" SortExpression="Ann_Email" />
                <asp:BoundField DataField="Ann_Ville" HeaderText="Ville" SortExpression="Ann_Ville" />
                <asp:BoundField DataField="Ann_CodePostal" HeaderText="Code Postal" SortExpression="Ann_CodePostal" />
                <asp:BoundField DataField="Ann_Prix" HeaderText="Montant" SortExpression="Ann_Prix" />
                <asp:BoundField DataField="Ann_UserEmail" HeaderText="Utilisateur du site" SortExpression="Ann_UserEmail" />
                <asp:TemplateField HeaderText="Région" SortExpression="Reg_Id">
                    <EditItemTemplate>
                        <asp:SqlDataSource ID="dsRegions" runat="server" ConnectionString="<%$ ConnectionStrings:csAffairesSansRisque %>" SelectCommand="SELECT * FROM [Regions]"></asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsRegions" DataTextField="Reg_Nom" DataValueField="Reg_Id" SelectedValue='<%# Bind("Reg_Id") %>'>
                        </asp:DropDownList>
                        
                    </EditItemTemplate>
                    
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Reg_Nom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Catégorie" SortExpression="Cat_Id">
                    <EditItemTemplate>
                        <asp:SqlDataSource ID="dsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:csAffairesSansRisque %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsCategory" DataTextField="Cat_Nom" DataValueField="Cat_Id" SelectedValue='<%# Bind("Cat_Id") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Cat_Nom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Reg_Id", "AdministrerAnnonces.aspx?Reg_Id={0}") %>'>Retourner à la liste des annonces</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
    </form>
</asp:Content>

