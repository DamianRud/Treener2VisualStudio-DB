
<%@ Page Title="Saalid" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Saalid.aspx.cs" Inherits="Treener2.Saalid" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Saalide nimekiri</h2>

    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="SaalID"
        DataSourceID="SqlDataSourceSaalid"
        EmptyDataText="Saale ei leitud.">

        <Columns>
            <asp:CommandField ShowEditButton="True"
                ShowDeleteButton="True"
                CausesValidation="False" />

            <asp:BoundField DataField="SaalID"
                HeaderText="ID" ReadOnly="True" />

            <asp:BoundField DataField="number"
                HeaderText="Saali number" />

            <asp:BoundField DataField="nimi"
                HeaderText="Saali nimi" />

            <asp:BoundField DataField="maksimalnemahutus"
                HeaderText="Maksimaalne mahutavus" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceSaalid" runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"
        SelectCommand="SELECT [SaalID], [number], [nimi], [maksimalnemahutus] FROM [SaalSet]"
        UpdateCommand="UPDATE [SaalSet] SET [number] = @number, [nimi] = @nimi, [maksimalnemahutus] = @maksimalnemahutus WHERE [SaalID] = @SaalID"
        DeleteCommand="DELETE FROM [SaalSet] WHERE [SaalID] = @SaalID"
        OnDeleted="SqlDataSourceSaalid_Deleted">

        <UpdateParameters>
            <asp:Parameter Name="number" Type="String" />
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="maksimalnemahutus" Type="Int32" />
            <asp:Parameter Name="SaalID" Type="Int32" />
        </UpdateParameters>

        <DeleteParameters>
            <asp:Parameter Name="SaalID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <br />
    <hr />

    <h2>Uue saali lisamine</h2>

    <asp:DetailsView ID="DetailsView1" runat="server"
        AutoGenerateRows="False"
        DefaultMode="Insert"
        DataSourceID="SqlDataSourceLisa"
        Width="400px">

        <Fields>
            <asp:TemplateField HeaderText="Saali number">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNumber" runat="server"
                        Text='<%# Bind("number") %>' />

                    <asp:RequiredFieldValidator ID="rfvNumber"
                        runat="server"
                        ControlToValidate="txtNumber"
                        ErrorMessage="Sisesta number!"
                        ForeColor="Red"
                        ValidationGroup="LisaSaal" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Saali nimi">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNimi" runat="server"
                        Text='<%# Bind("nimi") %>' />

                    <asp:RequiredFieldValidator ID="rfvNimi"
                        runat="server"
                        ControlToValidate="txtNimi"
                        ErrorMessage="Sisesta nimi!"
                        ForeColor="Red"
                        ValidationGroup="LisaSaal" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Maksimaalne mahutavus">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtMaht" runat="server"
                        Text='<%# Bind("maksimalnemahutus") %>' />

                    <asp:RequiredFieldValidator ID="rfvMaht"
                        runat="server"
                        ControlToValidate="txtMaht"
                        ErrorMessage="Sisesta mahutavus!"
                        ForeColor="Red"
                        ValidationGroup="LisaSaal" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True"
                InsertText="Lisa saal"
                ValidationGroup="LisaSaal" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourceLisa" runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"
        InsertCommand="INSERT INTO [SaalSet] ([number], [nimi], [maksimalnemahutus]) VALUES (@number, @nimi, @maksimalnemahutus)"
        OnInserted="SqlDataSourceLisa_Inserted">

        <InsertParameters>
            <asp:Parameter Name="number" Type="String" />
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="maksimalnemahutus" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>
