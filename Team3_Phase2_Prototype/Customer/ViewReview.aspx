<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="ViewReview.aspx.vb" Inherits="Customer_ViewReview" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #Text1
        {
            height: 82px;
            width: 271px;
        }
        #Reset1
        {
            width: 117px;
        }
        #btnReset
        {
            width: 111px;
        }
        #Submit1
        {
            width: 107px;
        }
        #btnSubmit
        {
            width: 108px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="sqldsReviewItem" runat="server" 
        ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
        InsertCommand="INSERT INTO ProductReview(ReviewStar, ReviewText, ReviewedBy, ProductID) VALUES (@ReviewStar, @ReviewText, @ReviewedBy, @ProductID)" 
        
        SelectCommand="SELECT Customer.GivenNames + ' ' + Customer.LastName AS [Reviewed By], ProductReview.ReviewStar AS Rating, ProductReview.ReviewText AS Review FROM Customer INNER JOIN Customer_User ON Customer.CustomerID = Customer_User.CustomerID INNER JOIN aspnet_Users ON Customer_User.UserID = aspnet_Users.UserId INNER JOIN ProductReview ON aspnet_Users.UserId = ProductReview.ReviewedBy INNER JOIN Product ON ProductReview.ProductID = Product.ProductID WHERE (Product.ProductID = @productID)">
        <InsertParameters>
            <asp:Parameter Name="ReviewStar" />
            <asp:Parameter Name="ReviewText" />
            <asp:Parameter Name="ReviewedBy" />
            <asp:Parameter Name="ProductID" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="productID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Reviews for :
    <asp:Label ID="lblProductName" runat="server"></asp:Label>
    <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="sqldsReviewItem" 
        Height="63px" Width="650px">
        <ItemTemplate>
            Reviewed By:
            <asp:Label ID="Reviewed_ByLabel" runat="server" 
                Text='<%# Eval("[Reviewed By]") %>' />
            <br />
            Rating:
            <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
            <br />
            Review:
            <asp:Label ID="ReviewLabel" runat="server" Text='<%# Eval("Review") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <div id="divReview" style="height: 397px">
        <br />
        Leave a review<br />
        <br />
        Rating:
        <asp:RadioButtonList ID="rblRatings" runat="server">
            <asp:ListItem Value="1">Poor</asp:ListItem>
            <asp:ListItem Value="2">Fair</asp:ListItem>
            <asp:ListItem Selected="True" Value="3">Average</asp:ListItem>
            <asp:ListItem Value="4">Good</asp:ListItem>
            <asp:ListItem Value="5">Excellent</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        Review:<br />

        <asp:TextBox ID="txtReview" runat="server" Height="99px" Width="271px" 
            MaxLength="8000" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Label ID="lblSbmitMessage" runat="server" Font-Bold="True" ForeColor="Red" 
            Visible="False"></asp:Label>
        <br />
&nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit Review" />
    </div>
</asp:Content>

