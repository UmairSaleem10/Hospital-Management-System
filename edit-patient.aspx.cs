using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class edit_patient : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDoctors();
                // Retrieve DoctorID from the query string
                if (Request.QueryString["PatientID"] != null)
                {
                    string patientID = Request.QueryString["PatientID"];
                    LoadPatientData(patientID);
                }
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
        private void LoadPatientData(string patientID)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT PatientID, Name, Disease, D_Name, Address, Gender FROM Patient WHERE PatientID = @PatientID", con))
                {
                    cmd.Parameters.AddWithValue("@PatientID", patientID);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        TextBox0.Text = reader["PatientID"].ToString();
                        TextBox1.Text = reader["Name"].ToString();
                        TextBox2.Text = reader["Disease"].ToString();

                        // Set the selected value of the DropDownList based on the doctorName
                        string doctorName = reader["D_Name"].ToString();
                        if (ddlDoctors.Items.FindByValue(doctorName) != null)
                        {
                            ddlDoctors.SelectedValue = doctorName;
                        }
                        TextBox3.Text = reader["Address"].ToString();
                        string gender = reader["Gender"].ToString();
                        if (ddlGender.Items.FindByValue(gender) != null)
                        {
                            ddlGender.SelectedValue = gender;
                        }
                    }
                }
            }
        }
        private void UpdatePatient(string patientID)
        {
            string doctorName = ddlDoctors.SelectedItem.Text;
            string gender = ddlGender.SelectedItem.Text;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Patient SET Name = @Name, Disease = @Disease, D_Name = @D_Name, Address = @Address, Gender = @Gender, Updated_AT = GETDATE() WHERE PatientID = @PatientID", con))
                {
                    cmd.Parameters.AddWithValue("@PatientID", patientID);
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Disease", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@D_Name", doctorName);
                    cmd.Parameters.AddWithValue("@Address", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    // Log the update operation to the Audit table
                    LogAudit("Patient", patientID, "Update");
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            // Redirect back to the Doctor page after editing
            Response.Redirect("Patient-Record.aspx");
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Retrieve DoctorID from the query string
            if (Request.QueryString["PatientID"] != null)
            {
                string patientID = Request.QueryString["PatientID"];
                UpdatePatient(patientID);
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