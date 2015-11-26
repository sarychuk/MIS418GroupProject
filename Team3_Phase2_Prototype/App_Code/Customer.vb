Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public NotInheritable Class Customer
    Public Shared CurrentCourse As String = String.Empty

    Sub New()
    End Sub

    Public Shared Function CustomerID() As String
        Dim userID As Guid = CType(Membership.GetUser.ProviderUserKey, Guid)
        Return userID.ToString()
    End Function
End Class
