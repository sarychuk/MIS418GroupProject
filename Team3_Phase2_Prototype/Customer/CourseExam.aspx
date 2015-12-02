<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="CourseExam.aspx.vb" Inherits="Customer_CourseExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Exams will also be handled by Moodle, so there will be a link below to navigate 
        there...</p>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server">Go to external exam page...</asp:HyperLink>
    </p>
</asp:Content>

