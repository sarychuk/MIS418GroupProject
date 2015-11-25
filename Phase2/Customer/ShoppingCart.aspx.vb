
Partial Class Customer_ShoppingCart
    Inherits System.Web.UI.Page

    Protected Sub GridView1_DataBound(sender As Object, e As System.EventArgs) Handles gvShoppingCart.DataBound
        'For Each column As DataControlField In gvShoppingCart.Columns
        '    For Each columVisible As DataControlField In CartModel.Columns
        '        If column.HeaderText = columVisible.HeaderText Then
        '            column.Visible = columVisible.Visible
        '        End If
        '    Next
        'Next
    End Sub
End Class
