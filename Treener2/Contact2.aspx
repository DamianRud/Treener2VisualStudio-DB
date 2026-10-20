
<%@ Page Title="Ametitöötajad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact2.aspx.cs" Inherits="Treener2.Contact2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <h3>Ametitöötaja tabel</h3>

        <asp:GridView ID="GridView1" runat="server"
            AllowSorting="True"
            AutoGenerateColumns="False"
            DataKeyNames="TreenerID"
            DataSourceID="SqlDataSource1"
            EmptyDataText="There are no data records to display."
            OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                <asp:BoundField DataField="TreenerID" HeaderText="TreenerID" ReadOnly="True" SortExpression="TreenerID" />
                <asp:BoundField DataField="nimi" HeaderText="nimi" SortExpression="nimi" />
                <asp:BoundField DataField="epost" HeaderText="epost" SortExpression="epost" />
                <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
                <asp:BoundField DataField="eriala" HeaderText="eriala" SortExpression="eriala" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString4 %>"
            ProviderName="<%$ ConnectionStrings:Treener2ConnectionString4.ProviderName %>"
            SelectCommand="SELECT [TreenerID], [nimi], [epost], [telefon], [eriala] FROM [TreenerSet]"
            InsertCommand="INSERT INTO [TreenerSet] ([nimi], [epost], [telefon], [eriala]) VALUES (@nimi, @epost, @telefon, @eriala)"
            UpdateCommand="UPDATE [TreenerSet] SET [nimi] = @nimi, [epost] = @epost, [telefon] = @telefon, [eriala] = @eriala WHERE [TreenerID] = @TreenerID"
            DeleteCommand="DELETE FROM [TreenerSet] WHERE [TreenerID] = @TreenerID">
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

        <br />
        <h2>Lisa töötaja</h2>

        <asp:DetailsView ID="DetailsView1" runat="server"
            AutoGenerateRows="False"
            DataKeyNames="TreenerID"
            DataSourceID="SqlDataSource2"
            DefaultMode="Insert"
            Height="50px"
            Width="125px">
            <Fields>
                <asp:BoundField DataField="TreenerID" HeaderText="TreenerID" InsertVisible="False" ReadOnly="True" SortExpression="TreenerID" />

                <asp:TemplateField HeaderText="nimi" SortExpression="nimi">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nimi") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNimi" runat="server" ControlToValidate="TextBox1" ErrorMessage="Täida väli!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="epost" SortExpression="epost">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("epost") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEpost" runat="server" ControlToValidate="TextBox2" ErrorMessage="Täida väli!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="telefon" SortExpression="telefon">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("telefon") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefon" runat="server" ControlToValidate="TextBox3" ErrorMessage="Täida väli!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="eriala" SortExpression="eriala">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("eriala") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEriala" runat="server" ControlToValidate="TextBox4" ErrorMessage="Täida väli!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString4 %>"
            ProviderName="<%$ ConnectionStrings:Treener2ConnectionString4.ProviderName %>"
            SelectCommand="SELECT * FROM [TreenerSet]"
            InsertCommand="INSERT INTO [TreenerSet] ([nimi], [epost], [telefon], [eriala]) VALUES (@nimi, @epost, @telefon, @eriala)">
            <InsertParameters>
                <asp:Parameter Name="nimi" Type="String" />
                <asp:Parameter Name="epost" Type="String" />
                <asp:Parameter Name="telefon" Type="String" />
                <asp:Parameter Name="eriala" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

        <br />
    </main>
</asp:Content>
