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
    public partial class Contact_msg : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
   WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
         //   Contactfetch();
            cal_search_contact.SelectedDate = DateTime.Today;
            
            if(cal_search_contact.SelectedDate == DateTime.Today)
            {
                Contactfetchbydate();
            }
        }
        private void Contactfetch()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_contact_fetch", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ContactGv.DataSource = dt;
                ContactGv.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            conn.Close();
        }
        private void Contactfetchbydate() {

            try
            {
                string query = "select * from tbl_contactus where c_date LIKE '' + @cal_search_contact + '%'";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@cal_search_contact", cal_search_contact.SelectedDate.Date.ToString("yyyy-MM-dd"));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ContactGv.DataSource = dt;
                ContactGv.DataBind();

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
        protected void txt_search_contact_TextChanged(object sender, EventArgs e)
        {

        }
        
        protected void cal_search_contact_SelectionChanged(object sender, EventArgs e)
        {
            Contactfetchbydate();
        }
    }
}