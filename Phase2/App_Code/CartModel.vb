Imports Microsoft.VisualBasic
Imports System.Data

Public NotInheritable Class CartModel
    Public Shared Product As List(Of Integer) = New List(Of Integer)
    Sub New()
    End Sub

    Public Shared Function GetCartItems() As List(Of Integer)
        Return Product
    End Function
End Class
