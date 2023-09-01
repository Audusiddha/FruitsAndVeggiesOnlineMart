using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        diplayUserFullName();
    }  
    //for displaying welcome msg on home page
    private void diplayUserFullName()
    {
        if(Session["User"]!=null)
        {
            try
            {
                string strcmd = "select FirstName,LastName from UserMst where UserName='"+ Session["User"].ToString() +"'";
                DataTable dt = new DataTable();
                dt = SqlHelper.FillData(strcmd);
                if(dt.Rows.Count>0)
                {
                    lblFullName.Text = dt.Rows[0]["FirstName"].ToString();
                    lblFullName.Text +="    "+ dt.Rows[0]["LastName"].ToString();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}