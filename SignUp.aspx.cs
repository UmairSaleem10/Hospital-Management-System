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
    public partial class SignUp : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkperson())
            {
                Response.Write("<script>alert('We have already this Email try again:)');</script>");
            }
            else
            {
                try
                {
                    string gender = ddlGender.SelectedItem.Text;
                    string role = ddlRole.SelectedItem.Text;
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("insert into User_Sign_Up(FirstName,Username,Password,Email,Gender,Role,Created_At,Updated_At) values(@FirstName,@Username,@Password,@Email,@Gender,@Role, GETDATE(), GETDATE())", con);
                    cmd.Parameters.AddWithValue("@FirstName", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Username", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Role", role);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('You have Sign Up Successfully:)');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }
        bool checkperson()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from User_Sign_Up where Email = '" + TextBox4.Text.Trim() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                con.Close();
                Response.Write("<script>alert('You have Sign Up Successfully:)');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

            return false;
        }
    }

}