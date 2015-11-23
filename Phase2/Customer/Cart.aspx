<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="Customer_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="gdvCart" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="orderLineID" DataSourceID="sqldsCart" 
            EmptyDataText="This is nothing in your cart">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="orderLineID" HeaderText="orderLineID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="orderLineID" 
                    Visible="False" />
                <asp:BoundField DataField="movieName" HeaderText="movieName" ReadOnly="True" 
                    SortExpression="movieName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="moviePrice" HeaderText="moviePrice" ReadOnly="True" 
                    SortExpression="moviePrice" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="sqldsCart" runat="server" 
            ConnectionString="<%$ ConnectionStrings:yjiConnectionString1 %>" 
            DeleteCommand="DELETE FROM movieOrderLine WHERE (orderLineID = @orderLineID)" 
            SelectCommand="SELECT movieOrderLine.orderLineID, movie.movieName, movieOrderLine.Quantity, movie.moviePrice FROM movieOrderLine INNER JOIN movie ON movieOrderLine.movieID = movie.movieID WHERE (movieOrderLine.orderID = @orderID)" 
            UpdateCommand="UPDATE movieOrderLine SET Quantity = @Quantity WHERE (orderLineID = @orderLineID)">
            <DeleteParameters>
                <asp:Parameter Name="orderLineID" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="orderID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Quantity" />
                <asp:Parameter Name="orderLineID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>

