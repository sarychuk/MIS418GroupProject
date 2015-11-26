
Partial Class Customer_OnlineCourse
    Inherits System.Web.UI.Page

    Protected Sub Label2_Load(sender As Object, e As System.EventArgs) Handles Label2.Load
        Dim label As Label = CType(sender, Label)
        label.Text = "Welcome to '" + Customer.CurrentCourse + "' course!"
    End Sub
End Class
