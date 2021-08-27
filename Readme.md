<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128543547/11.1.8%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E3604)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to use different components to display details of a master-detail ASPxGridView 
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e3604/)**
<!-- run online end -->


<p>In master-detail scenarios, when ASPxGridView is used as a master grid that displays details within its detail rows, you can visualize detail data using any desired control. The main task in these scenarios is to identify a master row when a control that displays the details should be bound to its data.</p><p>The simplest way to visualize detail data is to use ASPxGridView, because this control has the GetMasterRowKeyValue method that automatically obtains the corresponding master row's key value from a master ASPxGridView.</p><p>For other cases (when a detail control is not ASPxGridView), you can bring a detail control in correlation with its master row by using a specifically implemented static method - ASPxGridView.GetDetailRowKeyValue. This method accepts a detail control instance as a parameter and returns the corresponding master row's key value:</p><p><a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_GetDetailRowKeyValuetopic"><u>ASPxGridView.GetDetailRowKeyValue(detailControl)</u></a></p><p>This example demonstrates how to use the GetMasterRowKeyValue and ASPxGridView.GetDetailRowKeyValue methods.</p>

```cs
object keyValue = ASPxGridView.GetDetailRowKeyValue(treeList); 
```



```vb
Dim keyValue As Object = ASPxGridView.GetDetailRowKeyValue(treeList)
```

<p> </p><p><strong>See also:</strong><strong><br />
</strong><a href="https://www.devexpress.com/Support/Center/p/E87">Load detail data dynamically (self-referenced dataset example)</a><strong><br />
</strong><a href="https://www.devexpress.com/Support/Center/p/E3538">Master-Detail ASPxGridView - How to show detail data in ASPxTreeList</a><br />
<a href="https://www.devexpress.com/Support/Center/p/E529">How to use the FormView component to display details of a master-detail ASPxGridView</a><br />
<a href="https://www.devexpress.com/Support/Center/p/E3608">How to use different components to display related data of a master-detail ASPxGridView </a></p>

<br/>


