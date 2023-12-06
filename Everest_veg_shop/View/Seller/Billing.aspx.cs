using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.IO.Ports;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.DynamicData;
using System.Security.Cryptography.X509Certificates;
using System.Diagnostics;
using Everest_veg_shop.View.Admin;
using System.Drawing.Printing;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;


namespace Everest_veg_shop.View.Seller
{
    public partial class Billing : System.Web.UI.Page
    {
        int Seller = Login.SKey;
        SqlConnection conn = new SqlConnection(
 WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            int Seller = Login.SKey;

            Product_tbl_fetch();

            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[5]{
                    new DataColumn("Id"),
                    new DataColumn("Product"),
                    new DataColumn("Price"),
                    new DataColumn("Quantity"),
                    new DataColumn("Total"),
                    });
                ViewState["Bill"] = dt;
                this.BindGrid();

            }

        }
        protected void BindGrid()
        {
            
            BillGv.DataSource = (DataTable)ViewState["Bill"];
            BillGv.DataBind();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        public void Product_tbl_fetch()
        {
            string query = "select prId as ID,prName as ProductName,prCat as Category,prQty as Qty,prPrice as Price from tbl_products";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                ProductGv.DataSource = ds.Tables[0];
                ProductGv.DataBind();
            }
            catch (Exception ex) {
                Response.Write(ex.Message);
            }
            finally {
                conn.Close();
            }

        }
        int key = 0;
        static int stock;
        protected void ProductGv_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                stock = int.Parse(ProductGv.SelectedRow.Cells[4].Text.ToString());
                if (stock == 0||stock < 0)
                {
                    ErrMsg.InnerText = "out of Stock";
                }
                else {
                    prduct_name.Value = ProductGv.SelectedRow.Cells[2].Text.ToString();
                    product_price.Value = ProductGv.SelectedRow.Cells[5].Text.ToString();
                    stock = int.Parse(ProductGv.SelectedRow.Cells[4].Text.ToString());
                    if (prduct_name.Value == "")
                    {
                        key = 0;
                    }
                    else
                    {
                        key = Convert.ToInt32(ProductGv.SelectedRow.Cells[1].Text.ToString());
                    }
                }
                              

                if (prduct_name.Value == "")
                {
                    key = 0;
                }
                
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                Response.Write("No data");

            }
        }
        protected void UpdateStock()
        {
            try
            {
                
                key = int.Parse(ProductGv.SelectedRow.Cells[1].Text.ToString());
                int newqty = int.Parse(ProductGv.SelectedRow.Cells[4].Text.ToString()) - Convert.ToInt32(product_qty.Value);
                SqlCommand cmd = new SqlCommand("sp_tbl_product_newstock", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prId", key);
                cmd.Parameters.AddWithValue("@prQty", newqty);
                int i = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            
        }

        

        static double amount;
        int grandtotal = 0;
        
        protected void PrntBill_Click(object sender, EventArgs e)
        {
            
            try
            {

                if (prduct_name.Value == "" || product_price.Value == "")
                {

                    ErrMsg.InnerText = "All field Must be filled";
                }
                else if (product_qty.Value == "")
                {
                    ErrMsg.InnerText = "Quantity field missing";

                }
                else if (int.Parse(product_qty.Value) > stock)
                {
                    ErrMsg.InnerText = "qty is higher than actual stock";
                    
                    prduct_name.Value = ""; 
                    product_price.Value =""; 
                    product_qty.Value = "";

                }

                else
                {
                    conn.Open();
                    int total = int.Parse(product_qty.Value) * int.Parse(product_price.Value);

                    DataTable dt = (DataTable)ViewState["Bill"];
                    dt.Rows.Add(BillGv.Rows.Count + 1,
                    prduct_name.Value.Trim(),
                    product_price.Value.Trim(),
                    product_qty.Value.Trim(),
                    total);

                    ViewState["Bill"] = dt;
                    this.BindGrid();
                  
                    UpdateStock();

                    
                    for (int i = 0; i <= BillGv.Rows.Count - 1; i++)
                    {
                        grandtotal = grandtotal + int.Parse(BillGv.Rows[i].Cells[5].Text.ToString());
                    }
                    amount = grandtotal;
                    txt_grnd_ttl.InnerText = "Grand Total = Rs." + grandtotal;


                    prduct_name.Value = string.Empty;
                    product_price.Value = string.Empty;
                    product_qty.Value = string.Empty;
                  
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                
                conn.Close();
                Product_tbl_fetch();


            }


        }
        protected void btn_print_Click(object sender, EventArgs e)
        {
            if (c_name.Value != "" || mobile.Value != "" || city.Value != "")
            {
                try
                {

                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_bill_insert", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@billDate", System.DateTime.Now);
                    cmd.Parameters.AddWithValue("@custName", c_name.Value);
                    cmd.Parameters.AddWithValue("@mobile", mobile.Value);
                    cmd.Parameters.AddWithValue("@city", city.Value);
                    cmd.Parameters.AddWithValue("@seller", Seller);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        ErrMsg.InnerText = "Bill Added";

                    }
                    else
                    {
                        ErrMsg.InnerText = "Missing Data";
                    }
                }

                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                ErrMsg.InnerText = "Customer field missing";
            }
        }
        public void PrintBill()
        {
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            product_qty.Value = "";
            product_price.Value = "";
            prduct_name.Value = "";

            DataTable dt = (DataTable)ViewState["Bill"];
            dt.Rows.Clear();
            BillGv.DataSource = dt;
            BillGv.DataBind();
            grandtotal = 0;
            txt_grnd_ttl.InnerText = "Grand Total = Rs." + grandtotal;
            
        }

        protected void BillGv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
         
            int rowIndex = e.RowIndex;
            DataTable dt = (DataTable)ViewState["Bill"];


            if (dt != null && rowIndex >= 0 && rowIndex < dt.Rows.Count)
            {
                string columnName = "Quantity";
                

                if (dt.Columns.Contains(columnName))
                {
                int billingqty = Convert.ToInt32(dt.Rows[rowIndex][columnName]);// assigning billing grid qty 

                    // Update the quantity value in the data source
                    //currentQuantity -= 1;
                    //dt.Rows[rowIndex][columnName] = currentQuantity;

                    int productqty = int.Parse(ProductGv.SelectedRow.Cells[4].Text); //productgrid qty value
                    int newqty = productqty + billingqty; //product qty + billing qty
                    conn.Open();
                    key = int.Parse(ProductGv.SelectedRow.Cells[1].Text.ToString()); //product grid id value
                    
                    SqlCommand cmd = new SqlCommand("sp_tbl_product_newstock", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@prId", key);
                    cmd.Parameters.AddWithValue("@prQty", newqty);
                    int x = cmd.ExecuteNonQuery();
                    if (x > 0)
                    {
                        ErrMsg.InnerText = "Qty Updated";
                      
                    }
                    conn.Close();
                    Product_tbl_fetch();
                }
                
                dt.Rows.RemoveAt(e.RowIndex);
                BillGv.DataSource = dt;
                BillGv.DataBind();

                grandtotal = 0;
                for (int i = 0; i <= BillGv.Rows.Count - 1; i++)
                {
                    grandtotal = grandtotal + int.Parse(BillGv.Rows[i].Cells[5].Text.ToString());
                }
                amount = grandtotal;
                txt_grnd_ttl.InnerText = "Grand Total = Rs." + grandtotal;
             
            }
        }
        
        protected void BillGv_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

           
        }
    }
}