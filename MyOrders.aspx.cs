using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_MyOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {                   
           
    }
    //Check User Pending Orders
    protected void lnkPendingOrders_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "SELECT PID, PName, Quantity, Total, OrderDate FROM OrderMst " +
                     " WHERE(UserName = '" + Session["User"].ToString() + "') AND(OrderStatus = 'Pending')";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                Label1.Text = "There Are " + Convert.ToInt32(dt.Rows.Count) + " Pending Orders </br>";
                Label1.Text += "You can Cancel Your Pending Orders By Filling Feedback Suggestion Form </br>";
                Label1.Text += "Or else You can contact Admin. Details Are Provided in Contact US Page...";
            }
            else
            {
                Label1.Text = "No Pending Orders Available..!";
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if(e.AffectedRows<1)
        {
            Label1.Text = "No Orders Available";
        }
        else
        {
            GridView1.Caption = " Total Orders: " + Convert.ToString(Convert.ToInt32(e.AffectedRows));
        }
    }   
}