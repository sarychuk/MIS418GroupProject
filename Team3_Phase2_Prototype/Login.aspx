<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin: 0 auto" align="center">
        <asp:Login ID="userLogin" runat="server" DestinationPageUrl="~/Customer/ViewCatalog.aspx">
        </asp:Login>
    </div>
<asp:ValidationSummary ID="ValidationSummary" runat="server" 
    ValidationGroup="userLogin" />
Don&#39;t have an account with us?<br />
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/registration.aspx">Create an account</asp:HyperLink>
<br />
</asp:Content>

