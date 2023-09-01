using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Admin_AddItem : System.Web.UI.Page
{
    string strConnectionString = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    //Add New Product implementation
  protected void btnAddProduct_Click(object sender, EventArgs e)
    {
       try
        {
            if(PImg.PostedFile !=null)
            {
                string strExt = Path.GetExtension(PImg.FileName);
                if (strExt.ToLower() == ".jpeg" || strExt == ".jpg" || strExt == ".bmp" || strExt == ".png" || strExt == ".gif" ||strExt==".jfif")
                {
                    string strFileName = PImg.PostedFile.FileName;
                    PImg.PostedFile.SaveAs(Server.MapPath("~/ProdImg/" + strFileName));
                    string strPath = "~/ProdImg/" + strFileName;
                   SqlConnection con = new SqlConnection(strConnectionString);
                    string strCmd = "INSERT INTO ProductMst "+
                                    " (Pname, CID, PDetail, PPrice, PImage, PUnit, PQty, EntryDate) "+
                                     " VALUES(@Pname,@CID,@PDetail,@PPrice,@PImage,@PUnit,@PQty,@EntryDate)";
                    SqlCommand cmd = new SqlCommand(strCmd, con);                   
                    cmd.Parameters.AddWithValue("@PName", txtPName.Text);
                    cmd.Parameters.AddWithValue("@CID", ddlCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@PDetail", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@PImage", strPath);
                    cmd.Parameters.AddWithValue("@PUnit", ddlUnit.SelectedValue);
                    cmd.Parameters.AddWithValue("@PQty", txtQty.Text);
                    cmd.Parameters.AddWithValue("@EntryDate", DateTime.Now.ToShortDateString());
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Product Details Saved Successfully.!')</script>");
                    clears();
                }
                else
                {
                    Response.Write("<script>alert('Select Only Image File..!')</script>");
                }

            }
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }
    private void clears()
    {
        txtPName.Text = "";
        txtDescription.Text = "";
        txtPrice.Text = "";
        txtQty.Text = "";
        txtPName.Text = "";
    }
}
