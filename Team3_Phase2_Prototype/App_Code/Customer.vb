Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public NotInheritable Class Customer
    Public Shared CurrentCourse As String = String.Empty
    Public Shared ReviewItem As Integer = -1

    Sub New()
    End Sub

    Public Shared Function CustomerID() As String
        Dim userID As Guid = CType(Membership.GetUser.ProviderUserKey, Guid)
        Return userID.ToString()
    End Function
End Class
