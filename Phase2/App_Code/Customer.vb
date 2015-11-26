Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class Customer
    Public Shared Function CustomerID() As String
        Dim userID As Guid = CType(Membership.GetUser.ProviderUserKey, Guid)
        Return userID.ToString()
    End Function
End Class
