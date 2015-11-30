Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public NotInheritable Class Customer
    Public Shared CurrentCourse As String = String.Empty
    Public Shared ReviewItems As DataTable = New DataTable

    Sub New()
    End Sub

    Public Shared Function CustomerID() As String
        Dim userID As Guid = CType(Membership.GetUser.ProviderUserKey, Guid)
        Return userID.ToString()
    End Function

    Public Shared Function GetCartItems() As DataSet
        Dim ds As DataSet = New DataSet
        ds.Tables.Add(ReviewItems.Copy())
        Return ds
    End Function
End Class
