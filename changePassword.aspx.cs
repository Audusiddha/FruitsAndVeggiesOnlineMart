using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_changePassword : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //verify UserName
    protected void btnVerify_Click1(object sender, EventArgs e)
    {
        try
        {
            String strcmd = "SELECT    UserName "+
                               " FROM AdminMst "+
                               " WHERE(UserName = '"+ txtUsername.Text +"')";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                hdfUsr.Value = txtUsername.Text;
                MultiView1.ActiveViewIndex = 1;                
            }
            else
            {
                //UserName does not Exist                
                MsgBox("Enter Valid UserName...!");
                txtUsername.Text = "";
            }
        }
        catch(Exception ex)
        {
            throw ex;
        }        
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            //to check old Password
            string strcmd = "select Password from AdminMst where "+
                            " UserName='"+ hdfUsr.Value.ToString() +"'";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows[0]["Password"].ToString() == txtOldPass.Text)
            {
                strcmd = "update AdminMst set Password='"+ txtNewPass.Text +"'"+
                         " where UserName='"+ hdfUsr.Value.ToString() +"'";
                SqlHelper.ExecuteNonQuery(strcmd);
                MsgBox("Password Updated SuccessFully..!");
                Response.Cookies["pwd"].Value = txtNewPass.Text;        
                clears();
            }
            else
            {
                MsgBox("Enter Valid Old Password..!");
            }
        }
        catch(Exception ex)
        {
            throw ex;
        }
        }
    private void clears()
    {
        txtOldPass.Text = "";
        txtNewPass.Text = "";
        txtRetypePass.Text = "";
    }
    private void MsgBox(string msg)
    {
        Response.Write("<script>alert('"+msg+"')</script>");
    }
}