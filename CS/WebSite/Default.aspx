<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"
    EnableEventValidation="false" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to use different components to display details within a master ASPxGridView
    </title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="masterGrid" runat="server" AutoGenerateColumns="False" DataSourceID="dsMainGrid"
            Width="700px" KeyFieldName="CategoryID">
            <Templates>
                <DetailRow>
                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%">
                        <TabPages>
                            <dx:TabPage>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl1" runat="server">
                                        <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="dsTreeList"
                                            KeyFieldName="EmployeeID" OnInit="ASPxTreeList1_Init" ParentFieldName="ReportsTo"
                                            Width="100%">
                                            <Columns>
                                                <dx:TreeListTextColumn FieldName="FirstName" VisibleIndex="0">
                                                </dx:TreeListTextColumn>
                                                <dx:TreeListTextColumn FieldName="LastName" VisibleIndex="0">
                                                </dx:TreeListTextColumn>
                                                <dx:TreeListTextColumn FieldName="Title" VisibleIndex="0">
                                                </dx:TreeListTextColumn>
                                            </Columns>
                                        </dx:ASPxTreeList>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl3" runat="server">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
                                            Style="margin-right: 0px" OnDataBinding="GridView1_DataBinding">
                                            <Columns>
                                                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                                                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                                                <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" SortExpression="UnitsInStock" />
                                                <asp:BoundField DataField="UnitsOnOrder" HeaderText="UnitsOnOrder" SortExpression="UnitsOnOrder" />
                                            </Columns>
                                        </asp:GridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl2" runat="server">
                                        <dx:ASPxGridView ID="detailGrid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDetail"
                                            KeyFieldName="ProductID" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect"
                                            Width="100%">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                </DetailRow>
            </Templates>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsDetail ShowDetailRow="True" />
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="dsMainGrid" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="dsTreeList" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [ReportsTo] FROM [Employees]">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="dsDetail" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit] FROM [Products] WHERE ([CategoryID] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="CategoryID" SessionField="CategoryID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="dsDetailView" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [CategoryID] FROM [Products] WHERE ([CategoryID] = ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="ParentID" Name="CategoryID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
