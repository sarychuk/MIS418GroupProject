<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false"
    CodeFile="ViewReview.aspx.vb" Inherits="Customer_ViewReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin= 0 auto" align="center">
        <asp:SqlDataSource ID="sqldsReviewItem" runat="server" ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>"
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
        <strong>Reviews for</strong> :
        <asp:Label ID="lblProductName" runat="server" Font-Bold="True" 
            Font-Size="Large" Font-Underline="False" ForeColor="Black"></asp:Label>
        <br />
        <br />
        <asp:DataList ID="DataList1" runat="server" DataSourceID="sqldsReviewItem" Height="63px"
            Width="650px">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
            <ItemTemplate>
                <strong>Reviewed By:</strong><br />&nbsp;
                <asp:Label ID="Reviewed_ByLabel" runat="server" Text='<%# Eval("[Reviewed By]") %>' />
                <br />
                <strong>Rating: </strong>
                <br />
                <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
                <br />
                <strong>Review:</strong>
                <br />
                <asp:Label ID="ReviewLabel" runat="server" Text='<%# Eval("Review") %>' />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="--------------------------------"></asp:Label>
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
            <asp:TextBox ID="txtReview" runat="server" Height="99px" Width="271px" MaxLength="8000"
                TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Label ID="lblSbmitMessage" runat="server" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label>
            <br />
            &nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit Review" />
        </div>
    </div>
</asp:Content>
