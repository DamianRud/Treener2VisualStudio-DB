<%@ Page Title="Treeningute registreerimine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Treeniregistreerimine.aspx.cs" Inherits="Treener2.Treeniregistreerimine" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2>Aktiivsed registreerimised treeningutele</h2>
    <br />

    <!-- Таблица просмотра, редактирования и удаления записей -->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" DataKeyNames="RegistreerimineID" DataSourceID="SqlDataSourceRegistreerimised" EmptyDataText="Registreerimisi ei leitud.">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>

    <!-- Источник данных для таблицы -->
    <asp:SqlDataSource ID="SqlDataSourceRegistreerimised" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" 
        SelectCommand="SELECT * FROM [TreeniregistrerimineSet1]" 
        DeleteCommand="DELETE FROM [TreeniregistrerimineSet1] WHERE [RegistreerimineID] = @RegistreerimineID" 
        UpdateCommand="UPDATE [TreeniregistrerimineSet1] SET [LiikID] = @LiikID, [TreeningID] = @TreeningID, [Treening_TreeningID] = @TreeningID, [Status] = @Status WHERE [RegistreerimineID] = @RegistreerimineID">
        <DeleteParameters>
            <asp:Parameter Name="RegistreerimineID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LiikID" Type="Int32" />
            <asp:Parameter Name="TreeningID" Type="Int32" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="RegistreerimineID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
    <hr />
    <h2>Uue registreerimise lisamine</h2>
    <br />

    <!-- Форма добавления новой записи -->
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="RegistreerimineID" DataSourceID="SqlDataSourceLisa" DefaultMode="Insert" Height="50px" Width="400px">
        <Fields>
            <asp:BoundField DataField="RegistreerimineID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="RegistreerimineID" />
            
            <asp:TemplateField HeaderText="Liige">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlLiikmed" runat="server" DataSourceID="SqlDataSourceLiikmedList" DataTextField="eesnimi" DataValueField="LiikID" SelectedValue='<%# Bind("LiikID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceLiikmedList" runat="server" ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" SelectCommand="SELECT [LiikID], [eesnimi] + ' ' + [perekonnanimi] AS eesnimi FROM [SpordiLiikmeSet]"></asp:SqlDataSource>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Treening">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlTreeningud" runat="server" DataSourceID="SqlDataSourceTreeningudList" DataTextField="nimi" DataValueField="TreeningID" SelectedValue='<%# Bind("TreeningID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceTreeningudList" runat="server" ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" SelectCommand="SELECT [TreeningID], [nimi] FROM [TreeningSet]"></asp:SqlDataSource>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Staatus">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True" InsertText="Lisa registreerimine" />
        </Fields>
    </asp:DetailsView>

    <!-- Источник данных для добавления с учетом колонки связи -->
    <asp:SqlDataSource ID="SqlDataSourceLisa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" 
        InsertCommand="INSERT INTO [TreeniregistrerimineSet1] ([LiikID], [TreeningID], [Treening_TreeningID], [Status]) VALUES (@LiikID, @TreeningID, @TreeningID, @Status)">
        <InsertParameters>
            <asp:Parameter Name="LiikID" Type="Int32" />
            <asp:Parameter Name="TreeningID" Type="Int32" />
            <asp:Parameter Name="Status" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>