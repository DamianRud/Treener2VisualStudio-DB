<%@ Page Title="Treeningud" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Treeningud.aspx.cs" Inherits="Treener2.Treeningud" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2>Treeningute nimekiri</h2>
    <br />

    <!-- Таблица просмотра всех тренировок -->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TreeningID" DataSourceID="SqlDataSourceTreeningud" EmptyDataText="Treeninguid ei leitud.">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="TreeningID" HeaderText="ID" ReadOnly="True" SortExpression="TreeningID" />
            <asp:BoundField DataField="nimi" HeaderText="Treeningu nimi" SortExpression="nimi" />
            <asp:BoundField DataField="kirjeldus" HeaderText="Kirjeldus" SortExpression="kirjeldus" />
            <asp:BoundField DataField="kestus" HeaderText="Kestus" SortExpression="kestus" />
            <asp:BoundField DataField="raskustate" HeaderText="Raskustase" SortExpression="raskustate" />
            <asp:BoundField DataField="aeg" HeaderText="Aeg" SortExpression="aeg" />
            <asp:BoundField DataField="SaalNimi" HeaderText="Saal" ReadOnly="True" />
            <asp:BoundField DataField="TreenerNimi" HeaderText="Treener" ReadOnly="True" />
        </Columns>
    </asp:GridView>

    <!-- Источник данных для таблицы тренировок -->
    <asp:SqlDataSource ID="SqlDataSourceTreeningud" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" 
        SelectCommand="SELECT t.[TreeningID], t.[nimi], t.[kirjeldus], t.[kestus], t.[raskustate], t.[aeg], s.[nimi] AS SaalNimi, tr.[nimi] AS TreenerNimi FROM [TreeningSet] t LEFT JOIN [SaalSet] s ON t.[Saal_SaalID] = s.[SaalID] LEFT JOIN [TreenerSet] tr ON t.[Treener_TreenerID] = tr.[TreenerID]" 
        DeleteCommand="DELETE FROM [TreeningSet] WHERE [TreeningID] = @TreeningID" 
        UpdateCommand="UPDATE [TreeningSet] SET [nimi] = @nimi, [kirjeldus] = @kirjeldus, [kestus] = @kestus, [raskustate] = @raskustate WHERE [TreeningID] = @TreeningID">
        <DeleteParameters>
            <asp:Parameter Name="TreeningID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="kirjeldus" Type="String" />
            <asp:Parameter Name="kestus" Type="String" />
            <asp:Parameter Name="raskustate" Type="String" />
            <asp:Parameter Name="TreeningID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
    <hr />
    <h2>Uue treeningu lisamine</h2>
    <br />

    <!-- Форма добавления новой тренировки с выпадающим списком тренеров и залов -->
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="TreeningID" DataSourceID="SqlDataSourceLisaTreening" DefaultMode="Insert" Height="50px" Width="400px">
        <Fields>
            <asp:BoundField DataField="TreeningID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="TreeningID" />
            
            <asp:TemplateField HeaderText="Treeningu nimi">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNimi" runat="server" Text='<%# Bind("nimi") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNimi" runat="server" ControlToValidate="txtNimi" ErrorMessage="Sisesta nimi!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Kirjeldus">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtKirjeldus" runat="server" Text='<%# Bind("kirjeldus") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Kestus (nt 60 min)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtKestus" runat="server" Text='<%# Bind("kestus") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Raskustase">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlRaskustase" runat="server" SelectedValue='<%# Bind("raskustate") %>'>
                        <asp:ListItem Text="-- Vali raskustase --" Value="" />
                        <asp:ListItem Text="Kerge" Value="Kerge" />
                        <asp:ListItem Text="Keskmine" Value="Keskmine" />
                        <asp:ListItem Text="Raske" Value="Raske" />
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Aeg (nt 14:00)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtAeg" runat="server" Text='<%# Bind("aeg") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>

            <%-- Выпадающий список для выбора Зала --%>
            <asp:TemplateField HeaderText="Saal">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlSaal" runat="server" DataSourceID="SqlDataSourceSaalid" DataTextField="nimi" DataValueField="SaalID" SelectedValue='<%# Bind("Saal_SaalID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSaalid" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" 
                        SelectCommand="SELECT [SaalID], [nimi] FROM [SaalSet]">
                    </asp:SqlDataSource>
                </InsertItemTemplate>
            </asp:TemplateField>

            <%-- Выпадающий список для выбора Тренера --%>
            <asp:TemplateField HeaderText="Treener">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlTreener" runat="server" DataSourceID="SqlDataSourceTreenerid" DataTextField="nimi" DataValueField="TreenerID" SelectedValue='<%# Bind("Treener_TreenerID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceTreenerid" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" 
                        SelectCommand="SELECT [TreenerID], [nimi] FROM [TreenerSet]">
                    </asp:SqlDataSource>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True" InsertText="Lisa treening" />
        </Fields>
    </asp:DetailsView>

    <!-- Источник данных для добавления тренировки -->
    <asp:SqlDataSource ID="SqlDataSourceLisaTreening" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" 
        InsertCommand="INSERT INTO [TreeningSet] ([nimi], [kirjeldus], [kestus], [raskustate], [aeg], [SaalID], [TreenerID], [Saal_SaalID], [Treener_TreenerID]) VALUES (@nimi, @kirjeldus, @kestus, @raskustate, @aeg, @Saal_SaalID, @Treener_TreenerID, @Saal_SaalID, @Treener_TreenerID)">
        <InsertParameters>
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="kirjeldus" Type="String" />
            <asp:Parameter Name="kestus" Type="String" />
            <asp:Parameter Name="raskustate" Type="String" />
            <asp:Parameter Name="aeg" Type="Object" />
            <asp:Parameter Name="Saal_SaalID" Type="Int32" />
            <asp:Parameter Name="Treener_TreenerID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>