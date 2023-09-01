using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Profile : System.Web.UI.Page
{
    string strConnectionString = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"]!=null)
        {
            try
            {
                //Show Profile
                string strcmd = "select *from UserMst where UserName='"+Session["User"].ToString() +"'";
                DataTable dt = new DataTable();
                dt = SqlHelper.FillData(strcmd);
                if (dt.Rows.Count > 0)
                {
                    lblFirstName.Text = dt.Rows[0]["FirstName"].ToString();
                    lblLastName.Text = dt.Rows[0]["LastName"].ToString();
                    lblemail.Text = dt.Rows[0]["UserName"].ToString();
                    lblDOB.Text = dt.Rows[0]["DOB"].ToString();
                    lblAddress.Text = dt.Rows[0]["Address"].ToString();
                    lblCity.Text = dt.Rows[0]["City"].ToString();
                    lblContact.Text = dt.Rows[0]["ContactNo"].ToString();
                }                          
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }        
    }
     private void clears()
    {
        txtPass.Text = "";
        txtNewPass.Text = "";
        txtConfirmPass.Text = "";
        txtAddress.Text = "";
        txtContact.Text = "";
        txtCity.Text = "";
    }

    protected void btnUpdate_Click1(object sender, EventArgs e)
    {
        try
        {
            if(Session["User"] != null)
            { 
            //to check old Password
            string strcmd = "select Password from UserMst where "+
                            " UserName='"+ Session["User"].ToString() + "'";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (txtPass.Text == dt.Rows[0]["Password"].ToString())
            {
                 SqlConnection con = new SqlConnection(strConnectionString);
                   strcmd = "update UserMst set Password='"+ txtNewPass.Text +"'"+
                         " where UserName='"+ Session["User"].ToString() + "'";
                 SqlHelper.ExecuteNonQuery(strcmd);                   
                Response.Write("<script>alert('Password Updated Successfully..!')</script>");     
                clears();
            }
            else
            {
                    Response.Write("<script>alert('Invalid Old Password..!')</script>");
                    clears();
                }
        }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnsave_Click1(object sender, EventArgs e)
    {
        try
        {
            if (Session["User"] != null)
            {
                //for update Details
                string strcmd = " UPDATE    UserMst " +
                               " SET Address = '" + txtAddress.Text + "', City = '" + txtCity.Text + "', " +
                               " ContactNo = '" + txtContact.Text + "' " +
                               " WHERE(UserName = '" + Session["User"].ToString() + "')";
                SqlHelper.ExecuteNonQuery(strcmd);               
                Response.Write("<script>alert('Profile Updated Successfully..!')</script>");
                clears();
            }           
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}