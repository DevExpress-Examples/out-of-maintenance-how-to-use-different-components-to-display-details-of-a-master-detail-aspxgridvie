Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxTreeList
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub

	Protected Sub ASPxTreeList1_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim treeList As ASPxTreeList = TryCast(sender, ASPxTreeList)
		Dim keyValue As Object = ASPxGridView.GetDetailRowKeyValue(treeList)
		If keyValue.Equals(2) OrElse keyValue.Equals(5) Then
			treeList.RootValue = keyValue
		End If
	End Sub

	Protected Sub detailGrid_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
		Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
		Session("CategoryID") = grid.GetMasterRowKeyValue()
	End Sub

	Protected Sub GridView1_DataBinding(ByVal sender As Object, ByVal e As EventArgs)
		Dim gridView As GridView = TryCast(sender, GridView)
		gridView.DataSource = dsDetailView
		dsDetailView.SelectParameters("CategoryID").DefaultValue = ASPxGridView.GetDetailRowKeyValue(gridView).ToString()
	End Sub
End Class
