using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class edit_manager : System.Web.UI.Page
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
                    LoadManagerData(id);
                }
            }
        }
        private void LoadManagerData(string id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ID, Name, Email, Role, Address FROM Manager WHERE ID = @ID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        TextBox0.Text = reader["ID"].ToString();
                        TextBox1.Text = reader["Name"].ToString();
                        TextBox2.Text = reader["Email"].ToString();

                        // Set the selected value of the DropDownList based on the role
                        string role = reader["Role"].ToString();
                        if (ddlmanager.Items.FindByValue(role) != null)
                        {
                            ddlmanager.SelectedValue = role;
                        }

                        TextBox3.Text = reader["Address"].ToString();
                    }
                }
            }
        }
        private void UpdateManager(string id)
        {
            string role = ddlmanager.SelectedItem.Text;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Manager SET Name = @Name, Email = @Email, Role = @Role, Address = @Address, Updated_AT = GETDATE() WHERE ID = @ID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Role", role);
                    cmd.Parameters.AddWithValue("@Address", TextBox3.Text.Trim());
                    LogAudit("Manager", id, "Update");
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            // Redirect back to the Doctor page after editing
            Response.Redirect("Manager.aspx");
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Retrieve DoctorID from the query string
            if (Request.QueryString["ID"] != null)
            {
                string id = Request.QueryString["ID"];
                UpdateManager(id);
            }
        }
        private void LogAudit(string tableName, string recordID, string action)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Audit_manager (TableName, RecordID, Action, Timestamp) VALUES (@TableName, @RecordID, @Action, GETDATE())", con))
                    {
                        cmd.Parameters.AddWithValue("@TableName", tableName);
                        cmd.Parameters.AddWithValue("@RecordID", recordID);
                        cmd.Parameters.AddWithValue("@Action", action);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error or handle it appropriately
                Response.Write("<script>alert('Error in LogAudit: " + ex.Message + "');</script>");
            }
        }
    }
}