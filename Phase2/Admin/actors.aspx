<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="actors.aspx.vb" Inherits="actors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    This is a list of actors<asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="ActorID" 
            DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display." CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="ActorID" HeaderText="ActorID" ReadOnly="True" 
                    SortExpression="ActorID" />
                <asp:BoundField DataField="ActorLastName" HeaderText="ActorLastName" 
                    SortExpression="ActorLastName" />
                <asp:BoundField DataField="ActorFirstName" HeaderText="ActorFirstName" 
                    SortExpression="ActorFirstName" />
                <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" 
                    SortExpression="UpdateDate" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:yjiConnectionString1 %>" 
            DeleteCommand="DELETE FROM [actor] WHERE [ActorID] = @ActorID" 
            InsertCommand="INSERT INTO [actor] ([ActorFirstName], [ActorLastName], [UpdateDate]) VALUES (@ActorFirstName, @ActorLastName, @UpdateDate)" 
            ProviderName="<%$ ConnectionStrings:yjiConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [ActorID], [ActorFirstName], [ActorLastName], [UpdateDate] FROM [actor]" 
            UpdateCommand="UPDATE [actor] SET [ActorFirstName] = @ActorFirstName, [ActorLastName] = @ActorLastName, [UpdateDate] = @UpdateDate WHERE [ActorID] = @ActorID">
            <DeleteParameters>
                <asp:Parameter Name="ActorID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ActorFirstName" Type="String" />
                <asp:Parameter Name="ActorLastName" Type="String" />
                <asp:Parameter Name="UpdateDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ActorFirstName" Type="String" />
                <asp:Parameter Name="ActorLastName" Type="String" />
                <asp:Parameter Name="UpdateDate" Type="DateTime" />
                <asp:Parameter Name="ActorID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="ActorID" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="ActorID" HeaderText="ActorID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ActorID" />
                <asp:BoundField DataField="ActorLastName" HeaderText="ActorLastName" 
                    SortExpression="ActorLastName" />
                <asp:BoundField DataField="ActorFirstName" HeaderText="ActorFirstName" 
                    SortExpression="ActorFirstName" />
                <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" 
                    SortExpression="UpdateDate" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:DetailsView>
</p>
</asp:Content>

