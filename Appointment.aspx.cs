using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SE_Project
{
    public partial class Appointment : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDoctors();
            }
        }
        private void LoadDoctors()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT Name FROM Doctor", con))
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            ddlDoctors.DataSource = reader;
                            ddlDoctors.DataTextField = "Name";
                            ddlDoctors.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string doctorName = ddlDoctors.SelectedItem.Text;
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Dr_Appointment (Name, Dr_Name, Disease, Gender, Time,Created_At,Updated_At) VALUES (@Name, @Dr_Name, @Disease, @Gender, @Time, GETDATE(), GETDATE())", con))
                    {
                        cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                        cmd.Parameters.AddWithValue("@Dr_Name", doctorName);
                        cmd.Parameters.AddWithValue("@Disease", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@Gender", TextBox3.Text);
                        cmd.Parameters.AddWithValue("@Time", TextBox4.Text);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Write("<script>alert('Appointment saved successfully!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}