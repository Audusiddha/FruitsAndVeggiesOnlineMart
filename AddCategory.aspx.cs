using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {    
             
    } 
    //Add new category implementation
    protected void btnAddCategory_Click1(object sender, EventArgs e)
    {
        try
        {
            String strcmd = "select CName from CategoryMst where (CName='" + txtCategory.Text + "')";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                //Category Already Exist
                Response.Write("<script>alert('Entered Category Already Exist..!')</script>");
                clears();
            }
            //insert New Category
            else
            {
                strcmd = "INSERT INTO CategoryMst(CName) " +
                                " VALUES( '" + txtCategory.Text + "' )";
                SqlHelper.ExecuteNonQuery(strcmd);
                GridView1.DataBind();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    private void clears()
    {
        txtCategory.Text = "";
    }

    //Update  Existed Category
    protected void btnUpdateCategory_Click1(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "update CategoryMst set CName='" + txtCategory.Text + "' where CID=" + hdfCID.Value + "";
            SqlHelper.ExecuteNonQuery(strcmd);
            btnAddCategory.Enabled = true;
            clears();
            GridView1.DataBind();
            Response.Write("<script>alert('Category Updataed SuccessFully..!')</script>");
            btnUpdateCategory.Enabled = false;
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }

    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Ed")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            hdfCID.Value = GridView1.Rows[index].Cells[0].Text;
            txtCategory.Text = GridView1.Rows[index].Cells[1].Text;
            btnAddCategory.Enabled = false;
            btnUpdateCategory.Enabled = true;
        }
        //delete Category
        if (e.CommandName == "Del")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string strcid = GridView1.Rows[index].Cells[0].Text;
            try
            {            
                string strcmd = "delete from CategoryMst where CID='"+ strcid.ToString() +"'";
                SqlHelper.ExecuteNonQuery(strcmd);
                clears();
                GridView1.DataBind();
                Response.Write("<script>alert('Category Deleted SuccessFully..!')</script>");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

