Imports Microsoft.VisualBasic
Imports System.Data

Public NotInheritable Class CartModel
    Public Shared CartItems As DataTable = New DataTable
    Public Shared Columns As DataControlFieldCollection = New DataControlFieldCollection

    Sub New()
    End Sub

    Public Shared Function GetCartItems() As DataSet
        Dim ds As DataSet = New DataSet
        ds.Tables.Add(CartItems.Copy())
        Return ds
    End Function
End Class
