using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //preventing master page access
        if (string.IsNullOrEmpty(Session["User"] as string))
        {
            Response.Redirect("~/User/UserLogin.aspx");
        }

    }
    //when user click Logout Button
    protected void lnkbtnLogout_Click(object sender, EventArgs e)
    {
        Session["User"] = "";
        Session["UserID"] = "";
        Response.Redirect("~/User/UserLogin.aspx");
        Session.RemoveAll();
    }
}
