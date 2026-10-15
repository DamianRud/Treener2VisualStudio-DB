<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Treener2.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TreenerID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="TreenerID" HeaderText="TreenerID" ReadOnly="True" SortExpression="TreenerID" />
            <asp:BoundField DataField="nimi" HeaderText="nimi" SortExpression="nimi" />
            <asp:BoundField DataField="epost" HeaderText="epost" SortExpression="epost" />
            <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
            <asp:BoundField DataField="eriala" HeaderText="eriala" SortExpression="eriala" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" DeleteCommand="DELETE FROM [TreenerSet] WHERE [TreenerID] = @TreenerID" InsertCommand="INSERT INTO [TreenerSet] ([nimi], [epost], [telefon], [eriala]) VALUES (@nimi, @epost, @telefon, @eriala)" ProviderName="<%$ ConnectionStrings:Treener2ConnectionString1.ProviderName %>" SelectCommand="SELECT [TreenerID], [nimi], [epost], [telefon], [eriala] FROM [TreenerSet]" UpdateCommand="UPDATE [TreenerSet] SET [nimi] = @nimi, [epost] = @epost, [telefon] = @telefon, [eriala] = @eriala WHERE [TreenerID] = @TreenerID">
        <DeleteParameters>
            <asp:Parameter Name="TreenerID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="epost" Type="String" />
            <asp:Parameter Name="telefon" Type="String" />
            <asp:Parameter Name="eriala" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="epost" Type="String" />
            <asp:Parameter Name="telefon" Type="String" />
            <asp:Parameter Name="eriala" Type="String" />
            <asp:Parameter Name="TreenerID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
