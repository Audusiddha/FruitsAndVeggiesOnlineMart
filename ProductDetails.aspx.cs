using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_ProductDetails : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Update product details
        if(e.CommandName=="Ed")
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string strPid = GridView1.Rows[index].Cells[0].Text;                
                Response.Redirect("ProdUpdate.aspx?PID=" + strPid);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        //Delete existed product
        if (e.CommandName == "Del")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string strPid = GridView1.Rows[index].Cells[0].Text;
            try
            {             
                string strcmd = "delete from ProductMst where PID='"+ strPid.ToString() +"'";
                SqlHelper.ExecuteNonQuery(strcmd);
                GridView1.DataBind();
                Response.Write("<script>alert('Product Deleted SuccessFully..!')</script>");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        }

    //Search Product Implementation
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string strcmd = "select *from ProductMst where PName like '" + txtSearch.Text + "' +'%'";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = null;
                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('No Results Found..!')</script>");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    //view all products
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        GridView1.DataSource = null;
        GridView1.DataSourceID = null;
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
    }
    //for showing total product entries in table caption
    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        int z = e.AffectedRows;
        GridView1.Caption = "Total Entries  " + z.ToString();
    }

}