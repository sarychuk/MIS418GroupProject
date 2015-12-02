<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="WelcomeScreen.aspx.vb" Inherits="Customer_mainpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Navigate to the following:</p>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/Customer/ViewCatalog.aspx">View Catalog</asp:HyperLink>
    </p>
<p>
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/Customer/ShoppingCart.aspx">Shopping Cart</asp:HyperLink>
    </p>
<p>
        <asp:HyperLink ID="HyperLink3" runat="server" 
            NavigateUrl="~/Customer/PurchasedItems.aspx">Purchased Items</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

