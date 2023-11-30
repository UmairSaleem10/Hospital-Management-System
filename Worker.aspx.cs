using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class Worker : System.Web.UI.Page
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
        //insertion of worker data
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string role = ddlworker.SelectedItem.Text;
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    // Log the insert operation to the Audit table
                    LogAudit("Worker", TextBox0.Text.Trim(), "Insert");
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO worker (ID, Name, Role, Address, Created_At,Updated_At) VALUES (@ID, @Name, @Role, @Address, GETDATE(), GETDATE())", con))
                    {
                        cmd.Parameters.AddWithValue("@ID", TextBox0.Text);
                        cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                        cmd.Parameters.AddWithValue("@Role", role);
                        cmd.Parameters.AddWithValue("@Address", TextBox2.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Write("<script>alert('Details saved successfully!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT ID, Name, Role, Address, Created_AT, Updated_AT FROM worker", con))
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
                string id = gridView.DataKeys[rowIndex].Value.ToString();
                Response.Redirect($"edit-worker.aspx?ID={id}");
            }
            else if (e.CommandName == "Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
                {
                    string id = gridView.DataKeys[rowIndex].Value.ToString();
                    DeleteWorker(id);
                }
            }
        }
        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
            {
                string id = gridView.DataKeys[rowIndex].Value.ToString();
                DeleteWorker(id);
                BindGridView(); // Refresh the GridView after deletion
            }
        }
        private void DeleteWorker(string id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM worker WHERE ID = @ID", con))
                    {
                        cmd.Parameters.AddWithValue("@ID", id);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Patient deleted successfully!');</script>");
                        // Refresh the GridView after deletion
                        BindGridView();
                        LogAudit("Worker", id, "Delete");
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
                    using (SqlCommand cmd = new SqlCommand("SELECT ID, Name, Role, Address, Created_AT, Updated_AT FROM worker", con))
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
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Audit_worker (TableName, RecordID, Action, Timestamp) VALUES (@TableName, @RecordID, @Action, GETDATE())", con))
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