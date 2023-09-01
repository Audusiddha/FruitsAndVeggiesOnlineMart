using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class User_ForgotPassword : System.Web.UI.Page
{
    string strConnectionString = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnVerify_Click(object sender, EventArgs e)
    {
        try
        {
            String strcmd = "SELECT   SecQue,UserName " +
                               " FROM UserMst " +
                               " WHERE(UserName = '" + txtUsrname.Text + "')";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                lblSecQue.Text = dt.Rows[0]["SecQue"].ToString();
                HiddenField1.Value = txtUsrname.Text;
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                //UserName does not Exist                
                MsgBox("Enter Valid UserName...!");
                txtUsrname.Text = "";
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void MsgBox(string msg)
    {
        Response.Write("<script>alert('" + msg + "')</script>");
    }
    private void clears()
    {
        txtNewPass.Text = "";
        txtRetypePass.Text = "";
        HiddenField1.Value = "";
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        try
        {
            // to check security answer
            string strcmd = "select SecAns from UserMst where "+
                       " UserName='"+ HiddenField1.Value +"' and SecAns='"+ txtSecAns.Text +"'";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {                
                MultiView1.ActiveViewIndex = 2;
            }
            else
            {
                MsgBox("Invalid Security Answer...!");
            }

        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "update UserMst set Password='"+ txtNewPass.Text +"' "+
                            " where UserName='"+ HiddenField1.Value +"'";
            SqlConnection con = new SqlConnection(strConnectionString);
            SqlCommand cmd = new SqlCommand(strcmd, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
           // MsgBox("Password Updated SuccessFully..!");
            clears();
            Response.Redirect("~/User/UserLogin.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}