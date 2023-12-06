using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.Design;

namespace Everest_veg_shop.View.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
    WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Prdct_category_fetch();
            }
            Product_tbl_fetch();
            
        }
        public void Product_tbl_fetch()
        {
            try
            {
                string query = "select * from tbl_products";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                ProductGv.DataSource = ds.Tables[0];
                ProductGv.DataBind();

            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
            finally {
                conn.Close();
            }
        }
        public void Prdct_category_fetch()
        {
            prduct_category.ClearSelection();
            conn.Open();
            string query = "select * from  tbl_category";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            prduct_category.DataTextField = "catname";
            prduct_category.DataValueField = "catid";
            prduct_category.DataSource = dt;
            prduct_category.DataBind();
            conn.Close();

        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            try
            {
                if (prduct_name.Value == "" || prduct_price.Value == "" || prduct_qty.Value == "" || product_Exp_date.Value == "")
                {
                    ErrMsg.InnerText = "All fields must be filled";
                }
                else
                {
                    //string dateString = product_Exp_date.Value;
                    //DateTime selectedDate = DateTime.Parse(dateString);
                    //string formattedDate = selectedDate.ToString("yyyy-MM-dd");

                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_products_insert", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@prName", prduct_name.Value);
                    cmd.Parameters.AddWithValue("@prCat", prduct_category.SelectedValue);
                    cmd.Parameters.AddWithValue("@prPrice", prduct_price.Value);
                    cmd.Parameters.AddWithValue("@prQty", prduct_qty.Value);
                    SqlParameter param1 = new SqlParameter("@prExpDate", SqlDbType.Date);
                    cmd.Parameters.Add(param1).Value = product_Exp_date.Value;

                    int i = cmd.ExecuteNonQuery();

                    string result = i > 0 ? "Product Added" : "product not added";
                    ErrMsg.InnerText = result;
                }
            }
            catch(Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
            finally
            {
                conn.Close();
                Product_tbl_fetch();
            }
            }

        protected void btn_delete_product_Click(object sender, EventArgs e)
        {
            try
            {
                if (prduct_name.Value == ""||prduct_price.Value ==""||prduct_qty.Value==""||prduct_price.Value=="")
                {
                    ErrMsg.InnerText = "Data missing";
                }
                else
                {
                    int key = int.Parse(ProductGv.SelectedRow.Cells[1].Text);

                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_products_delete", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@prId", key);
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        ErrMsg.InnerText = "Deleted Successfully";
                        prduct_name.Value = "";
                        prduct_price.Value = "";
                        prduct_qty.Value = "";
                        product_Exp_date.Value="";
                                              
                    }
                    
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
        int key = 0;
        protected void ProductGv_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                prduct_name.Value = ProductGv.SelectedRow.Cells[2].Text.ToString();
                prduct_category.SelectedValue = ProductGv.SelectedRow.Cells[3].Text.ToString();
                prduct_price.Value = ProductGv.SelectedRow.Cells[4].Text.ToString();
                prduct_qty.Value = ProductGv.SelectedRow.Cells[5].Text.ToString();
                product_Exp_date.Value = ProductGv.SelectedRow.Cells[6].Text.ToString();

                if (prduct_name.Value == "")
                {
                    key = 0;
                }
                else
                {
                    key = Convert.ToInt32(ProductGv.SelectedRow.Cells[1].Text.ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                Response.Write("No data");

            }
        }

        protected void btn_edit_product_Click(object sender, EventArgs e)
        {
            try
            {
                if (prduct_name.Value == "" || prduct_category.DataTextField == "" || prduct_price.Value == "" || prduct_qty.Value == "" || product_Exp_date.Value == "")
                {
                    ErrMsg.InnerText = "All fields must be filled";
                }
                else
                {
                    int key = int.Parse(ProductGv.SelectedRow.Cells[1].Text);
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_products_update", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@prId", key);
                    cmd.Parameters.AddWithValue("@prName", prduct_name.Value);
                    cmd.Parameters.AddWithValue("@prCat", prduct_category.Text);
                    cmd.Parameters.AddWithValue("@prPrice", prduct_price.Value);
                    cmd.Parameters.AddWithValue("@prQty", prduct_qty.Value);
                    cmd.Parameters.AddWithValue("@prExpDate", product_Exp_date.Value);
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        ErrMsg.InnerText = "Updated Successfully";
                        prduct_name.Value = "";
                        prduct_price.Value = "";
                        prduct_qty.Value = "";
                        product_Exp_date.Value = "";
                    }

                    else
                    {
                        ErrMsg.InnerText = "Check all Details must be filled";
                    }
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
    }
}