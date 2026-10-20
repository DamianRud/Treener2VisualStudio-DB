
<%@ Page Title="Treeningute registreerimine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Treeniregistreerimine.aspx.cs" Inherits="Treener2.Treeniregistreerimine" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2>Aktiivsed registreerimised treeningutele</h2>
    <br />

    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="RegistrerimineID"
        DataSourceID="SqlDataSourceRegistreerimised"
        EmptyDataText="Registreerimisi ei leitud.">

        <Columns>
            <asp:CommandField
                ShowEditButton="True"
                ShowDeleteButton="True"
                CausesValidation="False" />

            <asp:BoundField DataField="RegistrerimineID"
                HeaderText="ID"
                ReadOnly="True" />

            <asp:BoundField DataField="LiikmeNimi"
                HeaderText="Liige"
                ReadOnly="True" />

            <asp:BoundField DataField="TreeninguNimi"
                HeaderText="Treening"
                ReadOnly="True" />

            <asp:BoundField DataField="registreriminekuupaev"
                HeaderText="Registreerimise kuupäev"
                DataFormatString="{0:dd.MM.yyyy HH:mm}"
                ReadOnly="True" />

            <asp:BoundField DataField="Status"
                HeaderText="Staatus" />

        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceRegistreerimised"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"

        SelectCommand="
            SELECT
                r.[RegistrerimineID],
                l.[eesnimi] + ' ' + l.[perekonnanimi] AS LiikmeNimi,
                t.[nimi] AS TreeninguNimi,
                r.[registreriminekuupaev],
                r.[Status]
            FROM [TreeniregistrerimineSet1] r
            LEFT JOIN [SpordiLiikmeSet] l
                ON r.[SpordiLiikme_LiikID] = l.[LiikID]
            LEFT JOIN [TreeningSet] t
                ON r.[Treening_TreeningID] = t.[TreeningID]"

        DeleteCommand="
            DELETE FROM [TreeniregistrerimineSet1]
            WHERE [RegistrerimineID] = @RegistrerimineID"

        UpdateCommand="
            UPDATE [TreeniregistrerimineSet1]
            SET [Status] = @Status
            WHERE [RegistrerimineID] = @RegistrerimineID">

        <DeleteParameters>
            <asp:Parameter Name="RegistrerimineID" Type="Int32" />
        </DeleteParameters>

        <UpdateParameters>
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="RegistrerimineID" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>

    <br />
    <hr />

    <h2>Uue registreerimise lisamine</h2>
    <br />

    <asp:DetailsView ID="DetailsView1" runat="server"
        AutoGenerateRows="False"
        DataSourceID="SqlDataSourceLisa"
        DefaultMode="Insert"
        Width="400px">

        <Fields>

            <asp:TemplateField HeaderText="Liige">
                <InsertItemTemplate>

                    <asp:DropDownList ID="ddlLiikmed"
                        runat="server"
                        DataSourceID="SqlDataSourceLiikmedList"
                        DataTextField="LiikmeNimi"
                        DataValueField="LiikID"
                        SelectedValue='<%# Bind("LiikID") %>'>
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSourceLiikmedList"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"
                        SelectCommand="
                            SELECT [LiikID],
                            [eesnimi] + ' ' + [perekonnanimi] AS LiikmeNimi
                            FROM [SpordiLiikmeSet]">
                    </asp:SqlDataSource>

                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Treening">
                <InsertItemTemplate>

                    <asp:DropDownList ID="ddlTreeningud"
                        runat="server"
                        DataSourceID="SqlDataSourceTreeningudList"
                        DataTextField="nimi"
                        DataValueField="TreeningID"
                        SelectedValue='<%# Bind("TreeningID") %>'>
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSourceTreeningudList"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"
                        SelectCommand="
                            SELECT [TreeningID], [nimi]
                            FROM [TreeningSet]">
                    </asp:SqlDataSource>

                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Staatus">
                <InsertItemTemplate>

                    <asp:TextBox ID="txtStatus"
                        runat="server"
                        Text='<%# Bind("Status") %>'>
                    </asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvStatus"
                        runat="server"
                        ControlToValidate="txtStatus"
                        ErrorMessage="Sisesta staatus!"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="LisaRegistreerimine" />

                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField
                ShowInsertButton="True"
                InsertText="Lisa registreerimine"
                ValidationGroup="LisaRegistreerimine" />

        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourceLisa"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"

        InsertCommand="
            INSERT INTO [TreeniregistrerimineSet1]
            ([LiikID],
             [TreeningID],
             [registreriminekuupaev],
             [Status],
             [SpordiLiikme_LiikID],
             [Treening_TreeningID])
            VALUES
            (@LiikID,
             @TreeningID,
             GETDATE(),
             @Status,
             @LiikID,
             @TreeningID)"

        OnInserted="SqlDataSourceLisa_Inserted">

        <InsertParameters>
            <asp:Parameter Name="LiikID" Type="Int32" />
            <asp:Parameter Name="TreeningID" Type="Int32" />
            <asp:Parameter Name="Status" Type="String" />
        </InsertParameters>

    </asp:SqlDataSource>

</asp:Content>
