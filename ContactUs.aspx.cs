using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into User_Data(Name,Email,PhoneNumber,Message,Created_At,Updated_At) values(@Name,@Email,@PhoneNumber,@Message, GETDATE(), GETDATE())", con);
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@PhoneNumber", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Message", TextBox4.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Your Data Saved Successfully:)');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}