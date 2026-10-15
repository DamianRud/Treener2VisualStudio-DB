<%@ Page Title="Spordialad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact3.aspx.cs" Inherits="Treener2.Contact3" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <h2>Spordialade nimekiri</h2>
    <br />

    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SpordialaID" DataSourceID="SqlDataSourceSpordiala" EmptyDataText="Spordialasid ei leitud.">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="SpordialaID" HeaderText="ID" ReadOnly="True" SortExpression="SpordialaID" />
            <asp:BoundField DataField="nimi" HeaderText="Spordiala nimi" SortExpression="nimi" />
            <asp:BoundField DataField="kirjeldus" HeaderText="Kirjeldus" SortExpression="kirjeldus" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceSpordiala" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" 
        SelectCommand="SELECT [SpordialaID], [nimi], [kirjeldus] FROM [SpordialaSet]" 
        DeleteCommand="DELETE FROM [SpordialaSet] WHERE [SpordialaID] = @SpordialaID" 
        UpdateCommand="UPDATE [SpordialaSet] SET [nimi] = @nimi, [kirjeldus] = @kirjeldus WHERE [SpordialaID] = @SpordialaID">
        <DeleteParameters>
            <asp:Parameter Name="SpordialaID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="kirjeldus" Type="String" />
            <asp:Parameter Name="SpordialaID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>