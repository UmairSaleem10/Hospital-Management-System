using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace SE_Project
{
    public partial class Edit_Doctor : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve DoctorID from the query string
                if (Request.QueryString["DoctorID"] != null)
                {
                    string doctorID = Request.QueryString["DoctorID"];
                    LoadDoctorData(doctorID);
                }
            }
        }
        private void LoadDoctorData(string doctorID)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT DoctorID, Name, Speciality, Email, Address FROM Doctor WHERE DoctorID = @DoctorID", con))
                {
                    cmd.Parameters.AddWithValue("@DoctorID", doctorID);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        TextBox0.Text = reader["DoctorID"].ToString();
                        TextBox1.Text = reader["Name"].ToString();
                        TextBox2.Text = reader["Speciality"].ToString();
                        TextBox3.Text = reader["Email"].ToString();
                        TextBox4.Text = reader["Address"].ToString();
                    }
                }
            }
        }
        private void UpdateDoctor(string doctorID)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Doctor SET Name = @Name, Speciality = @Speciality, Email = @Email, Address = @Address, Updated_AT = GETDATE() WHERE DoctorID = @DoctorID", con))
                {
                    cmd.Parameters.AddWithValue("@DoctorID", doctorID);
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Speciality", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", TextBox4.Text.Trim());
                    // Log the update operation to the Audit table
                    LogAudit("Doctor", doctorID, "Update");
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // Redirect back to the Doctor page after editing
            Response.Redirect("Doctor.aspx");
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Retrieve DoctorID from the query string
            if (Request.QueryString["DoctorID"] != null)
            {
                string doctorID = Request.QueryString["DoctorID"];
                UpdateDoctor(doctorID);
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