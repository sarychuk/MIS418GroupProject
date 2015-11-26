<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="PaymentPage.aspx.vb" Inherits="Customer_PaymentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;</p>
    <asp:Panel ID="Panel1" runat="server">
        <br />
        First Name<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Last Name<br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        Address<br />
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        City<br />
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        Country<br />
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <br />
        Province<br />
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <br />
        Postal code<br />
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <br />
        Phone (optional)<br />
        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <br />
        Credit Card Number<br />
        <asp:TextBox ID="TextBox9" runat="server" MaxLength="16"></asp:TextBox>
        <br />
        Name on card<br />
        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
        <br />
        Expiration date<br />
        <asp:TextBox ID="TextBox11" runat="server" MaxLength="5"></asp:TextBox>
        <br />
        CVV<br />
        <asp:TextBox ID="TextBox12" runat="server" MaxLength="3"></asp:TextBox>
        <br />
    </asp:Panel>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Checkout" />
    </p>
    </asp:Content>

