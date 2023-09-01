using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable Dt = new DataTable();
        Dt = (DataTable)Session["buyitems"];
        if (Dt != null)
        {
            Label1.Text = Dt.Rows.Count.ToString();
        }
        else
        {
            Label1.Text = "No";
        }
    }

    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        //Implementing search Products
        try
        {
            string strcmd = "select *from ProductMst where PName like '" + txtSearch.Text + "' +'%'";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                DataList1.DataSourceID = null;
                DataList1.DataSource = dt;
                DataList1.DataBind();
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
    protected void lnkBtnViewAll_Click(object sender, EventArgs e)
    {
        DataList1.DataSourceID = null;
        DataList1.DataSource = SqlDataSource1;
        DataList1.DataBind();
    }



    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {       
        if(e.CommandName == "addtocart")
        {
            DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
            Response.Redirect("Cart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + dlist.SelectedItem.Text.ToString());
        }
        if (e.CommandName == "view")
        {
            Response.Redirect("ViewProduct.aspx?prodcutid=" + e.CommandArgument.ToString());
        }       
    }
}