<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="CourseContent.aspx.vb" Inherits="Customer_OnlineCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True" 
            Font-Size="Medium"></asp:Label>
    </p>
    <p>
        Below is a sample of the course outline. Will try to integrate Moodle with out 
        STEP website as Moodle is open source and provides great features.</p>
    <p>
        <asp:Image ID="Image2" runat="server" 
            ImageUrl="~/Resources/online_class_sample.png" />
    </p>
    <p>
        <asp:Button ID="btnExam" runat="server" Text="Take Final Exam" Width="133px" />
    </p>
</asp:Content>

