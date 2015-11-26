Imports System.Data.Sql

Partial Class Customer_MyAccount
    Inherits System.Web.UI.Page

    Protected Sub sqldsMyAccount_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsMyAccount.Selecting
        e.Command.Parameters("@UserID").Value = CType(Membership.GetUser().ProviderUserKey, Guid)
    End Sub

End Class
