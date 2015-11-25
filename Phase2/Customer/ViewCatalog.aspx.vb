
Partial Class ViewCatalog
    Inherits System.Web.UI.Page

    Protected Sub gvProducts_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvProducts.RowCommand
        If e.CommandName = "AddToCart" Then
            Response.Redirect("PaymentPage.aspx")
        End If
    End Sub
End Class
