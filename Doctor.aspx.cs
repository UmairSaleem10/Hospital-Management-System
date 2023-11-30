using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace SE_Project
{
    public partial class Doctor : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        // Restriction User can't add doctor
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
                    gridView.Columns[7].Visible = true;
                    gridView.Columns[8].Visible = true;
                }
            }
        }

        // Insert data in Doctor table
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
                LogAudit("Doctor", TextBox0.Text.Trim(), "Insert");
                SqlCommand cmd = new SqlCommand("INSERT INTO Doctor (DoctorID, Name, Speciality, Email, Address, Created_AT, Updated_AT) VALUES (@DoctorID, @Name, @Speciality, @Email, @Address, GETDATE(), GETDATE())", con);
                cmd.Parameters.AddWithValue("@DoctorID", TextBox0.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Speciality", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", TextBox4.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Doctor added successfully!');</script>");
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
                    using (SqlCommand cmd = new SqlCommand("SELECT DoctorID, Name, Speciality, Email, Address, Created_AT, Updated_AT FROM Doctor", con))
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
                string doctorID = gridView.DataKeys[rowIndex].Value.ToString();
                Response.Redirect($"Edit-Doctor.aspx?DoctorID={doctorID}");
            }
            else if (e.CommandName == "Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
                {
                    string doctorID = gridView.DataKeys[rowIndex].Value.ToString();
                    DeleteDoctor(doctorID);
                }
            }
        }
        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
            {
                string doctorID = gridView.DataKeys[rowIndex].Value.ToString();
                DeleteDoctor(doctorID);
                BindGridView(); // Refresh the GridView after deletion
            }
        }
        private void DeleteDoctor(string doctorID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Doctor WHERE DoctorID = @DoctorID", con))
                    {
                        cmd.Parameters.AddWithValue("@DoctorID", doctorID);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Doctor deleted successfully!');</script>");
                        // Refresh the GridView after deletion
                        BindGridView();
                        LogAudit("Doctor", doctorID, "Delete");
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
                    using (SqlCommand cmd = new SqlCommand("SELECT DoctorID, Name, Speciality, Email, Address, Created_AT, Updated_AT FROM Doctor", con))
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
        private void LogAudit(string tableName, string ID, string action)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Audit_doctor (TableName, DoctorID, Action, Timestamp) VALUES (@TableName, @DoctorID, @Action, GETDATE())", con))
                    {
                        cmd.Parameters.AddWithValue("@TableName", tableName);
                        cmd.Parameters.AddWithValue("@DoctorID", ID);
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
