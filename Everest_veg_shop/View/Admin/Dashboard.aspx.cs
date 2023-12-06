using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_veg_shop.View.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
 WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Getproducts();
            Getcategories();
            Getfinance();
            Getseller();
            if (!IsPostBack)
            {
                Sellerlist();
            }
             GetSalesBySeller(); 
            
        }
        
        protected void Getproducts()
        {
            try
            {
                conn.Open();
                string query = "select count(*) from tbl_products";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txt_product_count.InnerText = "Available " + dt.Rows[0][0].ToString();
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
        protected void Getcategories()
        {
            try
            {
                conn.Open();
                string query = "select count(*) from tbl_category";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txt_categories_count.InnerText = dt.Rows[0][0].ToString() + " Types";
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
        protected void Getfinance()
        {
            try
            {
                conn.Open();
                string query = "select sum(Amount) from tbl_bill";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txt_finanace.InnerText = "Earned Rs " + dt.Rows[0][0].ToString() + " /.";
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

        protected void Getseller()
        {
            try
            {
                conn.Open();
                string query = "select count(*) from tbl_seller";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txt_sellers_count.InnerText = "Total sellers :" + dt.Rows[0][0].ToString();
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
        protected void Sellerlist()
        {
            try
            {
                cb_sellers.Items.Clear();
                string query = "select selName from tbl_seller";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    cb_sellers.Items.Add(dr[0].ToString());
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

        protected void GetSalesBySeller()
        {
            try
            {
                conn.Open();
                string query = "SELECT SUM(amount) FROM tbl_bill WHERE seller = (SELECT selId FROM tbl_seller WHERE selName = @selName)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@selName", cb_sellers.Text);

                object result = cmd.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    decimal totalAmount = Convert.ToDecimal(result);
                    txt_totalsales.InnerText = "Rs. " + totalAmount.ToString() + " /.";
                }
                else
                {
                    txt_totalsales.InnerText = "Rs. 0 /.";
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
       

        protected void cb_sellers_SelectedIndexChanged(object sender, EventArgs e)
        {

        GetSalesBySeller();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
               
        
        }
    }
}