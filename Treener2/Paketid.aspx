
<%@ Page Title="Paketid" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Paketid.aspx.cs" Inherits="Treener2.Paketid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2>Pakettide nimekiri</h2>
    <br />

    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="PaketID"
        DataSourceID="SqlDataSourcePaketid"
        EmptyDataText="Pakette ei leitud.">

        <Columns>
            <asp:CommandField ShowEditButton="True"
                ShowDeleteButton="True"
                EditText="Muuda"
                DeleteText="Kustuta"
                UpdateText="Salvesta"
                CancelText="Tühista"
                CausesValidation="False" />

            <asp:BoundField DataField="PaketID"
                HeaderText="ID" ReadOnly="True" />

            <asp:BoundField DataField="nimi"
                HeaderText="Paketi nimi" />

            <asp:BoundField DataField="kuutasu"
                HeaderText="Kuutasu" />

            <asp:BoundField DataField="kirjeldus"
                HeaderText="Kirjeldus" />

            <asp:BoundField DataField="LiikmeNimi"
                HeaderText="Liige" ReadOnly="True" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourcePaketid" runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"

        SelectCommand="
            SELECT
                p.[PaketID],
                p.[nimi],
                p.[kuutasu],
                p.[kirjeldus],
                l.[eesnimi] + ' ' + l.[perekonnanimi] AS LiikmeNimi
            FROM [LiikmelisusePakettiSet] p
            LEFT JOIN [SpordiLiikmeSet] l
                ON p.[SpordiLiikme_LiikID] = l.[LiikID]"

        UpdateCommand="
            UPDATE [LiikmelisusePakettiSet]
            SET [nimi] = @nimi,
                [kuutasu] = @kuutasu,
                [kirjeldus] = @kirjeldus
            WHERE [PaketID] = @PaketID"

        DeleteCommand="
            DELETE FROM [LiikmelisusePakettiSet]
            WHERE [PaketID] = @PaketID"

        OnDeleted="SqlDataSourcePaketid_Deleted">

        <UpdateParameters>
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="kuutasu" Type="Decimal" />
            <asp:Parameter Name="kirjeldus" Type="String" />
            <asp:Parameter Name="PaketID" Type="Int32" />
        </UpdateParameters>

        <DeleteParameters>
            <asp:Parameter Name="PaketID" Type="Int32" />
        </DeleteParameters>

    </asp:SqlDataSource>

    <br />
    <hr />
    <h2>Uue paketi lisamine</h2>
    <br />

    <asp:DetailsView ID="DetailsView1" runat="server"
        AutoGenerateRows="False"
        DefaultMode="Insert"
        DataSourceID="SqlDataSourceLisa"
        Width="400px">

        <Fields>

            <asp:TemplateField HeaderText="Paketi nimi">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNimi" runat="server"
                        Text='<%# Bind("nimi") %>' />

                    <asp:RequiredFieldValidator ID="rfvNimi"
                        runat="server"
                        ControlToValidate="txtNimi"
                        ErrorMessage="Sisesta nimi!"
                        Display="None"
                        ValidationGroup="LisaPakett" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Kuutasu">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtKuutasu" runat="server"
                        TextMode="Number"
                        min="0"
                        step="1"
                        Text='<%# Bind("kuutasu") %>' />
                    &nbsp;€

                    <asp:RequiredFieldValidator ID="rfvKuutasu"
                        runat="server"
                        ControlToValidate="txtKuutasu"
                        ErrorMessage="Sisesta kuutasu!"
                        Display="None"
                        ValidationGroup="LisaPakett" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Kirjeldus">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtKirjeldus" runat="server"
                        Text='<%# Bind("kirjeldus") %>' />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Liige">
                <InsertItemTemplate>

                    <asp:DropDownList ID="ddlLiikmed" runat="server"
                        DataSourceID="SqlDataSourceLiikmed"
                        DataTextField="LiikmeNimi"
                        DataValueField="LiikID"
                        SelectedValue='<%# Bind("LiikID") %>'>
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSourceLiikmed"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"
                        SelectCommand="
                            SELECT [LiikID],
                            [eesnimi] + ' ' + [perekonnanimi] AS LiikmeNimi
                            FROM [SpordiLiikmeSet]">
                    </asp:SqlDataSource>

                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True"
                InsertText="Lisa pakett"
                CancelText="Tühista"
                ValidationGroup="LisaPakett" />

        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourceLisa" runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"

        InsertCommand="
            INSERT INTO [LiikmelisusePakettiSet]
            ([nimi], [kuutasu], [kirjeldus],
             [LiikID], [SpordiLiikme_LiikID])
            VALUES
            (@nimi, @kuutasu, @kirjeldus,
             @LiikID, @LiikID)"

        OnInserted="SqlDataSourceLisa_Inserted">

        <InsertParameters>
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="kuutasu" Type="Decimal" />
            <asp:Parameter Name="kirjeldus" Type="String" />
            <asp:Parameter Name="LiikID" Type="Int32" />
        </InsertParameters>

    </asp:SqlDataSource>

</asp:Content>
