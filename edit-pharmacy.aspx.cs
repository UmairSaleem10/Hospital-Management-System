using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class edit_pharmacy : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve DoctorID from the query string
                if (Request.QueryString["ID"] != null)
                {
                    string id = Request.QueryString["ID"];
                    LoadData(id);
                }
            }
        }
        private void LoadData(string id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ID, Name, Contact, Address, No_Medicine FROM Pharmacy WHERE ID = @ID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        TextBox0.Text = reader["ID"].ToString();
                        TextBox1.Text = reader["Name"].ToString();
                        TextBox2.Text = reader["Contact"].ToString();
                        TextBox3.Text = reader["Address"].ToString();
                        TextBox4.Text = reader["No_Medicine"].ToString();
                    }
                }
            }
        }
        private void UpdateData(string id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Pharmacy SET ID = @ID, Name = @Name, Contact = @Contact, Address = @Address, No_Medicine = @No_Medicine, Updated_AT = GETDATE() WHERE DoctorID = @DoctorID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", TextBox0.Text.Trim());
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Contact", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@No_Medicine", TextBox4.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // Redirect back to the Doctor page after editing
            Response.Redirect("Pharmacy.aspx");
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Retrieve DoctorID from the query string
            if (Request.QueryString["ID"] != null)
            {
                string id = Request.QueryString["ID"];
                UpdateData(id);
            }
        }
    }
}