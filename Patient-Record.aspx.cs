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
    public partial class Patient_Record : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDoctors();
            }
            string userRole = Session["UserRole"] as string;
            if (userRole != null)
            {
                if (userRole.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                {
                    adminContent.Visible = true;
                    gridView.Columns[8].Visible = true;
                    gridView.Columns[9].Visible = true;
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT PatientID, Name, Disease, D_Name, Address, Gender, Created_AT, Updated_AT FROM Patient", con))
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
        private void LoadDoctors()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT Name FROM Doctor", con))
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            ddlDoctors.DataSource = reader;
                            ddlDoctors.DataTextField = "Name";
                            ddlDoctors.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string doctorName = ddlDoctors.SelectedItem.Text;
                string gender = ddlGender.SelectedItem.Text;
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    // Log the insert operation to the Audit table
                    LogAudit("Patient", TextBox0.Text.Trim(), "Insert");
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Patient (PatientID, Name, Disease, D_Name, Address, Gender, Created_At,Updated_At) VALUES (@PatientID, @Name, @Disease, @D_Name, @Address, @Gender, GETDATE(), GETDATE())", con))
                    {
                        cmd.Parameters.AddWithValue("@PatientID", TextBox0.Text);
                        cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                        cmd.Parameters.AddWithValue("@Disease", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@D_Name", doctorName);
                        cmd.Parameters.AddWithValue("@Address", TextBox3.Text);
                        cmd.Parameters.AddWithValue("@Gender", gender);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Write("<script>alert('Patients saved successfully!');</script>");
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
                string patientID = gridView.DataKeys[rowIndex].Value.ToString();
                Response.Redirect($"edit-patient.aspx?PatientID={patientID}");
            }
            else if (e.CommandName == "Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
                {
                    string patientID = gridView.DataKeys[rowIndex].Value.ToString();
                    DeletePatient(patientID);
                }
            }
        }
        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
            {
                string patientID = gridView.DataKeys[rowIndex].Value.ToString();
                DeletePatient(patientID);
                BindGridView(); // Refresh the GridView after deletion
            }
        }
        private void DeletePatient(string patientID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Patient WHERE PatientID = @PatientID", con))
                    {
                        cmd.Parameters.AddWithValue("@PatientID", patientID);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Patient deleted successfully!');</script>");
                        // Refresh the GridView after deletion
                        BindGridView();
                        LogAudit("Patient", patientID, "Delete");
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
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Audit_patient (TableName, RecordID, Action, Timestamp) VALUES (@TableName, @RecordID, @Action, GETDATE())", con))
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