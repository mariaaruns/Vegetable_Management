using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Everest_veg_shop.View.Admin
{
    public partial class Customer_Records : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Calendar1.SelectedDate = DateTime.Today;
            
            CustomerFetchbyDate();
        }
        protected void CustomerFetchbyDate()
        {
            try
            {
                string query =  "SELECT * FROM tbl_bill WHERE billDate = @billDate"; 
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@billDate", Calendar1.SelectedDate.Date.ToString("yyyy-MM-dd"));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Customer_Gv.DataSource = dt;
                Customer_Gv.DataBind();

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
        protected void CustomerGv_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            CustomerFetchbyDate();
        }
    }
}