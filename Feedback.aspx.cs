using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //calculating pending replies for gridview caption
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        int records = (int)dv.Table.Rows.Count;
        if (records <= 0)
        {
            Label1.Text = "No Pending Replies Available..!";
        }
        GridView1.Caption = Convert.ToString(records) + "  Pending Replies";
    }        
    //passing Feedback ID to doreply page
    protected void btnReply_Click1(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string args = btn.CommandArgument;
        Response.Redirect("doreply.aspx?FID=" + args);
    }
}