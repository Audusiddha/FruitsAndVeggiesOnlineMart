using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_ViewProduct : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {    //showing selected product details
            if (Request.QueryString["prodcutid"] != null)
            {
                lblPID.Text = Request.QueryString["prodcutid"].ToString();
                string strcmd = "select *from ProductMst where PID='"+ lblPID.Text.ToString() +"'";
                DataTable dt = new DataTable();
                dt = SqlHelper.FillData(strcmd);
                if (dt!=null)
                {
                    ProdImage.ImageUrl = dt.Rows[0]["PImage"].ToString();
                    pName.Text = dt.Rows[0]["PName"].ToString();
                    pPrice.Text = dt.Rows[0]["PPrice"].ToString();                   
                    pDes.Text = dt.Rows[0]["PDetail"].ToString();
                    pUnit.Text = dt.Rows[0]["PUnit"].ToString();
                }               
            }
            else
            {
                Response.Redirect("Products.aspx");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}
