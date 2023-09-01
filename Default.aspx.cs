using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadData();           
        }
    }
    //data binding to chart
    private void LoadData()
    {
        try
        {
            string strcmd = "SELECT   OrderStatus, COUNT(OrderID) AS Expr1  FROM OrderMst " +
                            " GROUP BY OrderStatus";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            Chart1.DataSource = dt;
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            Chart1.Series[0].Points.DataBindXY(x,y);
            //for getting total Profit
            strcmd = "select sum(Total)profit from OrderMst where OrderStatus='Delivered'";
            dt = SqlHelper.FillData(strcmd);
            if(dt.Rows.Count>0)
            {
                Label1.Text += "  " + Convert.ToDouble(dt.Rows[0]["profit"]);
                Label1.Text += "/- Rs";
            }

            //for calculating total no of users
            strcmd = "select count(UID)total from UserMst";
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
               Label2.Text += "  " + Convert.ToInt32(dt.Rows[0]["total"]);               
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    
}