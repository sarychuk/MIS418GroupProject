
Partial Class Customer_ShoppingCart
    Inherits System.Web.UI.Page

    Protected Sub btnBuyItems_Click(sender As Object, e As System.EventArgs) Handles btnBuyItems.Click
        Response.Redirect("PaymentPage.aspx")
    End Sub

    Protected Sub gvShoppingCart_Load(sender As Object, e As System.EventArgs) Handles gvShoppingCart.Load
        Dim grid As GridView = CType(sender, GridView)

        If gvShoppingCart.Rows.Count = 0 Then
            btnBuyItems.Enabled = False
            txtSubtotal.Enabled = False
            txtSubtotal.Text = ""
        Else
            btnBuyItems.Enabled = True
            txtSubtotal.Enabled = True
            Dim total As Double = 0
            For j As Integer = 0 To grid.Rows.Count - 1
                Dim price As String = grid.Rows(j).Cells(grid.Rows(j).Cells.Count - 2).Text
                If price.Length = 0 Then
                    total += 0
                Else
                    Dim convertPrice = CType(price, Double)
                    total += convertPrice
                End If
            Next
            txtSubtotal.Text = "$" + total.ToString()
        End If
    End Sub

    Protected Sub gvShoppingCart_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        Dim grid As GridView = CType(sender, GridView)
        Dim total As Double = 0
        For j As Integer = 0 To grid.Rows.Count - 1
            Dim price As String = grid.Rows(j).Cells(grid.Rows(j).Cells.Count - 2).Text
            If price.Length = 0 Then
                total += 0
            Else
                Dim convertPrice = CType(price, Double)
                total += convertPrice
            End If
        Next
        txtSubtotal.Text = "$" + total.ToString()
    End Sub

    Protected Sub gvShoppingCart_RowDeleted(sender As Object, e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles gvShoppingCart.RowDeleted
        Dim grid As GridView = CType(sender, GridView)
        Dim test As Object = e.Values(3)
        Dim total As Double = 0
        For j As Integer = 0 To grid.Rows.Count - 1
            Dim price As String = grid.Rows(j).Cells(grid.Rows(j).Cells.Count - 2).Text
            If price.Length = 0 Then
                total += 0
            Else
                Dim convertPrice = CType(price, Double)
                total += convertPrice
            End If
        Next
        total -= CType(e.Values(3), Double)
        txtSubtotal.Text = "$" + total.ToString()
    End Sub
End Class