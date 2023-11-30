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
    public partial class Employee : System.Web.UI.Page
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
                    gridView.Columns[6].Visible = true;
                    gridView.Columns[7].Visible = true;
                }
            }
        }
        //Insert Employee Data into Database
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string role = ddlemployee.SelectedItem.Text;
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // Log the insert operation to the Audit table
                LogAudit("Employee", TextBox0.Text.Trim(), "Insert");
                SqlCommand cmd = new SqlCommand("INSERT INTO Employee (Employee_ID, Name, Role, Address, Created_AT, Updated_AT) VALUES (@Employee_ID, @Name, @Role, @Address, GETDATE(), GETDATE())", con);
                cmd.Parameters.AddWithValue("@Employee_ID", TextBox0.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Role", role);
                cmd.Parameters.AddWithValue("@Address", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Employee added successfully!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        // Show Data into Grid
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT Employee_ID, Name, Role, Address, Created_AT, Updated_AT FROM Employee", con))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        // Bind the data to the GridView
                        gridView.DataSource = dt;
                        gridView.DataBind();
                        gridView.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        protected void gridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gridView.Rows[rowIndex];
                //string doctorID = row.Cells[0].Text; // Assuming DoctorID is in the first cell
                string employee_ID = gridView.DataKeys[rowIndex].Value.ToString();
                Response.Redirect($"edit-Employee.aspx?Employee_ID={employee_ID}");
            }
            else if (e.CommandName == "Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
                {
                    string employee_ID = gridView.DataKeys[rowIndex].Value.ToString();
                    DeleteEmployee(employee_ID);
                }
                
            }
        }
        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
            {
                string employee_ID = gridView.DataKeys[rowIndex].Value.ToString();
                DeleteEmployee(employee_ID);
                BindGridView(); // Refresh the GridView after deletion
            } 
        }
        private void DeleteEmployee(string employee_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Employee WHERE Employee_ID = @Employee_ID", con))
                    {
                        cmd.Parameters.AddWithValue("@Employee_ID", employee_ID);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Doctor deleted successfully!');</script>");
                        // Refresh the GridView after deletion
                        BindGridView();
                        LogAudit("Employee", employee_ID, "Delete");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        private void BindGridView()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT Employee_ID, Name, Role, Address, Created_AT, Updated_AT FROM Employee", con))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        // Bind the data to the GridView
                        gridView.DataSource = dt;
                        gridView.DataBind();
                        gridView.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
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