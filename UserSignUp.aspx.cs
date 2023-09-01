using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class User_UserSignUp : System.Web.UI.Page
{
    String gen;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnNextPersonal_Click(object sender, EventArgs e)
    {        
        MultiviewUserSignup.ActiveViewIndex = 1;

    }

    protected void btnBackcontact_Click(object sender, EventArgs e)
    {
        MultiviewUserSignup.ActiveViewIndex = 0;
    }

    protected void btnNextContact_Click(object sender, EventArgs e)
    {
        MultiviewUserSignup.ActiveViewIndex = 2;
    }

    protected void btnBackAccount_Click(object sender, EventArgs e)
    {
        MultiviewUserSignup.ActiveViewIndex = 1;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (radiobtnMale.Checked == true)
        {
            gen = radiobtnMale.Text;
        }
        else
        {
            gen = radioBtnFemale.Text;
        }
       
        try
        {
            //to check UserName Exist Or Not
            string strCmd = "SELECT    UID "+
                                " FROM UserMst "+
                                " WHERE (UserName = '"+ txtEmail.Text +"')";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strCmd);
            if(dt.Rows.Count>0)
            {
                Response.Write("<script>alert('UserName Already Exist...!')</script>");
            }
            else
            {              
                //create User
                strCmd = "INSERT INTO UserMst " +
                     " (FirstName, LastName, Gender, Address, City, Pincode, ContactNo, DOB, " +
                     " SecQue, SecAns, UserName, Password, RegDate) " +
                     " VALUES(";
                strCmd +="'" + txtFirstName.Text +"',";
                strCmd += "'" + txtLastName.Text + "',";
                strCmd += "'" + gen.ToString() + "',";
                strCmd += "'" + txtAddress.Text + "',";
                strCmd += "'" + txtCity.Text + "',";
                strCmd += "'" + txtPincode.Text + "',";
                strCmd += "'" + txtMobileNo.Text.ToString() + "',"; 
                strCmd += "'" + txtDOB.Text + "',";
                strCmd += "'" + ddlSecurity.Text + "',";
                strCmd += "'" + txtSecAns.Text + "',";
                strCmd += "'" + txtEmail.Text + "',";
                strCmd += "'" + txtPassword.Text + "',";
                strCmd += "'" + DateTime.Now.ToShortDateString() + "')";
                SqlHelper.ExecuteNonQuery(strCmd);
                MultiviewUserSignup.ActiveViewIndex = 3;
            }
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }
}