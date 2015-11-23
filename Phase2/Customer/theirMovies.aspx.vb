Imports System.Data

Partial Class Customer_theirMovies
    Inherits System.Web.UI.Page

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        'Begin of the code
        If gdvMovies.SelectedIndex = -1 Then
            lblWarning.Text = "Please select a movie"
            Exit Sub
        End If
        Dim MovieNum As Integer, customerID As String, dv As DataView

        customerID = "TestID2" 'for testing at this moment; will be changed

        MovieNum = CType(gdvMovies.SelectedRow.Cells(1).Text, Integer)
        gdvMovies.SelectedIndex = -1 'deselect


        sqldsOrder.SelectParameters("custID").DefaultValue = customerID
        dv = CType(sqldsOrder.Select(DataSourceSelectArguments.Empty), DataView)
        Dim numRecords As Integer = dv.Count
        If numRecords = 0 Then 'New order
            sqldsOrder.InsertParameters("orderDate").DefaultValue = Date.Now
            sqldsOrder.InsertParameters("custID").DefaultValue = customerID
            sqldsOrder.Insert()
            'retrieve orderID
            sqldsOrder.SelectParameters("custID").DefaultValue = customerID
            dv = CType(sqldsOrder.Select(DataSourceSelectArguments.Empty), DataView)
        End If

        Dim orderID As Integer, newQty As Integer
        newQty = CType(txtQuantity.Text, Integer)
        If txtQuantity.Text = String.Empty Then
            lblWarning.Text = "Please enter a quantity"
            Exit Sub
        End If
        'retrieve orderID
        orderID = CType(dv.Table.Rows(0)(0), Integer)

        'get an orderline
        sqldsOrderLine.SelectParameters("orderID").DefaultValue = orderID
        sqldsOrderLine.SelectParameters("movieID").DefaultValue = MovieNum
        dv = CType(sqldsOrderLine.Select(DataSourceSelectArguments.Empty), DataView)
        If dv.Count = 0 Then 'movie not ordered
            sqldsOrderLine.InsertParameters("orderID").DefaultValue = orderID
            sqldsOrderLine.InsertParameters("movieID").DefaultValue = MovieNum
            sqldsOrderLine.InsertParameters("quantity").DefaultValue = newQty
            sqldsOrderLine.Insert()
        Else 'ordered; update quantity
            Dim totalQty As Integer, orderlineID As Integer
            totalQty = CType(dv.Table.Rows(0)(0), Integer) + newQty
            orderlineID = CType(dv.Table.Rows(0)(1), Integer)
            sqldsOrderLine.UpdateParameters("quantity").DefaultValue = totalQty
            sqldsOrderLine.UpdateParameters("orderLineID").DefaultValue = orderlineID
            sqldsOrderLine.Update()
        End If

        'End of the code

    End Sub
End Class
