<%@ Page Title="" Language="VB" MasterPageFile="~/StoreMaster.master" AutoEventWireup="false" CodeFile="ViewCatalog.aspx.vb" Inherits="ViewCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Height="297px">
        <div style="height: 227px; background-color: #FFFFFF; background-repeat: repeat;">
            Product Type:
            <asp:DropDownList ID="ddlProductType" runat="server" AutoPostBack="True" 
                DataSourceID="sqldsProductTypes" DataTextField="ProductTypeCode" 
                DataValueField="ProductTypeCode">
            </asp:DropDownList>
            <br />
            <br />
            Topic:<asp:DropDownList ID="ddlProductTopic" runat="server" AutoPostBack="True" 
                DataSourceID="sqlProducTopic" DataTextField="TopicCode" 
                DataValueField="TopicCode">
            </asp:DropDownList>
            <br />
            <br />
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="ProductID" DataSourceID="sqldsProductTable" 
                ForeColor="#333333" GridLines="None" Height="156px" HorizontalAlign="Left" 
                Width="1071px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
                        InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" 
                        SortExpression="ProductName" />
                    <asp:BoundField DataField="TopicCode" HeaderText="TopicCode" 
                        SortExpression="TopicCode" Visible="False" />
                    <asp:BoundField DataField="ProductTypeCode" HeaderText="ProductTypeCode" 
                        SortExpression="ProductTypeCode" Visible="False" />
                    <asp:BoundField DataField="Style" HeaderText="Style" SortExpression="Style" />
                    <asp:BoundField DataField="QuantityPerUnit" HeaderText="Quantity / Unit" 
                        SortExpression="QuantityPerUnit" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="Price" 
                        SortExpression="UnitPrice" DataFormatString="{0:c}" />
                    <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" 
                        SortExpression="UnitsInStock" Visible="False" />
                    <asp:BoundField DataField="UnitsOnOrder" HeaderText="UnitsOnOrder" 
                        SortExpression="UnitsOnOrder" Visible="False" />
                    <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" 
                        SortExpression="ReorderLevel" Visible="False" />
                    <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" 
                        SortExpression="Discontinued" Visible="False" />
                    <asp:TemplateField HeaderText="Purchase">
                        <ItemTemplate>
                            <asp:Button ID="btnAddToCart" runat="server" CausesValidation="false" 
                                CommandName="AddToCart" Text="Add to Cart" CommandArgument="<%# Container.DataItemIndex %>"/>
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
            <br />
        </div>
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel2" runat="server" Height="189px">
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="sqlProducTopic" runat="server" 
                ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
                SelectCommand="SELECT DISTINCT TopicCode FROM Product WHERE (ProductTypeCode = @productType) AND (Discontinued &lt;&gt; 1)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProductType" Name="productType" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqldsProductTable" runat="server" 
                ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
                SelectCommand="SELECT ProductID, ProductName, TopicCode, ProductTypeCode, Style, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued FROM Product WHERE (Discontinued &lt;&gt; 1) AND ProductTypeCode = @productType AND TopicCode = @topicCode">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProductType" DefaultValue="" 
                        Name="productType" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlProductTopic" Name="topicCode" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqldsProductTypes" runat="server" 
                ConnectionString="<%$ ConnectionStrings:group3ConnectionString %>" 
                SelectCommand="SELECT DISTINCT ProductTypeCode FROM Product">
            </asp:SqlDataSource>
        </asp:Panel>
    </asp:Panel>
    <p>
&nbsp;</p>
</asp:Content>

