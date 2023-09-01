using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewAllFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        int records = (int)dv.Table.Rows.Count;
        if (records <= 0)
        {
            Label1.Text = "No Feedbacks Available..!"; 
        }
        GridView1.Caption = "Total Feebacks:"+Convert.ToString(records);
    }
}