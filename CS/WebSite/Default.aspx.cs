using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load (object sender, EventArgs e) {
    }

    protected void ASPxTreeList1_Init (object sender, EventArgs e) {
        ASPxTreeList treeList = sender as ASPxTreeList;
        object keyValue = ASPxGridView.GetDetailRowKeyValue(treeList);
        if (keyValue.Equals(2) || keyValue.Equals(5))
            treeList.RootValue = keyValue;
    }

    protected void detailGrid_BeforePerformDataSelect (object sender, EventArgs e) {
        ASPxGridView grid = sender as ASPxGridView;
        Session["CategoryID"] = grid.GetMasterRowKeyValue();
    }

    protected void GridView1_DataBinding (object sender, EventArgs e) {
        GridView gridView = sender as GridView;
        gridView.DataSource = dsDetailView;
        dsDetailView.SelectParameters["CategoryID"].DefaultValue = ASPxGridView.GetDetailRowKeyValue(gridView).ToString();
    }
}
