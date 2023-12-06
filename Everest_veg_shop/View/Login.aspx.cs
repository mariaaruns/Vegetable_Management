using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_veg_shop.View
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
    WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        

        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        public static string SName="";
        public static int SKey=0;
        protected void btn_Login_Click(object sender, EventArgs e)
        {
            try
            {

                conn.Open();
                if (adminRadio.Checked)
                {
                    if (email.Value == "admin@gmail.com" || pwd.Value == "admin")
                    {
                        Response.Redirect("Admin/seller.aspx");
                        Response.Write("Login successfull");
                    }
                }
                else
                {

                    SqlCommand cmd = new SqlCommand("sp_tbl_seller_login", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@selEmail", email.Value);
                    cmd.Parameters.AddWithValue("@selPassword", pwd.Value);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    //DataSet ds = new DataSet();
                    //da.Fill(ds);
                    //int i = int.Parse(ds.Tables[0].Rows[0][0].ToString());
                    //if (i > 0)
                    //{
                    //    Response.Redirect("Admin/Dashboard.aspx");
                    //}
                    //else
                    //{
                    //     infoMsg.InnerText="Invalid data";;
                    //}
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count == 0)
                    {
                        infoMsg.InnerText="Invalid User data";
                    }
                    else
                    {
                        SName = email.Value;
                        SKey = int.Parse(dt.Rows[0][0].ToString());
                        Response.Redirect("Seller/Billing.aspx");
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
            }
        }
    }
}