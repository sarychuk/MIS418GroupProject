Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public NotInheritable Class Customer
    Public Shared CurrentCourse As String = String.Empty
    Public Shared ReviewItemID As Integer = -1
    Public Shared ReviewItemName As String = "No product reviews to show"

    Sub New()
    End Sub

    Public Shared Function CustomerID() As String
        Dim userID As Guid = CType(Membership.GetUser.ProviderUserKey, Guid)
        Return userID.ToString()
    End Function
End Class
