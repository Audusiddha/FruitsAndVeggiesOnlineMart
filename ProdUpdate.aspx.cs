using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ProdUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        //Displaying Product Details for updattion
        try
        {
            if (Request.QueryString["PID"] != null)
            {
                lblPID.Text = Request.QueryString["PID"].ToString();
                string strcmd = "SELECT  PImage,EntryDate, PName, PDetail, PUnit, "+
                         " PPrice, PQty FROM ProductMst where PID='"+ lblPID.Text.ToString() +"'";
                DataTable dt = new DataTable();
                dt = SqlHelper.FillData(strcmd);
                if (dt.Rows.Count > 0)
                {
                    ProdImage.ImageUrl = dt.Rows[0]["PImage"].ToString();
                    regDate.Text = dt.Rows[0]["EntryDate"].ToString();
                    pName.Text = dt.Rows[0]["PName"].ToString();
                    pDes.Text = dt.Rows[0]["PDetail"].ToString();
                    pUnit.Text = dt.Rows[0]["PUnit"].ToString();
                   pPrice.Text = dt.Rows[0]["PPrice"].ToString();
                    pQty.Text = dt.Rows[0]["PQty"].ToString();
                }
                }
            else
            {
                Response.Redirect("ProductDetails.aspx");
            }
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }

    private void clears()
    {
        txtPrice.Text = "";
        txtQty.Text = "";
    }
    //Update Price And Quantity Of Products
    protected void btnPUpdate_Click(object sender, EventArgs e)
    {
        int oldQty = Convert.ToInt32(pQty.Text);
        int newQty = Convert.ToInt32(txtQty.Text);
        int totalQty = oldQty + newQty;
        try
        {
            string strcmd = "UPDATE    ProductMst SET PPrice = '"+ txtPrice.Text +"', "+
                           " PQty = '"+ totalQty +"' where PID = '"+ Convert.ToInt32(lblPID.Text) +"'";
            SqlHelper.ExecuteNonQuery(strcmd);
            clears();
            Response.Redirect("ProductDetails.aspx");
        }
        catch(Exception ex)
        {
            throw ex;
        }    
    }
}