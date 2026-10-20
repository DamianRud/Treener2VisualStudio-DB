
<%@ Page Title="Spordialad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact3.aspx.cs" Inherits="Treener2.Contact3" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2>Spordialade nimekiri</h2>
    <br />

    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="SpordialaID"
        DataSourceID="SqlDataSourceSpordiala"
        EmptyDataText="Spordialasid ei leitud."
        OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:CommandField ShowDeleteButton="True"
                ShowEditButton="True"
                CausesValidation="False" />
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

    <br />
    <h2>Lisa spordiala</h2>

    <asp:DetailsView ID="DetailsView1" runat="server"
        AutoGenerateRows="False"
        DataKeyNames="SpordialaID"
        DataSourceID="SqlDataSourceLisa"
        DefaultMode="Insert">

        <Fields>
            <asp:BoundField DataField="SpordialaID"
                HeaderText="ID"
                InsertVisible="False"
                ReadOnly="True" />

            <asp:TemplateField HeaderText="nimi">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"
                        Text='<%# Bind("nimi") %>'>
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNimi"
                        runat="server"
                        ControlToValidate="TextBox1"
                        ErrorMessage="Täida väli!"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="LisaSpordiala" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="kirjeldus">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server"
                        Text='<%# Bind("kirjeldus") %>'>
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvKirjeldus"
                        runat="server"
                        ControlToValidate="TextBox2"
                        ErrorMessage="Täida väli!"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="LisaSpordiala" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True"
                ValidationGroup="LisaSpordiala" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourceLisa" runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"
        SelectCommand="SELECT [SpordialaID], [nimi], [kirjeldus] FROM [SpordialaSet]"
        InsertCommand="INSERT INTO [SpordialaSet] ([nimi], [kirjeldus]) VALUES (@nimi, @kirjeldus)"
        OnInserted="SqlDataSourceLisa_Inserted">

        <InsertParameters>
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="kirjeldus" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>
