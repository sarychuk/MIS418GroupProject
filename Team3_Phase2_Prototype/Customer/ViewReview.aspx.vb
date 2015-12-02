
Partial Class Customer_ViewReview
    Inherits System.Web.UI.Page

    Protected Sub sqldsReviewItem_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsReviewItem.Selecting
        e.Command.Parameters("@productID").Value = Customer.ReviewItemID
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As System.EventArgs) Handles btnSubmit.Click
        If txtReview.Text.Length > 50 Then
            sqldsReviewItem.Insert()
            lblSbmitMessage.Visible = True
            lblSbmitMessage.Text = "The review was submitted."
            txtReview.Text = ""
        Else
            lblSbmitMessage.Visible = True
            lblSbmitMessage.Text = "The review cannot be shorter than 50 characters. Please try again."
        End If
    End Sub

    Protected Sub sqldsReviewItem_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsReviewItem.Inserting
        e.Command.Parameters("@ProductID").Value = Customer.ReviewItemID
        e.Command.Parameters("@ReviewStar").Value = rblRatings.SelectedValue
        e.Command.Parameters("@ReviewText").Value = txtReview.Text
        e.Command.Parameters("@ReviewedBy").Value = CType(Membership.GetUser().ProviderUserKey, Guid)
    End Sub

    Protected Sub lblProductName_Load(sender As Object, e As System.EventArgs) Handles lblProductName.Load
        lblProductName.Text = Customer.ReviewItemName
    End Sub
End Class
