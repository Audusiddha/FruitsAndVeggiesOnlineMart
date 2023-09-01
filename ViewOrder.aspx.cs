using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        int records = (int)dv.Table.Rows.Count;
        if(records <=0)
        {
            Label1.Text = "No Pending Orders Available";
        }
        else
        {
            GridView1.Caption = Convert.ToString(records) + "  Pending Orders";
        }
    }
    //Update orders Status i.e dispatch order implementation
    protected void btnDeliver_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string args = btn.CommandArgument;
        Response.Redirect("OrderStatus.aspx?OrderID=" + args);
    }
  
}