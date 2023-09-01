using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_OrderStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //to show All Details User,Product and order
        try
        {
            if (Request.QueryString["OrderID"] != null)
            {
                string strcmd = "SELECT    UserMst.FirstName, UserMst.LastName, UserMst.Gender, UserMst.Address, UserMst.City, UserMst.ContactNo,"+
                   " ProductMst.PID, ProductMst.PName, ProductMst.PDetail, ProductMst.PPrice, ProductMst.PImage, ProductMst.PUnit, ProductMst.PQty, "+ 
                   " ProductMst.EntryDate, OrderMst.UserName, OrderMst.Quantity, OrderMst.Total, OrderMst.OrderStatus, OrderMst.OrderDate "+
                   " FROM  OrderMst INNER JOIN ProductMst ON OrderMst.PID = ProductMst.PID INNER JOIN UserMst ON OrderMst.UID = UserMst.UID "+
                   " WHERE(OrderMst.OrderID = '"+ Request.QueryString["OrderID"].ToString() + "')";
                DataTable dt = new DataTable();
                dt = SqlHelper.FillData(strcmd);
                if (dt.Rows.Count > 0)
                {
                    //User Details
                    lblFullName.Text = dt.Rows[0]["FirstName"].ToString();
                    lblFullName.Text += "   " + dt.Rows[0]["LastName"].ToString();
                    lblUserName.Text = dt.Rows[0]["UserName"].ToString();
                    lblGender.Text = dt.Rows[0]["Gender"].ToString();
                    lblAddress.Text = dt.Rows[0]["Address"].ToString();
                    lblCity.Text = dt.Rows[0]["City"].ToString();
                    lblContactNo.Text = dt.Rows[0]["ContactNo"].ToString();
                    //Order Details              
                    lblOrderID.Text = Request.QueryString["OrderID"].ToString();
                    lblOrderdate.Text = dt.Rows[0]["OrderDate"].ToString();
                    lblPrice.Text = dt.Rows[0]["PPrice"].ToString();
                    lblQty.Text = dt.Rows[0]["Quantity"].ToString();
                    lblTotal.Text = dt.Rows[0]["Total"].ToString();
                    lblOrderStatus.Text = dt.Rows[0]["OrderStatus"].ToString();
                    //Product Details
                    Image1.ImageUrl = dt.Rows[0]["PImage"].ToString(); ;
                    lblProdID.Text = dt.Rows[0]["PID"].ToString();
                    lblProdName.Text = dt.Rows[0]["PName"].ToString();
                    lblProductEntry.Text = dt.Rows[0]["EntryDate"].ToString();
                    lblProdDes.Text = dt.Rows[0]["PDetail"].ToString();    
                    lblProdUnit.Text = dt.Rows[0]["PUnit"].ToString();
                    lblTotalQty.Text = dt.Rows[0]["PQty"].ToString();
                }
            }
            else
            {
                RedirecToViewOrder();
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    //when order confirmed by user
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            //set orderstatus Pending to Delivered
            string strcmd = "update OrderMst set OrderStatus='Delivered' where OrderID='"+ Request.QueryString["OrderID"].ToString() + "'";
            SqlHelper.ExecuteNonQuery(strcmd);
            //stock Inventory i.e reduce quantity when order Confirmed
            strcmd = "update ProductMst set PQty=PQty-'" + Convert.ToInt32(lblQty.Text) + "' where PID='" + Convert.ToInt32(lblProdID.Text) + "'";
            SqlHelper.ExecuteNonQuery(strcmd);
            RedirecToViewOrder();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    //if order cancel by User or Admin
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //set orderstatus Pending to Cancelled
        string strcmd = "update OrderMst set OrderStatus='Cancelled' where OrderID='"+ Request.QueryString["OrderID"].ToString() + "'";
        SqlHelper.ExecuteNonQuery(strcmd);
        RedirecToViewOrder();        
    }
    //Redirect To a View Order Page
    private void RedirecToViewOrder()
    {
        Response.Redirect("ViewOrder.aspx");
    }
}