<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="Homepage.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="vsheadline">
    This is our store starting page</p>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/Customer/mainpage.aspx" ForeColor="#FF3300">Registered Customer Only</asp:HyperLink>
</p>
    <p>
        &nbsp;</p>
    <asp:HyperLink ID="HyperLink2" runat="server">This is a test</asp:HyperLink>
</asp:Content>

