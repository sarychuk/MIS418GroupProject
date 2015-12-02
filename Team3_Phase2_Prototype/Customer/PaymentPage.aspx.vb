
Imports System.Data.SqlClient
Imports System.Data

Partial Class Customer_PaymentPage
    Inherits System.Web.UI.Page

    Protected Sub btnCheckout_Click(sender As Object, e As System.EventArgs) Handles btnCheckout.Click
        Dim count As Integer = CartModel.CartItems.Rows.Count
        Dim rows As DataRowCollection = CartModel.CartItems.Rows
        Dim con As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("group3ConnectionString").ConnectionString)
        con.Open()
        For j As Integer = 0 To count - 1
            Dim cmdOrder As SqlCommand = New SqlCommand("insert_order", con)
            cmdOrder.CommandType = Data.CommandType.StoredProcedure
            cmdOrder.Parameters.Add("@ProductID", SqlDbType.Int)
            cmdOrder.Parameters.Add("@UserID", SqlDbType.UniqueIdentifier)
            cmdOrder.Parameters("@ProductID").Value = Convert.ToInt32(rows(j).Item(0))
            cmdOrder.Parameters("@UserID").Value = CType(Membership.GetUser().ProviderUserKey, Guid)
            cmdOrder.ExecuteNonQuery()
        Next
        con.Close()
        CartModel.CartItems.Clear()

        Response.Redirect("~/Customer/PurchasedItems.aspx")
    End Sub
End Class
