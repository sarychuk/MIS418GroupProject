Imports System.Data
Partial Class Customer_Cart
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        sqldsCart.SelectParameters("orderID").DefaultValue = 17
    End Sub

    Protected Sub gdvCart_DataBound(sender As Object, e As System.EventArgs) Handles gdvCart.DataBound
        Dim dv As DataView, Qty As Integer, Price As Decimal
        Dim rowI As Integer, Total As Decimal = 0, orderTotal As Single = 0
        dv = CType(sqldsCart.Select(DataSourceSelectArguments.Empty), DataView)
        'Both table's row and column starts at 0
        For rowI = 0 To dv.Count - 1
            Price = CType(dv.Table.Rows(rowI)(3), Decimal)
            Qty = CType(dv.Table.Rows(rowI)(2), Integer)
            Total = Total + Price * Qty
        Next
        lblTotal.Text = Format(Total, "Currency")
    End Sub
End Class
