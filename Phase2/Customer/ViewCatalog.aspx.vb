Imports System.Data

Partial Class ViewCatalog
    Inherits System.Web.UI.Page

    Protected Sub gvProducts_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvProducts.RowCommand
        If e.CommandName = "AddToCart" Then
            Dim linkButton As Button = CType(e.CommandSource, Button)
            Dim index As Integer = CType(e.CommandArgument, Integer)
            Dim selectedGridRow As GridViewRow = gvProducts.Rows(index)
            CartModel.Product.Add(CType(selectedGridRow.Cells(1).Text, Integer))
        End If
    End Sub
End Class
