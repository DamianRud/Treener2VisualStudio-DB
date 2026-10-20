
<%@ Page Title="Võistlused" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Voistlused.aspx.cs" Inherits="Treener2.Voistlused" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2>Võistluste nimekiri</h2>
    <br />

    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="VoistlusID"
        DataSourceID="SqlDataSourceVoistlused"
        EmptyDataText="Võistlusi ei leitud.">

        <Columns>
            <asp:CommandField ShowEditButton="True"
                ShowDeleteButton="True"
                CausesValidation="False" />

            <asp:BoundField DataField="VoistlusID"
                HeaderText="ID" ReadOnly="True" />

            <asp:BoundField DataField="nimi"
                HeaderText="Võistluse nimi" />

            <asp:BoundField DataField="kuupaev"
                HeaderText="Kuupäev"
                DataFormatString="{0:dd.MM.yyyy HH:mm}"
                ReadOnly="True" />

            <asp:BoundField DataField="asukoht"
                HeaderText="Asukoht" />

            <asp:BoundField DataField="kirjeldus"
                HeaderText="Kirjeldus" />

            <asp:BoundField DataField="SpordialaNimi"
                HeaderText="Spordiala"
                ReadOnly="True" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceVoistlused"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"

        SelectCommand="
            SELECT
                v.[VoistlusID],
                v.[nimi],
                v.[kuupaev],
                v.[asukoht],
                v.[kirjeldus],
                s.[nimi] AS SpordialaNimi
            FROM [VoistlusSet] v
            LEFT JOIN [SpordialaSet] s
                ON v.[Spordiala_SpordialaID] = s.[SpordialaID]"

        UpdateCommand="
            UPDATE [VoistlusSet]
            SET [nimi] = @nimi,
                [asukoht] = @asukoht,
                [kirjeldus] = @kirjeldus
            WHERE [VoistlusID] = @VoistlusID"

        DeleteCommand="
            DELETE FROM [VoistlusSet]
            WHERE [VoistlusID] = @VoistlusID"

        OnDeleted="SqlDataSourceVoistlused_Deleted">

        <UpdateParameters>
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="asukoht" Type="String" />
            <asp:Parameter Name="kirjeldus" Type="String" />
            <asp:Parameter Name="VoistlusID" Type="Int32" />
        </UpdateParameters>

        <DeleteParameters>
            <asp:Parameter Name="VoistlusID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <br />
    <hr />
    <h2>Uue võistluse lisamine</h2>
    <br />

    <asp:DetailsView ID="DetailsView1" runat="server"
        AutoGenerateRows="False"
        DefaultMode="Insert"
        DataSourceID="SqlDataSourceLisa"
        Width="400px">

        <Fields>
            <asp:TemplateField HeaderText="Võistluse nimi">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNimi" runat="server"
                        Text='<%# Bind("nimi") %>' />

                    <asp:RequiredFieldValidator ID="rfvNimi"
                        runat="server"
                        ControlToValidate="txtNimi"
                        ErrorMessage="Sisesta nimi!"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="LisaVoistlus" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Kuupäev (yyyy-MM-dd HH:mm:ss)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtKuupaev" runat="server"
                        Text='<%# Bind("kuupaev") %>' />

                    <asp:RequiredFieldValidator ID="rfvKuupaev"
                        runat="server"
                        ControlToValidate="txtKuupaev"
                        ErrorMessage="Sisesta kuupäev!"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="LisaVoistlus" />

                    <asp:RegularExpressionValidator ID="revKuupaev"
                        runat="server"
                        ControlToValidate="txtKuupaev"
                        ValidationExpression="\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}"
                        ErrorMessage="Vorming: yyyy-MM-dd HH:mm:ss"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="LisaVoistlus" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Asukoht">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtAsukoht" runat="server"
                        Text='<%# Bind("asukoht") %>' />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Kirjeldus">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtKirjeldus" runat="server"
                        Text='<%# Bind("kirjeldus") %>' />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Spordiala">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlSpordiala"
                        runat="server"
                        DataSourceID="SqlDataSourceSpordialad"
                        DataTextField="nimi"
                        DataValueField="SpordialaID"
                        SelectedValue='<%# Bind("SpordialaID") %>'>
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSourceSpordialad"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"
                        SelectCommand="SELECT [SpordialaID], [nimi] FROM [SpordialaSet]">
                    </asp:SqlDataSource>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True"
                InsertText="Lisa võistlus"
                ValidationGroup="LisaVoistlus" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourceLisa"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Treener2ConnectionString1 %>"

        InsertCommand="
            INSERT INTO [VoistlusSet]
            ([nimi], [kuupaev], [asukoht],
             [kirjeldus], [SpordialaID],
             [Spordiala_SpordialaID])
            VALUES
            (@nimi, CONVERT(datetime, @kuupaev, 120),
             @asukoht, @kirjeldus,
             @SpordialaID, @SpordialaID)"

        OnInserted="SqlDataSourceLisa_Inserted">

        <InsertParameters>
            <asp:Parameter Name="nimi" Type="String" />
            <asp:Parameter Name="kuupaev" Type="String" />
            <asp:Parameter Name="asukoht" Type="String" />
            <asp:Parameter Name="kirjeldus" Type="String" />
            <asp:Parameter Name="SpordialaID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>
