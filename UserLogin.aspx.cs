using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_usrlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //Redirecting to home page when entered details are valid.
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "SELECT    UserName, Password,UID " +
                                   " FROM UserMst " +
                                   " WHERE(UserName = '" + txtuserName.Text + "') AND (Password = '" + txtPassword.Text + "')";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                Session["User"] = txtuserName.Text;
                Session["UserID"] = dt.Rows[0]["UID"].ToString();
                Response.Redirect("~/User/HomePage.aspx");
            }

            else
            {
                Response.Write("<script>alert('Inavlid UserName Or Password..!')</script>");

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}