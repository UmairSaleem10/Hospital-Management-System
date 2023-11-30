using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class edit_Employee : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve DoctorID from the query string
                if (Request.QueryString["Employee_ID"] != null)
                {
                    string employee_ID = Request.QueryString["Employee_ID"];
                    LoadEmployeeData(employee_ID);
                }
            }
        }
        private void LoadEmployeeData(string employee_ID)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Employee_ID, Name, Role, Address FROM Employee WHERE Employee_ID = @Employee_ID", con))
                {
                    cmd.Parameters.AddWithValue("@Employee_ID", employee_ID);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        TextBox0.Text = reader["Employee_ID"].ToString();
                        TextBox1.Text = reader["Name"].ToString();

                        // Set the selected value of the DropDownList based on the role
                        string role = reader["Role"].ToString();
                        if (ddlemployee.Items.FindByValue(role) != null)
                        {
                            ddlemployee.SelectedValue = role;
                        }

                        TextBox2.Text = reader["Address"].ToString();
                    }
                }
            }
        }
        private void UpdateEmployee(string employee_ID)
        {
            string role = ddlemployee.SelectedItem.Text;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Employee SET Employee_ID = @Employee_ID, Name = @Name, Role = @Role, Address = @Address, Updated_AT = GETDATE() WHERE Employee_ID = @Employee_ID", con))
                {
                    cmd.Parameters.AddWithValue("@Employee_ID", employee_ID);
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Role", role);
                    cmd.Parameters.AddWithValue("@Address", TextBox2.Text.Trim());
                    LogAudit("Worker", employee_ID, "Update");
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Employee edited successfully!');</script>");
                }
            }
            // Redirect back to the Doctor page after editing
            Response.Redirect("Employee.aspx");
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Retrieve DoctorID from the query string
            if (Request.QueryString["Employee_ID"] != null)
            {
                string employee_ID = Request.QueryString["Employee_ID"];
                UpdateEmployee(employee_ID);
                Response.Write("<script>alert('Employee edited successfully!');</script>");
            }
        }
        private void LogAudit(string tableName, string recordID, string action)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Audit_employee (TableName, RecordID, Action, Timestamp) VALUES (@TableName, @RecordID, @Action, GETDATE())", con))
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