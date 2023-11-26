using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class edit_worker : System.Web.UI.Page
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
                    LoadWorkerData(id);
                }
            }
        }
        private void LoadWorkerData(string id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ID, Name, Role, Address FROM worker WHERE ID = @ID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        TextBox0.Text = reader["ID"].ToString();
                        TextBox1.Text = reader["Name"].ToString();

                        // Set the selected value of the DropDownList based on the role
                        string role = reader["Role"].ToString();
                        if (ddlworker.Items.FindByValue(role) != null)
                        {
                            ddlworker.SelectedValue = role;
                        }

                        TextBox2.Text = reader["Address"].ToString();
                    }
                }
            }
        }
        private void Updateworker(string id)
        {
            string role = ddlworker.SelectedItem.Text;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE worker SET Name = @Name, Role = @Role, Address = @Address, Updated_AT = GETDATE() WHERE ID = @ID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Role", role);
                    cmd.Parameters.AddWithValue("@Address", TextBox2.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            // Redirect back to the Doctor page after editing
            Response.Redirect("worker.aspx");
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Retrieve DoctorID from the query string
            if (Request.QueryString["ID"] != null)
            {
                string id = Request.QueryString["ID"];
                Updateworker(id);
            }
        }
    }
}