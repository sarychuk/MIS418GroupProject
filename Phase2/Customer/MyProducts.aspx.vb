
Partial Class Customer_OnSale
    Inherits System.Web.UI.Page

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.Parameters("@userID").Value = CType(Membership.GetUser().ProviderUserKey, Guid)
    End Sub
End Class
