using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["userid"] != null)
                txtUserName.Text = Request.Cookies["userid"].Value;
            if (Request.Cookies["pwd"] != null)
                txtPassword.Attributes.Add("value", Request.Cookies["pwd"].Value);
            if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
                chkRemember.Checked = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "select *from AdminMst where UserName='" + txtUserName.Text + "' AND [Password]='" + txtPassword.Text + "'";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                //add key values to cookies
                if (chkRemember.Checked == true)
                {
                    Response.Cookies["userid"].Value = txtUserName.Text;
                    Response.Cookies["pwd"].Value = txtPassword.Text;
                    Response.Cookies["userid"].Expires = DateTime.Now.AddDays(7);
                    Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(7);
                }
                // remove key values from cookies
                else
                {
                    Response.Cookies["userid"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);
                }
                Session["UserName"] = dt.Rows[0].ToString();
                Response.Redirect("~/Admin/Default.aspx");
            }

            else
            {
                Label1.Text = "Enter valid Credentials...!";

            }

        }

        catch (Exception ex)
        {
            throw ex;
        }
    }
}