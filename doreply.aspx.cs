using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_doreply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           //Displaying User Feedback for admin Reply
            if (Request.QueryString["FID"] != null)
            {
                lblFid.Text = Request.QueryString["FID"].ToString();
                HiddenField1.Value = lblFid.Text;
                string strcmd = "SELECT    FType, EntryDate, FirstName,LastName, MailID, Status,Msg " +
                                       " FROM Feedback " +
                                       " WHERE(FID = '" + HiddenField1.Value + "') " +
                                       " ORDER BY FID DESC";
                DataTable dt = new DataTable();
                dt = SqlHelper.FillData(strcmd);
                if (dt.Rows.Count > 0)
                {
                    lblFid.Text = HiddenField1.Value.ToString();
                    lblFType.Text = dt.Rows[0]["FType"].ToString();
                    lbldate.Text = dt.Rows[0]["EntryDate"].ToString();
                    lbluserName.Text = dt.Rows[0]["FirstName"].ToString();
                    lbluserName.Text +="   "+ dt.Rows[0]["LastName"].ToString();
                    lblEmailID.Text = dt.Rows[0]["MailID"].ToString();
                    lblStatus.Text = dt.Rows[0]["Status"].ToString();
                    lblMsg.Text = dt.Rows[0]["Msg"].ToString();
                }
            }
            else
            {
                Response.Redirect("Feedback.aspx");
            }
        }
        catch(Exception ex)
        {
            throw ex;
        }
        }
    //Admin Reply to user implementation
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {          
            string     strcmd = "update Feedback set Status ='Processed' ," +
                            " Reply='" + txtReply.Text + "' where FID='" + Convert.ToInt32(lblFid.Text) + "'";
                 SqlHelper.ExecuteNonQuery(strcmd);
                Response.Write("<script>alert('Reply has Been Processed Properly..!')</script>");
               Response.Redirect("Feedback.aspx");
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }
}