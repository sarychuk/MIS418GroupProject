
Partial Class Customer_ShoppingCart
    Inherits System.Web.UI.Page

    Protected Sub btnBuyItems_Click(sender As Object, e As System.EventArgs) Handles btnBuyItems.Click
        Response.Redirect("PaymentPage.aspx")
    End Sub

    Protected Sub gvShoppingCart_Load(sender As Object, e As System.EventArgs) Handles gvShoppingCart.Load
        If gvShoppingCart.Rows.Count = 0 Then
            btnBuyItems.Visible = False
        Else
            btnBuyItems.Visible = True
        End If
    End Sub
End Class
