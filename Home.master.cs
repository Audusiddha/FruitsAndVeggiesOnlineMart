using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Home : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //preventing master page access
        if (string.IsNullOrEmpty(Session["UserName"] as string))
        {
            Response.Redirect("~/Admin/Login.aspx");
        }

    }
    
    protected void lnkBtnLogout_Click(object sender, EventArgs e)
    {
        Session["UserName"] = "";
        Response.Redirect("~/Admin/Login.aspx");
    }
}
