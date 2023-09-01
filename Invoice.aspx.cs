using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using iTextSharp.text.html.simpleparser;

public partial class User_Invoice : System.Web.UI.Page
{
    string strConnectionString = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
    int gtotal = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //get buyer details
            if (Session["User"] !=null)
            {
                string strcmd = "select *from UserMst where UserName='" + Session["User"].ToString() + "'";
                DataTable dt = new DataTable();
                dt = SqlHelper.FillData(strcmd);
                if (dt.Rows.Count > 0)
                {                    
                    lblOrderdate.Text = DateTime.Now.ToString();
                    lblName.Text = dt.Rows[0]["FirstName"].ToString();
                    lblName.Text += "   " + dt.Rows[0]["LastName"].ToString();
                    lblBillAddr.Text = dt.Rows[0]["Address"].ToString();
                    lblCity.Text = dt.Rows[0]["City"].ToString();
                    lblcontactNo.Text = dt.Rows[0]["ContactNo"].ToString();
                }
            }

            //Generate invoice
            DataTable Dt = new DataTable();
            Dt = (DataTable)Session["buyitems"];
            if (Dt!=null)
            {
                int row = Convert.ToInt32(Dt.Rows.Count);
                if (Session["buyitems"] != null)
                {
                    GridView1.DataSource = Dt;
                    GridView1.DataBind();
                }

                for (int i = 0; i < row; i++)
                {
                    int total = Convert.ToInt32(Dt.Rows[i]["totalprice"]);
                    gtotal = gtotal + total;
                }
                GridView1.FooterRow.Cells[4].Text = "Grand Total:";
                GridView1.FooterRow.Cells[5].Text = gtotal.ToString();
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

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        //for inserting data in order table       
        try
        {
            DataTable Dt = new DataTable();
            Dt = (DataTable)Session["buyitems"];
            SqlConnection con = new SqlConnection(strConnectionString);
            if (Dt != null)
            {
                int row = Convert.ToInt32(Dt.Rows.Count);
                for (int i = 0; i < row; i++)
                {
                    string strcmd = "INSERT INTO OrderMst " +
                                    " (UID, UserName, PID, PName, Quantity, Total, OrderStatus, OrderDate) " +
                                    " VALUES(@UID, @UserName, @PID, @PName, @Quantity, @Total, @OrderStatus, @OrderDate)   ";
                    SqlCommand cmd = new SqlCommand(strcmd, con);
                    cmd.Parameters.AddWithValue("@UID", Convert.ToInt32(Session["UserID"].ToString()));
                    cmd.Parameters.AddWithValue("@UserName", Session["User"].ToString());
                    cmd.Parameters.AddWithValue("@PID", Convert.ToInt32(Dt.Rows[i]["PID"].ToString()));
                    cmd.Parameters.AddWithValue("@PName", Dt.Rows[i]["PName"].ToString());
                    cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(Dt.Rows[i]["quantity"].ToString()));
                    cmd.Parameters.AddWithValue("@Total", Convert.ToInt32(Dt.Rows[i]["totalprice"].ToString()));
                    cmd.Parameters.AddWithValue("@OrderStatus", "Pending");
                    cmd.Parameters.AddWithValue("@OrderDate", Convert.ToDateTime(lblOrderdate.Text));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();                   
                }
            }          
            //Destroy datatable i.e Dt values 
            Dt.Clear();
            Response.Redirect("MyOrders.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
     //Download purchase invoice implementation
    protected void imgBtnDownload_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Invoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);


            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
            Panel1.RenderControl(htmlTextWriter);

            StringReader stringReader = new StringReader(stringWriter.ToString());
            Document Doc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(Doc);
            PdfWriter.GetInstance(Doc, Response.OutputStream);

            Doc.Open();
            htmlparser.Parse(stringReader);
            Doc.Close();
            Response.Write(Doc);
            Response.End();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected override void Render(HtmlTextWriter writer)
    {
        // Ensure that the control is nested in a server form.
        if (Page != null)
        {
            Page.VerifyRenderingInServerForm(this);
        }
        base.Render(writer);
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        return;
    }   
}
