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
            SqlCommand cmd = new SqlCommand("select Email,Password,Role from User_Sign_Up where Email='" + TextBox1.Text.Trim() + "' AND Password='" + TextBox2.Text.Trim() + "' AND Role='" + TextBox3.Text.Trim() + "' ", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                }
                Response.Redirect("Appointment.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid credentials');</script>");
            }
        }
    }
}