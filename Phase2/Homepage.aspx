<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="Homepage.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="Large" 
        Text="Welcome to the STEP Homepage"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lblRegister" runat="server" Text="Currently not a member?"></asp:Label>
&nbsp;<asp:HyperLink ID="hlinkRegister" runat="server" 
        NavigateUrl="~/registration.aspx">Register Now</asp:HyperLink>
    <br />
    <br />
    <asp:Label ID="lblPlaceOrder" runat="server" Text="Place an order: "></asp:Label>
&nbsp;<asp:HyperLink ID="hlinkViewCatalog" runat="server" 
        NavigateUrl="~/Customer/ViewCatalog.aspx">View Catalog</asp:HyperLink>
    <br />
</asp:Content>

