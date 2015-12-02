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
    <asp:FormView ID="FormView1" runat="server" DataSourceID="sqldsReviewItem" 
        EmptyDataText="No reviews available." Width="719px">
        <EditItemTemplate>
            Reviewed By:
            <asp:TextBox ID="Reviewed_ByTextBox" runat="server" 
                Text='<%# Bind("[Reviewed By]") %>' />
            <br />
            Rating:
            <asp:TextBox ID="RatingTextBox" runat="server" Text='<%# Bind("Rating") %>' />
            <br />
            Review:
            <asp:TextBox ID="ReviewTextBox" runat="server" 
                Text='<%# Bind("Review") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Reviewed By:
            <asp:TextBox ID="Reviewed_ByTextBox" runat="server" 
                Text='<%# Bind("[Reviewed By]") %>' />
            <br />
            Rating:
            <asp:TextBox ID="RatingTextBox" runat="server" Text='<%# Bind("Rating") %>' />
            <br />
            Review:
            <asp:TextBox ID="ReviewTextBox" runat="server" 
                Text='<%# Bind("Review") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Reviewed By:
            <asp:Label ID="Reviewed_ByLabel" runat="server" 
                Text='<%# Bind("[Reviewed By]") %>' />
            <br />
            Rating:
            <asp:Label ID="RatingLabel" runat="server" Text='<%# Bind("Rating") %>' />
            <br />
            Review:
            <asp:Label ID="ReviewLabel" runat="server" Text='<%# Bind("Review") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
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
    <div id="divReview" style="height: 397px">
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

