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
    public partial class Account : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            string userRole = Session["UserRole"] as string;
            if (userRole != null)
            {
                if (userRole.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                {
                    gridView.Columns[6].Visible = true;
                    gridView.Columns[7].Visible = true;
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // Log the insert operation to the Audit table
                LogAudit("Account", TextBox0.Text.Trim(), "Insert");
                SqlCommand cmd = new SqlCommand("INSERT INTO account (ID, Account_Name, Account_No, Bank_Name, Created_AT, Updated_AT) VALUES (@ID, @Account_Name, @Account_No, @Bank_Name, GETDATE(), GETDATE())", con);
                cmd.Parameters.AddWithValue("@ID", TextBox0.Text.Trim());
                cmd.Parameters.AddWithValue("@Account_Name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Account_No", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Bank_Name", TextBox3.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Account added successfully!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        // Show Data in Grid View
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT ID, Account_Name, Account_No, Bank_Name, Created_AT, Updated_AT FROM account", con))
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
                string id = gridView.DataKeys[rowIndex].Value.ToString();
                Response.Redirect($"edit-account.aspx?ID={id}");
            }
            else if (e.CommandName == "Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
                {
                    string id = gridView.DataKeys[rowIndex].Value.ToString();
                    DeleteAccount(id);
                }
            }
        }
        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
            {
                string id = gridView.DataKeys[rowIndex].Value.ToString();
                DeleteAccount(id);
                BindGridView(); // Refresh the GridView after deletion
            }
        }
        private void DeleteAccount(string id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM account WHERE ID = @ID", con))
                    {
                        cmd.Parameters.AddWithValue("@ID", id);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Doctor deleted successfully!');</script>");
                        // Refresh the GridView after deletion
                        BindGridView();
                        LogAudit("Account", id, "Delete");
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
            // Re-bind the data to the GridView after any operation (add, edit, delete)
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT ID, Account_Name, Account_No, Bank_Name, Created_AT, Updated_AT FROM account", con))
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
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Audit_account (TableName, RecordID, Action, Timestamp) VALUES (@TableName, @RecordID, @Action, GETDATE())", con))
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