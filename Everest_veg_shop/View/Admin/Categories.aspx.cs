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
    public partial class Categories : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
    WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
            fetchdata();
            
        }
        public void fetchdata()
        {
            try
            {
                string query = "select * from tbl_category ";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                CatGv.DataSource = ds.Tables[0];
                CatGv.DataBind();
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

        int key = 0;
        protected void CatGv_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                catName.Value = (CatGv.SelectedRow.Cells[2].Text.ToString());
                catDescription.Value = CatGv.SelectedRow.Cells[3].Text.ToString();

                if (catName.Value == "")
                {
                    key = 0;
                }
               
                else
                {
                    key = int.Parse(CatGv.SelectedRow.Cells[1].Text.ToString());
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

        protected void Unnamed3_Click(object sender, EventArgs e)
        {

            try
            {
                if (catDescription.Value == "" || catName.Value == "")
                {
                    ErrMsg.InnerText = "All fields must be filled";
                }
                else
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_category_insert", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@catName", catName.Value);
                    cmd.Parameters.AddWithValue("@catDescription", catDescription.Value);

                    int i = cmd.ExecuteNonQuery();

                    string result = i > 0 ? "Category Added" : "Something Wrong";
                    ErrMsg.InnerText = result;

                    catName.Value = "";
                    catDescription.Value = "";

                }

            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = (ex.Message);
            }
            finally
            {
                conn.Close();
                fetchdata();

            }
        }

        protected void btn_delete_category_Click(object sender, EventArgs e)
        {
            try
            {
                if (catName.Value == "" || catDescription.Value == "")
                {
                    ErrMsg.InnerText = "Data missing";
                }
                else
                {
                    int key = int.Parse(CatGv.SelectedRow.Cells[1].Text);

                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_category_delete", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@catid", key);
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        ErrMsg.InnerText = "Deleted Successfully";
                        catName.Value = "";
                        catDescription.Value = "";


                    }
                }
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = (ex.Message);
            }
            finally
            {
                conn.Close();
                fetchdata();
            }


           
        }

        protected void btn_edit_category_Click(object sender, EventArgs e)
        {
            try
            {
                if (catName.Value == "" || catDescription.Value == "")
                {
                    ErrMsg.InnerText = "All fields must be filled";
                }
                else
                {
                    int key = int.Parse(CatGv.SelectedRow.Cells[1].Text);
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_category_update", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@catid", key);
                    cmd.Parameters.AddWithValue("@catName", catName.Value);
                    cmd.Parameters.AddWithValue("@catDescription", catDescription.Value);
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        ErrMsg.InnerText = "Updated Successfully";
                        catDescription.Value = "";
                        catName.Value = "";
                        
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
                fetchdata();
            }
        }
    }
}


