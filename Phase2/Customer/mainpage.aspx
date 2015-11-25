<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="Mainpage.aspx.vb" Inherits="Customer_mainpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    This is customer main page</p>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/Customer/ViewCatalog.aspx">Browse &amp; Shopping</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

