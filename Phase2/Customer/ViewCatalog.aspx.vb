Imports System.Data

Partial Class ViewCatalog
    Inherits System.Web.UI.Page

    Protected Sub gvProducts_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvProducts.RowCommand
        If e.CommandName = "AddToCart" Then

            Dim index As Integer = CType(e.CommandArgument, Integer)
            Dim selectedGridRow As GridViewRow = gvProducts.Rows(index)
            Dim dt As DataTable = New DataTable()
            Dim count As Integer = gvProducts.Columns.Count

            If CartModel.Columns.Count = 0 Then
                CartModel.Columns = gvProducts.Columns
            End If

            If CartModel.CartItems.Rows.Count = 0 Then
                For i As Integer = 0 To count - 1
                    If Not gvProducts.Columns(i).Visible Or gvProducts.Columns(i).HeaderText = "Purchase" Then
                        Continue For
                    End If
                    Dim dtc As DataColumn = New DataColumn()
                    dtc.ColumnName = gvProducts.Columns(i).HeaderText
                    dt.Columns.Add(dtc)
                Next
                CartModel.CartItems = dt
            Else
                dt = CartModel.CartItems
            End If
            
            Dim dr As DataRow = dt.NewRow()
            For j As Integer = 0 To count - 1
                If Not gvProducts.Columns(j).Visible Or gvProducts.Columns(j).HeaderText = "Purchase" Then
                    Continue For
                End If
                dr(gvProducts.Columns(j).HeaderText) = selectedGridRow.Cells(j).Text
            Next
            CartModel.CartItems.Rows.Add(dr)
        End If

        
    End Sub
    'Response.Redirect("~/ShoppingCart.aspx")
    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "popup", "alert('You are redirecting...');window.location='~/ShoppingCart.aspx';", True)
End Class
