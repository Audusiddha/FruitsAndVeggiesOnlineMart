using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Cart : System.Web.UI.Page
{
    string strConnectionString = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
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
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("PID");
            dt.Columns.Add("PImage");
            dt.Columns.Add("PName");
            dt.Columns.Add("PPrice");
            dt.Columns.Add("quantity");
            dt.Columns.Add("totalprice");

            if (Request.QueryString["id"]!=null)
            {
                //while first time insert
                if(Session["buyitems"] ==null)
                {
                    dr = dt.NewRow();
                    SqlConnection scon = new SqlConnection(strConnectionString);
                    String myquery = "select * from ProductMst where PID=" + Request.QueryString["id"];
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = myquery;
                    cmd.Connection = scon;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"] = 1;
                    dr["PID"] = ds.Tables[0].Rows[0]["PID"].ToString();                   
                    dr["PImage"] = ds.Tables[0].Rows[0]["PImage"].ToString();
                    dr["PName"] = ds.Tables[0].Rows[0]["PName"].ToString();
                    dr["PPrice"] = ds.Tables[0].Rows[0]["PPrice"].ToString();
                    dr["quantity"] = Request.QueryString["quantity"].ToString();
                    int price = Convert.ToInt32(ds.Tables[0].Rows[0]["PPrice"].ToString());
                    int Qty= Convert.ToInt32(Request.QueryString["quantity"].ToString());
                    int total = price * Qty;
                    dr["totalprice"] = total;

                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    Session["buyitems"] = dt;
                    GridView1.FooterRow.Cells[5].Text = "Total Amount";
                    GridView1.FooterRow.Cells[6].Text = grandTotal().ToString();
                    Response.Redirect("Cart.aspx");

                }
                //next time insert
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    int sr;
                    sr = dt.Rows.Count;
                    dr = dt.NewRow();
                    SqlConnection scon = new SqlConnection(strConnectionString);
                    String myquery = "select * from ProductMst where PID=" + Request.QueryString["id"];
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = myquery;
                    cmd.Connection = scon;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"] = sr + 1;
                    dr["PID"] = ds.Tables[0].Rows[0]["PID"].ToString();
                    dr["PImage"] = ds.Tables[0].Rows[0]["PImage"].ToString();
                    dr["PName"] = ds.Tables[0].Rows[0]["PName"].ToString();
                    dr["PPrice"] = ds.Tables[0].Rows[0]["PPrice"].ToString();
                    dr["quantity"] = Request.QueryString["quantity"].ToString();
                    int price = Convert.ToInt32(ds.Tables[0].Rows[0]["PPrice"].ToString());
                    int Qty = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                    int total = price * Qty;
                    dr["totalprice"] = total;

                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    Session["buyitems"] = dt;
                    GridView1.FooterRow.Cells[5].Text = "Total Amount";
                    GridView1.FooterRow.Cells[6].Text = grandTotal().ToString();
                    Response.Redirect("Cart.aspx");
                }
            }
            //Grand Total calculation
            else
            {
                if(Dt!=null)
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (dt.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandTotal().ToString();
                        btnBuy.Enabled = true;
                    }
                }
            }
            Label1.Text = dt.Rows.Count.ToString();
        }
    }
    // calcule GrandTotal implementation
    public int grandTotal()
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        int nrow = dt.Rows.Count;
        int i = 0;
        int gTotal = 0;
        while(i<nrow)
        {
            gTotal = gTotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());
            i = i + 1;
        }
        return gTotal;
    }
    //Remove Items from cart
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            int sr1;
            string qdata;
            string dtdata;
            sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
            TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
            qdata = cell.Text;
            dtdata = sr.ToString();
            sr1 = Convert.ToInt32(qdata);
            if (sr == sr1)
            {
                dt.Rows[i].Delete();
                dt.AcceptChanges();
                break;
            }
        }
        for (int i = 1; i <= dt.Rows.Count - 1; i++)
        {
            dt.Rows[i - 1]["sno"] = i;
            dt.AcceptChanges();
        }
        Session["buyitems"] = dt;
        Response.Redirect("Cart.aspx");
        }   
}