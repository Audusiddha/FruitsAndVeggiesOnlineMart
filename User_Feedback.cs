using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Feedback : System.Web.UI.Page
{
    string strConnectionString = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;    
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //check feedback Type
        string Feed;
        if(radioCmt.Checked==true)
        {
            Feed = radioCmt.Text;
        }
        else if(radioQue.Checked==true)
        {
            Feed = radioQue.Text;
        }
        else
        {
            Feed = radioSug.Text;
        }
        //inserting Data In feedback table
        try
        {
            SqlConnection con = new SqlConnection(strConnectionString);            

            string strcmd = "INSERT INTO Feedback " +
                     " (UID, FType, Msg, FirstName, LastName, MailID,Status,Reply,EntryDate) " +
                      "  VALUES(@UID,@FType,@Msg,@FirstName,@LastName,@MailID,@Status,@Reply,@EntryDate)";
            SqlCommand cmd = new SqlCommand(strcmd,con);
            cmd.Parameters.AddWithValue("UID", Convert.ToInt32(Session["UserID"].ToString()));
            cmd.Parameters.AddWithValue("FType", Feed.ToString());
            cmd.Parameters.AddWithValue("Msg",txtfeedback.Text);
            cmd.Parameters.AddWithValue("FirstName", txtFirstname.Text);
            cmd.Parameters.AddWithValue("LastName", txtLastnName.Text);
            cmd.Parameters.AddWithValue("MailID", txtEmail.Text);
            cmd.Parameters.AddWithValue("Status", "Under Processing");
            cmd.Parameters.AddWithValue("Reply", DBNull.Value);
            cmd.Parameters.AddWithValue("EntryDate", DateTime.Now.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Thank you for Your Feedback..!')</script>");
            clears();
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }
    //clear when Feedback entry done
    private void clears()
    {
        txtFirstname.Text = "";
        txtfeedback.Text = "";
        txtLastnName.Text = "";
        txtEmail.Text = "";
    }

    //check feedback status implementation
    protected void lnkStatus_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(strConnectionString);
            if (Session["User"] != null)
            {
             string  strCmd = "select Status,Msg,Reply from Feedback where UID='" + Session["UserID"].ToString() + "' " +
               " order by FID desc";
                DataTable Dt = new DataTable();
                Dt = SqlHelper.FillData(strCmd);
                if (Dt.Rows.Count>0)
                {
                   lblStatusShow.Text = Dt.Rows[0]["Status"].ToString();
                   lblqueshow.Text = Dt.Rows[0]["Msg"].ToString();
                    if(Dt.Rows[0]["Reply"].ToString()!="")
                    {
                        lblReply.Text = "Reply";
                        lblReplyShow.Text = Dt.Rows[0]["Reply"].ToString();
                   }                  
                   Panel1.Visible = true;
                }               
                else
                {
                    Response.Write("<script>alert('Feedback Not Available..!')</script>");
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}