<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="theirMovies.aspx.vb" Inherits="Customer_theirMovies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:DropDownList ID="ddlActorIDList" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="FullName" 
        DataValueField="ActorID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:sarychukConnectionString1 %>" 
        
        SelectCommand="SELECT actorID, actorFirstName + ' ' + actorLastName AS FullName FROM actor"></asp:SqlDataSource>
    <asp:GridView ID="gdvMovies" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="movieID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="movieID" HeaderText="movieID" 
                ReadOnly="True" SortExpression="movieID" />
            <asp:BoundField DataField="movieName" HeaderText="movieName" 
                SortExpression="movieName" />
        </Columns>
        <SelectedRowStyle BackColor="Silver" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:sarychukConnectionString1 %>" 
        
        SelectCommand="SELECT movie.movieID, movie.movieName FROM movie INNER JOIN movieActor ON movie.movieID = movieActor.movieID WHERE (movieActor.actorID = @actorNum)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlActorIDList" Name="actorNum" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="sqldsOrder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:sarychukConnectionString1 %>" 
        
        SelectCommand="SELECT movieOrder.orderID, movieOrder.customerID FROM movieOrder INNER JOIN movieCustomer ON movieOrder.customerID = movieCustomer.customerID AND movieOrder.orderStatus = 'PENDING' WHERE (movieOrder.customerID = @custID)" 
        
        InsertCommand="INSERT INTO movieOrder(orderDate, customerID, orderStatus) VALUES (@orderDate, @custID, N'Pending')">
        <InsertParameters>
            <asp:Parameter Name="orderDate" />
            <asp:Parameter Name="custID" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="custID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="gdvOrderLine" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="orderLineID" DataSourceID="sqldsOrderLine" 
        EmptyDataText="No records found" ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="quantity" HeaderText="quantity" 
                SortExpression="quantity" />
            <asp:BoundField DataField="orderLineID" HeaderText="orderLineID" 
                ReadOnly="True" SortExpression="orderLineID" />
        </Columns>
        <SelectedRowStyle BackColor="Silver" />
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsOrderLine" runat="server" 
        ConnectionString="<%$ ConnectionStrings:sarychukConnectionString1 %>" 
        
    SelectCommand="SELECT movieOrderLine.quantity, movieOrderLine.orderLineID FROM movieOrderLine INNER JOIN movieOrder ON movieOrderLine.orderID = movieOrder.orderID WHERE (movieOrderLine.movieID = @movieID) AND (movieOrder.orderID = @orderID)" 
    InsertCommand="INSERT INTO movieOrderLine(orderID, movieID, quantity) VALUES (@orderID, @movieID, @quantity)" 
    UpdateCommand="UPDATE movieOrderLine SET quantity = @quantity WHERE (orderLineID = @orderLineID)">
        <InsertParameters>
            <asp:Parameter Name="orderID" />
            <asp:Parameter Name="movieID" />
            <asp:Parameter Name="quantity" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="movieID" />
            <asp:Parameter Name="orderID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="quantity" />
            <asp:Parameter Name="orderLineID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblWarning" runat="server" ForeColor="Red"></asp:Label>
<br />
<asp:Label ID="lblQuantity" runat="server" Text="Quantity"></asp:Label>
&nbsp;<asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btnAdd" runat="server" Text="Add to Cart" />
    <p>
        &nbsp;</p>
</asp:Content>

