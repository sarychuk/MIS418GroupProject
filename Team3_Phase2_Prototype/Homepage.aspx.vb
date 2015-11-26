
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub lblWelcome_Load(sender As Object, e As System.EventArgs) Handles lblWelcome.Load
        Try
            Dim visible As Boolean = Not Membership.GetUser().IsOnline
            lblRegister.Visible = visible
            hlinkRegister.Visible = visible
        Catch ex As Exception
            lblRegister.Visible = True
            hlinkRegister.Visible = True
        End Try
    End Sub
End Class
