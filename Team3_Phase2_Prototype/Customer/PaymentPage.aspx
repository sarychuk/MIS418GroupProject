<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="PaymentPage.aspx.vb" Inherits="Customer_PaymentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        First Name<br />
        <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
        <br />
        Last Name<br />
        <asp:TextBox ID="TextBox2" runat="server" Enabled="False"></asp:TextBox>
        <br />
        Address<br />
        <asp:TextBox ID="TextBox3" runat="server" Enabled="False"></asp:TextBox>
        <br />
        City<br />
        <asp:TextBox ID="TextBox4" runat="server" Enabled="False"></asp:TextBox>
        <br />
        Country<br />
        <asp:TextBox ID="TextBox5" runat="server" Enabled="False"></asp:TextBox>
        <br />
        Province<br />
        <asp:TextBox ID="TextBox6" runat="server" Enabled="False"></asp:TextBox>
        <br />
        Postal code<br />
        <asp:TextBox ID="TextBox7" runat="server" Enabled="False"></asp:TextBox>
        <br />
        Phone (optional)<br />
        <asp:TextBox ID="TextBox8" runat="server" Enabled="False"></asp:TextBox>
        <br />
    </asp:Panel>
    <p>
        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </p>
    </asp:Content>

