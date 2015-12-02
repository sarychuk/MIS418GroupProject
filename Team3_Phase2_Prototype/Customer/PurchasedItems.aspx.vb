
Partial Class Customer_OnSale
    Inherits System.Web.UI.Page

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.Parameters("@userID").Value = CType(Membership.GetUser().ProviderUserKey, Guid)
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim grid As GridView = CType(sender, GridView)
        Dim index As Integer = CType(e.CommandArgument, Integer)
        Dim selectedGridRow As GridViewRow = grid.Rows(index)
        If e.CommandName = "GoToCourse" Then
            Customer.CurrentCourse = selectedGridRow.Cells(1).Text
            Response.Redirect("CourseContent.aspx")
        ElseIf e.CommandName = "GoToReviews" Then
            Customer.ReviewItemID = CType(selectedGridRow.Cells(0).Text, Integer)
            Customer.ReviewItemName = selectedGridRow.Cells(1).Text
            Response.Redirect("~/Customer/ViewReview.aspx")
        End If
    End Sub

    Protected Sub GridView2_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView2.RowCommand
        Dim grid As GridView = CType(sender, GridView)
        Dim index As Integer = CType(e.CommandArgument, Integer)
        Dim selectedGridRow As GridViewRow = grid.Rows(index)
        If e.CommandName = "GoToReviews" Then
            Customer.ReviewItemID = CType(selectedGridRow.Cells(0).Text, Integer)
            Customer.ReviewItemName = selectedGridRow.Cells(1).Text
            Response.Redirect("~/Customer/ViewReview.aspx")
        End If
    End Sub
End Class
