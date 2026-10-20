
<%@ Page Title="Võistlustel osalejad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Osalejad.aspx.cs" Inherits="Treener2.Osalejad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2>Võistlustel osalejad</h2>
    <br />

    <asp:SqlDataSource ID="SqlDataSourceLiikmed" runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"
        SelectCommand="SELECT [LiikID], [eesnimi] + ' ' + [perekonnanimi] AS LiikmeNimi FROM [SpordiLiikmeSet]" />

    <asp:SqlDataSource ID="SqlDataSourceVoistlused" runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"
        SelectCommand="SELECT [VoistlusID], [nimi] FROM [VoistlusSet]" />

    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="LiikvoistlusedID"
        DataSourceID="SqlDataSourceOsalejad"
        EmptyDataText="Osalejaid ei leitud.">

        <Columns>
            <asp:CommandField ShowEditButton="True"
                ShowDeleteButton="True"
                CausesValidation="False" />

            <asp:BoundField DataField="LiikvoistlusedID"
                HeaderText="ID"
                ReadOnly="True" />

            <asp:TemplateField HeaderText="Liige">
                <ItemTemplate>
                    <%# Eval("LiikmeNimi") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlEditLiige" runat="server"
                        DataSourceID="SqlDataSourceLiikmed"
                        DataTextField="LiikmeNimi"
                        DataValueField="LiikID"
                        SelectedValue='<%# Bind("LiikID") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Võistlus">
                <ItemTemplate>
                    <%# Eval("VoistluseNimi") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlEditVoistlus" runat="server"
                        DataSourceID="SqlDataSourceVoistlused"
                        DataTextField="nimi"
                        DataValueField="VoistlusID"
                        SelectedValue='<%# Bind("VoistlusID") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceOsalejad" runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"

        SelectCommand="
            SELECT
                o.[LiikvoistlusedID],
                o.[LiikID],
                o.[VoistlusID],
                l.[eesnimi] + ' ' + l.[perekonnanimi] AS LiikmeNimi,
                v.[nimi] AS VoistluseNimi
            FROM [LiikvoistlusesSet] o
            LEFT JOIN [SpordiLiikmeSet] l
                ON o.[SpordiLiikme_LiikID] = l.[LiikID]
            LEFT JOIN [VoistlusSet] v
                ON o.[Voistlus_VoistlusID] = v.[VoistlusID]"

        UpdateCommand="
            UPDATE [LiikvoistlusesSet]
            SET [LiikID] = @LiikID,
                [VoistlusID] = @VoistlusID,
                [SpordiLiikme_LiikID] = @LiikID,
                [Voistlus_VoistlusID] = @VoistlusID,
                [SpordiLiikme1_LiikID] = @LiikID
            WHERE [LiikvoistlusedID] = @LiikvoistlusedID"

        DeleteCommand="
            DELETE FROM [LiikvoistlusesSet]
            WHERE [LiikvoistlusedID] = @LiikvoistlusedID"

        OnDeleted="SqlDataSourceOsalejad_Deleted">

        <UpdateParameters>
            <asp:Parameter Name="LiikID" Type="Int32" />
            <asp:Parameter Name="VoistlusID" Type="Int32" />
            <asp:Parameter Name="LiikvoistlusedID" Type="Int32" />
        </UpdateParameters>

        <DeleteParameters>
            <asp:Parameter Name="LiikvoistlusedID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <br />
    <hr />

    <h2>Uue osaleja lisamine</h2>
    <br />

    <asp:DetailsView ID="DetailsView1" runat="server"
        AutoGenerateRows="False"
        DataSourceID="SqlDataSourceLisa"
        DefaultMode="Insert"
        Width="400px">

        <Fields>
            <asp:TemplateField HeaderText="Liige">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlLiikmed" runat="server"
                        DataSourceID="SqlDataSourceLiikmed"
                        DataTextField="LiikmeNimi"
                        DataValueField="LiikID"
                        SelectedValue='<%# Bind("LiikID") %>' />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Võistlus">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlVoistlused" runat="server"
                        DataSourceID="SqlDataSourceVoistlused"
                        DataTextField="nimi"
                        DataValueField="VoistlusID"
                        SelectedValue='<%# Bind("VoistlusID") %>' />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True"
                InsertText="Lisa osaleja"
                ValidationGroup="LisaOsaleja" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourceLisa" runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"

        InsertCommand="
            INSERT INTO [LiikvoistlusesSet]
            ([LiikID], [VoistlusID],
             [SpordiLiikme_LiikID],
             [Voistlus_VoistlusID],
             [SpordiLiikme1_LiikID])
            VALUES
            (@LiikID, @VoistlusID,
             @LiikID, @VoistlusID, @LiikID)"

        OnInserted="SqlDataSourceLisa_Inserted">

        <InsertParameters>
            <asp:Parameter Name="LiikID" Type="Int32" />
            <asp:Parameter Name="VoistlusID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>
