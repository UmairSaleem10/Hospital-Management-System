using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class Doctor : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            userContent.Visible = true;
            string userRole = Session["UserRole"] as string;
            if (userRole != null)
            {
                userContent.Visible = true; // Content visible to both users and admins

                if (userRole.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                {
                    adminContent.Visible = true; // Content visible only to admins
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Doctor (DoctorID, Name, Speciality, Email, Address, Created_AT, Updated_AT) VALUES (@DoctorID, @Name, @Speciality, @Email, @Address, GETDATE(), GETDATE())", con);
                cmd.Parameters.AddWithValue("@DoctorID", TextBox0.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Speciality", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", TextBox4.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Doctor added successfully!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT DoctorID, Name, Speciality, Email, Address, Created_AT, Updated_AT FROM Doctor", con))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        // Bind the data to the GridView
                        gridView.DataSource = dt;
                        gridView.DataBind();

                        // Show the GridView
                        gridView.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
