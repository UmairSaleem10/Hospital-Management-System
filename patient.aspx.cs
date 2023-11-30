using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class patient : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDoctors();
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string doctorName = ddlDoctors.SelectedItem.Text;
                string gender = ddlGender.SelectedItem.Text;
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    // Log the insert operation to the Audit table
                    LogAudit("Doctor", TextBox0.Text.Trim(), "Insert");
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