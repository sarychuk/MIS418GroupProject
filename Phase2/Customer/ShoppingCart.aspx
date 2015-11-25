<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="ShoppingCart.aspx.vb" Inherits="Customer_ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 128px">
        Your shoppping cart:<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="odsCart">
        </asp:GridView>
        <asp:ObjectDataSource ID="odsCart" runat="server" SelectMethod="GetCartItems" 
            TypeName="CartModel"></asp:ObjectDataSource>
    </div>
</asp:Content>

