using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SE_Project
{
    public partial class SignIn : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("select Email, Password, Role from User_Sign_Up where Email=@Email AND Password=@Password AND Role = @Role", con);
            cmd.Parameters.AddWithValue("@Email", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", TextBox2.Text.Trim());
            cmd.Parameters.AddWithValue("@Role", TextBox3.Text.Trim());

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    // Assuming the Role is retrieved from the database
                    string userRole = dr["Role"].ToString();

                    // Store the user's role in the session
                    Session["UserRole"] = userRole;

                    // Redirect based on the user's role
                    if (userRole.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                    {
                        Response.Redirect("Appointment.aspx");
                    }
                    else if (userRole.Equals("User", StringComparison.OrdinalIgnoreCase))
                    {
                        Response.Redirect("Appointment.aspx");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid credentials');</script>");
            }
        }

    }
}