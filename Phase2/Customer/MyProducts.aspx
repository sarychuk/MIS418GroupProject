<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="MyProducts.aspx.vb" Inherits="Customer_OnSale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Your Account Number:<br />
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
    Your Products:<br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="OrderID" DataSourceID="SqlDataSource2" Width="985px">
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
    </asp:GridView>
    <asp:ObjectDataSource ID="odsCustomerAccount" runat="server" 
        SelectMethod="UserName" TypeName="Customer"></asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
        
        SelectCommand="SELECT [Order].OrderID, Product.ProductName, [Order].OrderDate, [Order].RequiredDate, [Order].ShippedDate FROM [Order] INNER JOIN Account ON [Order].AccountID = Account.AccountID INNER JOIN OrderItem ON [Order].OrderID = OrderItem.OrderID INNER JOIN Product ON OrderItem.ProductID = Product.ProductID WHERE (Account.AccountID = @AccountID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlAccountID" Name="AccountID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

