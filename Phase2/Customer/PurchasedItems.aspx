<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="PurchasedItems.aspx.vb" Inherits="Customer_OnSale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Your Account Number:
    <asp:DropDownList ID="ddlAccountID" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="AccountID" 
        DataValueField="AccountID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
        
        SelectCommand="SELECT Account.AccountID FROM Customer AS c INNER JOIN Customer_User AS cu ON c.CustomerID = cu.CustomerID INNER JOIN Account ON c.CustomerID = Account.CustomerID WHERE (cu.UserID = @userId)">
        <SelectParameters>
            <asp:Parameter DbType="Guid" Name="userId" />
        </SelectParameters>
        </asp:SqlDataSource>
    <br />
    <br />
    Your Online Courses:<br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="OrderID" DataSourceID="SqlDataSource2" Width="985px" 
    CellPadding="4" ForeColor="#333333" GridLines="None" 
        EmptyDataText="You have not purchased any courses.">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" 
                SortExpression="ProductName" />
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                SortExpression="OrderDate" DataFormatString="{0:D}" />
            <asp:BoundField DataField="RequiredDate" HeaderText="RequiredDate" 
                SortExpression="RequiredDate" DataFormatString="{0:D}" />
            <asp:BoundField DataField="ShippedDate" HeaderText="ShippedDate" 
                SortExpression="ShippedDate" DataFormatString="{0:D}" />
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
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="OrderID" DataSourceID="sdsMyProductsProducts" 
        EmptyDataText="You have not purchased any products." ForeColor="#333333" 
        GridLines="None" Width="981px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                SortExpression="ProductName" />
            <asp:BoundField DataField="OrderDate" DataFormatString="{0:D}" 
                HeaderText="OrderDate" SortExpression="OrderDate" />
            <asp:BoundField DataField="RequiredDate" DataFormatString="{0:D}" 
                HeaderText="RequiredDate" SortExpression="RequiredDate" />
            <asp:BoundField DataField="ShippedDate" DataFormatString="{0:D}" 
                HeaderText="ShippedDate" SortExpression="ShippedDate" />
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
    <asp:SqlDataSource ID="sdsMyProductsProducts" runat="server" 
        ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
        SelectCommand="SELECT [Order].OrderID, Product.ProductName, [Order].OrderDate, [Order].RequiredDate, [Order].ShippedDate FROM [Order] INNER JOIN Account ON [Order].AccountID = Account.AccountID INNER JOIN OrderItem ON [Order].OrderID = OrderItem.OrderID INNER JOIN Product ON OrderItem.ProductID = Product.ProductID WHERE (Account.AccountID = @AccountID) AND (Product.ProductTypeCode = 'Product')">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlAccountID" Name="AccountID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:ObjectDataSource ID="odsCustomerAccount" runat="server" 
        SelectMethod="UserName" TypeName="Customer"></asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
        
        
        SelectCommand="SELECT [Order].OrderID, Product.ProductName, [Order].OrderDate, [Order].RequiredDate, [Order].ShippedDate FROM [Order] INNER JOIN Account ON [Order].AccountID = Account.AccountID INNER JOIN OrderItem ON [Order].OrderID = OrderItem.OrderID INNER JOIN Product ON OrderItem.ProductID = Product.ProductID WHERE (Account.AccountID = @AccountID) AND (Product.ProductTypeCode = 'OnlineCourse')">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlAccountID" Name="AccountID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

