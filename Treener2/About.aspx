
<%@ Page Title="Töölaud" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Treener2.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Töölaud</h2>
    <p>Spordiklubi haldussüsteem</p>

    <h3>Haldamine</h3>

    <ul>
        <li><a runat="server" href="~/Contact2">Ametitöötajad</a> – treenerite haldamine</li>
        <li><a runat="server" href="~/Contact3">Spordialad</a> – spordialade haldamine</li>
        <li><a runat="server" href="~/Treeningud">Treeningud</a> – treeningute haldamine</li>
        <li><a runat="server" href="~/Liikmed">Liikmed</a> – spordiklubi liikmete haldamine</li>
        <li><a runat="server" href="~/Treeniregistreerimine">Registreerimine</a> – treeningutele registreerimine</li>
    </ul>

</asp:Content>
