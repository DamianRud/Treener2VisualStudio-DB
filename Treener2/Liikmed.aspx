<%@ Page Title="Spordiklubi liikmed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Liikmed.aspx.cs" Inherits="Treener2.Liikmed" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2>Spordiklubi liikmete nimekiri</h2>
    <br />

    <!-- Таблица просмотра, изменения и удаления членов клуба -->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LiikID" DataSourceID="SqlDataSourceLiikmed" EmptyDataText="Liikmeid ei leitud.">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="LiikID" HeaderText="ID" ReadOnly="True" SortExpression="LiikID" />
            <asp:BoundField DataField="eesnimi" HeaderText="Eesnimi" SortExpression="eesnimi" />
            <asp:BoundField DataField="perekonnanimi" HeaderText="Perekonnanimi" SortExpression="perekonnanimi" />
            <asp:BoundField DataField="sunniaeg" HeaderText="Sunniaeg" SortExpression="sunniaeg" />
            <asp:BoundField DataField="epost" HeaderText="E-post" SortExpression="epost" />
            <asp:BoundField DataField="telefonnumber" HeaderText="Telefon" SortExpression="telefonnumber" />
        </Columns>
    </asp:GridView>

    <!-- Источник данных для таблицы -->
    <asp:SqlDataSource ID="SqlDataSourceLiikmed" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" 
        SelectCommand="SELECT [LiikID], [eesnimi], [perekonnanimi], [sunniaeg], [epost], [telefonnumber] FROM [SpordiLiikmeSet]" 
        DeleteCommand="DELETE FROM [SpordiLiikmeSet] WHERE [LiikID] = @LiikID" 
        UpdateCommand="UPDATE [SpordiLiikmeSet] SET [eesnimi] = @eesnimi, [perekonnanimi] = @perekonnanimi, [sunniaeg] = @sunniaeg, [epost] = @epost, [telefonnumber] = @telefonnumber WHERE [LiikID] = @LiikID">
        <DeleteParameters>
            <asp:Parameter Name="LiikID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="eesnimi" Type="String" />
            <asp:Parameter Name="perekonnanimi" Type="String" />
            <asp:Parameter Name="sunniaeg" Type="String" />
            <asp:Parameter Name="epost" Type="String" />
            <asp:Parameter Name="telefonnumber" Type="String" />
            <asp:Parameter Name="LiikID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
    <hr />
    <h2>Uue liikme lisamine</h2>
    <br />

    <!-- Форма добавления нового члена клуба -->
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="LiikID" DataSourceID="SqlDataSourceLisaLiige" DefaultMode="Insert" Height="50px" Width="400px">
        <Fields>
            <asp:BoundField DataField="LiikID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="LiikID" />
            
            <asp:TemplateField HeaderText="Eesnimi">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtEesnimi" runat="server" Text='<%# Bind("eesnimi") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEesnimi" runat="server" ControlToValidate="txtEesnimi" ErrorMessage="Sisesta eesnimi!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Perekonnanimi">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtPerekonnanimi" runat="server" Text='<%# Bind("perekonnanimi") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPerekonnanimi" runat="server" ControlToValidate="txtPerekonnanimi" ErrorMessage="Sisesta perekonnanimi!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Sunniaeg">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSunniaeg" runat="server" Text='<%# Bind("sunniaeg") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="E-post">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtEpost" runat="server" Text='<%# Bind("epost") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Telefonnumber">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtTelefon" runat="server" Text='<%# Bind("telefonnumber") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True" InsertText="Lisa liige" />
        </Fields>
    </asp:DetailsView>

    <!-- Источник данных для добавления -->
    <asp:SqlDataSource ID="SqlDataSourceLisaLiige" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>" 
        InsertCommand="INSERT INTO [SpordiLiikmeSet] ([eesnimi], [perekonnanimi], [sunniaeg], [epost], [telefonnumber]) VALUES (@eesnimi, @perekonnanimi, @sunniaeg, @epost, @telefonnumber)">
        <InsertParameters>
            <asp:Parameter Name="eesnimi" Type="String" />
            <asp:Parameter Name="perekonnanimi" Type="String" />
            <asp:Parameter Name="sunniaeg" Type="String" />
            <asp:Parameter Name="epost" Type="String" />
            <asp:Parameter Name="telefonnumber" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>