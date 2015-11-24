<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="MyProducts.aspx.vb" Inherits="Customer_OnSale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Your Account Number:<br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="CustomerID" 
        DataValueField="CustomerID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
        SelectCommand="SELECT CustomerID FROM Customer"></asp:SqlDataSource>
    <br />
    Your Products:<br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="OrderID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                SortExpression="ProductName" />
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                SortExpression="OrderDate" />
            <asp:BoundField DataField="RequiredDate" HeaderText="RequiredDate" 
                SortExpression="RequiredDate" />
            <asp:BoundField DataField="ShippedDate" HeaderText="ShippedDate" 
                SortExpression="ShippedDate" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                SortExpression="CustomerID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
        SelectCommand="SELECT [Order].OrderID, Product.ProductName, [Order].OrderDate, [Order].RequiredDate, [Order].ShippedDate, [Order].CustomerID FROM [Order] CROSS JOIN Product WHERE ([Order].CustomerID = @CustID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="CustID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

