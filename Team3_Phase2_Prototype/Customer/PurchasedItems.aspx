<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false"
    CodeFile="PurchasedItems.aspx.vb" Inherits="Customer_OnSale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0 auto" align="center">
        Your Account Number:
        <asp:DropDownList ID="ddlAccountID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
            DataTextField="AccountID" DataValueField="AccountID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>"
            SelectCommand="SELECT Account.AccountID FROM Customer AS c INNER JOIN Customer_User AS cu ON c.CustomerID = cu.CustomerID INNER JOIN Account ON c.CustomerID = Account.CustomerID WHERE (cu.UserID = @userId)">
            <SelectParameters>
                <asp:Parameter DbType="Guid" Name="userId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        Your Online Courses:<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID"
            DataSourceID="SqlDataSource2" Width="985px" CellPadding="4" ForeColor="#333333"
            GridLines="None" EmptyDataText="You have not purchased any courses.">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="OrderID" />
                <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName" />
                <asp:BoundField DataField="OrderDate" HeaderText="Date Ordered" SortExpression="OrderDate"
                    DataFormatString="{0:D}" />
                <asp:BoundField DataField="RequiredDate" HeaderText="Date Required" SortExpression="RequiredDate"
                    DataFormatString="{0:D}" />
                <asp:BoundField DataField="ShippedDate" HeaderText="Date Shipped" SortExpression="ShippedDate"
                    DataFormatString="{0:D}" />
                <asp:TemplateField HeaderText="Access">
                    <ItemTemplate>
                        <asp:Button ID="btnGoToCourse" runat="server" CausesValidation="false" CommandName="GoToCourse"
                            Text="Open course..." CommandArgument="<%# Container.DataItemIndex %>" />
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reviews">
                    <ItemTemplate>
                        <asp:Button ID="btnReview" runat="server" CausesValidation="false" CommandName="GoToReviews"
                            Text="Go to reviews..." CommandArgument="<%# Container.DataItemIndex %>" />
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
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
        <br />
        Your Products:<br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="OrderID" DataSourceID="sdsMyProductsProducts" EmptyDataText="You have not purchased any products."
            ForeColor="#333333" GridLines="None" Width="981px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="OrderID" />
                <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName" />
                <asp:BoundField DataField="OrderDate" DataFormatString="{0:D}" HeaderText="Date Ordered"
                    SortExpression="OrderDate" />
                <asp:BoundField DataField="RequiredDate" DataFormatString="{0:D}" HeaderText="Date Required"
                    SortExpression="RequiredDate" />
                <asp:BoundField DataField="ShippedDate" DataFormatString="{0:D}" HeaderText="Date Shipped"
                    SortExpression="ShippedDate" />
                <asp:TemplateField HeaderText="Reviews">
                    <ItemTemplate>
                        <asp:Button ID="btnReview" runat="server" CausesValidation="false" CommandName="GoToReviews"
                            Text="Go to reviews..." CommandArgument="<%# Container.DataItemIndex %>" />
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="sdsMyProductsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>"
            SelectCommand="SELECT [Order].OrderID, Product.ProductName, [Order].OrderDate, [Order].RequiredDate, [Order].ShippedDate FROM [Order] INNER JOIN Account ON [Order].AccountID = Account.AccountID INNER JOIN OrderItem ON [Order].OrderID = OrderItem.OrderID INNER JOIN Product ON OrderItem.ProductID = Product.ProductID WHERE (Account.AccountID = @AccountID) AND (Product.ProductTypeCode = 'Product')">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAccountID" Name="AccountID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:ObjectDataSource ID="odsCustomerAccount" runat="server" SelectMethod="UserName"
            TypeName="Customer"></asp:ObjectDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>"
            SelectCommand="SELECT [Order].OrderID, Product.ProductName, [Order].OrderDate, [Order].RequiredDate, [Order].ShippedDate FROM [Order] INNER JOIN Account ON [Order].AccountID = Account.AccountID INNER JOIN OrderItem ON [Order].OrderID = OrderItem.OrderID INNER JOIN Product ON OrderItem.ProductID = Product.ProductID WHERE (Account.AccountID = @AccountID) AND (Product.ProductTypeCode = 'OnlineCourse')">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAccountID" Name="AccountID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
