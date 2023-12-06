using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Everest_veg_shop.View
{
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
    WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_contact_send_Click(object sender, EventArgs e)
        {
            if (txt_contact_name.Text == "" || txt_contact_email.Text == "" || txt_contact_phonenumber.Text == "" || txt_contact_msg.Text == "")
            {

                ErrMsg.InnerText = "All fields must be filled";
            }
            else
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_contactus_insert", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@c_name", txt_contact_name.Text);
                    cmd.Parameters.AddWithValue("@c_email", txt_contact_email.Text);
                    cmd.Parameters.AddWithValue("@c_phone", txt_contact_phonenumber.Text);
                    cmd.Parameters.AddWithValue("@c_date", System.DateTime.Today.Date.ToString("yyyy-MM-dd"));
                    cmd.Parameters.AddWithValue("@c_textarea", txt_contact_msg.Text);
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        SuccessMsg.InnerText = "Message Sended";
                        ErrMsg.InnerText = "";
                    }
                    else
                    {
                        ErrMsg.InnerText = "all fields must be filled";
                    }
                }
                catch (Exception ex)
                {
                    ErrMsg.InnerText = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }

        }
       
    }
}