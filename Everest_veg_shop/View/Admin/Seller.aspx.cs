using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq.Expressions;

namespace Everest_veg_shop.View.Admin
{
    public partial class Seller : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
    WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
             fetchdata();
            conn.Close();
        }   

        public void fetchdata()
        {
            
                try
                { 
                    string query = "select * from tbl_seller";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                sellerGv.DataSource = dt;
                    sellerGv.DataBind();
                }
                catch (Exception ex)
                {
                    ErrMsg.InnerText = ex.Message;
                }
                
            
        }
        

        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            try
            {
                if (seller_name.Value == "" || seller_email.Value == "" || seller_address.Value == "" || seller_phone.Value == "" || seller_pwd.Value == "")
                {
                    ErrMsg.InnerText = "All fields must be filled";
                }
                else {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_seller_insert", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@selName",seller_name.Value);
                    cmd.Parameters.AddWithValue("@selEmail", seller_email.Value);
                    cmd.Parameters.AddWithValue("@selPassword", seller_pwd.Value);
                    cmd.Parameters.AddWithValue("@selAdress", seller_address.Value);
                    cmd.Parameters.AddWithValue("@selPhone", seller_phone.Value);
                    
                    int i = cmd.ExecuteNonQuery();
                  
                    string result = i > 0 ? "Seller Added" : "Seller not added";
                    ErrMsg.InnerText = result;
                    
                    seller_address.Value = "";
                    seller_email.Value = "";
                    seller_name.Value = "";
                    seller_phone.Value = "";
                    seller_pwd.Value = "";
                }

            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = (ex.Message);
            }
            finally
            {
                fetchdata();
                conn.Close();

            }

        }
        int key = 0;
        protected void sellerGv_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int key = int.Parse(sellerGv.SelectedRow.Cells[1].Text);
                if (key.ToString() != "")
                {
                    seller_name.Value = sellerGv.SelectedRow.Cells[2].Text;
                    seller_email.Value = sellerGv.SelectedRow.Cells[3].Text;
                    seller_pwd.Value = sellerGv.SelectedRow.Cells[4].Text;
                    seller_phone.Value = sellerGv.SelectedRow.Cells[5].Text;
                    seller_address.Value = sellerGv.SelectedRow.Cells[6].Text;

                    if (seller_name.Value == "")
                    {
                        key = 0;
                    }
                    else
                    {
                        key = int.Parse(sellerGv.SelectedRow.Cells[1].Text);
                    }
                }
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
                Response.Write("No data");

            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {

            try
            {
                if (seller_name.Value == "" || seller_email.Value == "" || seller_address.Value == "" || seller_phone.Value == "" || seller_pwd.Value == "")
                {
                    ErrMsg.InnerText = "All fields must be filled";
                }
                else
                {
                    int key = int.Parse(sellerGv.SelectedRow.Cells[1].Text);
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_seller_update", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@selId", key);
                    cmd.Parameters.AddWithValue("@selName", seller_name.Value);
                    cmd.Parameters.AddWithValue("@selEmail", seller_email.Value);
                    cmd.Parameters.AddWithValue("@selPassword", seller_pwd.Value);
                    cmd.Parameters.AddWithValue("@selPhone", seller_phone.Value);
                    cmd.Parameters.AddWithValue("@selAdress", seller_address.Value);
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        ErrMsg.InnerText = "Updated Successfully";
                        seller_address.Value = "";
                        seller_email.Value = "";
                        seller_name.Value = "";
                        seller_phone.Value = "";
                        seller_pwd.Value = "";
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
                fetchdata();
                conn.Close();

            }

        }

        protected void btn_delete_seller_Click(object sender, EventArgs e)
        {
            try {
                if (seller_pwd.Value == "")
                {
                    ErrMsg.InnerText = "Data missing";
                }
                else {
                    int key = int.Parse(sellerGv.SelectedRow.Cells[1].Text);

                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_seller_delete", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@selId", key);
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        ErrMsg.InnerText = "Deleted Successfully";
                        seller_address.Value = "";
                        seller_email.Value = "";
                        seller_name.Value = "";
                        seller_phone.Value = "";
                        seller_pwd.Value = "";

                    }
                    
                } 
            }


            catch (Exception ex)
            {
                ErrMsg.InnerText=ex.Message;
            }
            finally
            {
                fetchdata();
                conn.Close();
            }
            }

        }
    } 


       
