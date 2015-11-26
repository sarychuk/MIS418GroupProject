<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="ShoppingCart.aspx.vb" Inherits="Customer_ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 222px">
        Your shoppping cart:<asp:GridView ID="gvShoppingCart" runat="server" 
            DataSourceID="odsCart" CellPadding="4" 
            EmptyDataText="There are no items in your cart." ForeColor="#333333" 
            GridLines="None" Width="907px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        &nbsp;<br />
        Subtotal : 
        <asp:TextBox ID="txtSubtotal" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnBuyItems" runat="server" Text="Buy" Width="88px" />
        <asp:ObjectDataSource ID="odsCart" runat="server" SelectMethod="GetCartItems" 
            TypeName="CartModel" DeleteMethod="DeleteCartItems">
            <DeleteParameters>
                <asp:Parameter Name="index" Type="Int32" />
            </DeleteParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

