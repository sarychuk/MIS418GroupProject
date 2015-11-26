<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="MyAccount.aspx.vb" Inherits="Customer_MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
    <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataKeyNames="CustomerID" DataSourceID="sqldsMyAccount" 
            ForeColor="#333333" GridLines="None" Height="50px" Width="172px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" 
                    Visible="False" />
                <asp:BoundField DataField="GivenNames" HeaderText="First Name" 
                    SortExpression="GivenNames" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="Address1" HeaderText="Address 1" 
                    SortExpression="Address1" />
                <asp:BoundField DataField="Address2" HeaderText="Address 2" 
                    SortExpression="Address2" />
                <asp:BoundField DataField="Municipality" HeaderText="City" 
                    SortExpression="Municipality" />
                <asp:BoundField DataField="ProvinceStateCode" HeaderText="Province" 
                    SortExpression="ProvinceStateCode" />
                <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" 
                    SortExpression="PostalCode" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                    Visible="False" />
                <asp:BoundField DataField="PhoneAreaCode" HeaderText="Phone Area Code" 
                    SortExpression="PhoneAreaCode" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" 
                    SortExpression="PhoneNumber" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
    <br />
    <asp:SqlDataSource ID="sqldsMyAccount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
        
            SelectCommand="SELECT Customer.CustomerID, Customer.GivenNames, Customer.LastName, Customer.Address1, Customer.Address2, Customer.Municipality, Customer.ProvinceStateCode, Customer.PostalCode, aspnet_Users.UserId, Customer.PhoneAreaCode, Customer.PhoneNumber FROM Customer INNER JOIN Customer_User ON Customer.CustomerID = Customer_User.CustomerID INNER JOIN aspnet_Users ON Customer_User.UserID = aspnet_Users.UserId AND Customer_User.UserID = aspnet_Users.UserId WHERE (aspnet_Users.UserId = @UserID) ORDER BY Customer.CustomerID" 
            UpdateCommand="UPDATE Customer SET GivenNames = @GivenNames, LastName = @LastName, Address1 = @Address1, Address2 = @Address2, Municipality = @Municipality, ProvinceStateCode = @ProvinceStateCode, PostalCode = @PostalCode, PhoneAreaCode = @PhoneAreaCode, PhoneNumber = @PhoneNumber WHERE (CustomerID = @CustomerID)">
        <SelectParameters>
            <asp:Parameter Name="UserID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="GivenNames" />
            <asp:Parameter Name="LastName" />
            <asp:Parameter Name="Address1" />
            <asp:Parameter Name="Address2" />
            <asp:Parameter Name="Municipality" />
            <asp:Parameter Name="ProvinceStateCode" />
            <asp:Parameter Name="PostalCode" />
            <asp:Parameter Name="PhoneAreaCode" />
            <asp:Parameter Name="PhoneNumber" />
            <asp:Parameter Name="CustomerID" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Panel>
</asp:Content>

