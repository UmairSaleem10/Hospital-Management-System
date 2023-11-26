using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class med_edit : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve DoctorID from the query string
                if (Request.QueryString["MedicineID"] != null)
                {
                    string medicineID = Request.QueryString["MedicineID"];
                    LoadMedicineData(medicineID);
                }
            }
        }
        private void LoadMedicineData(string medicineID)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT MedicineID, PatientID, Medicine_Name, Description, Price, Stock FROM Medicine WHERE MedicineID = @MedicineID", con))
                {
                    cmd.Parameters.AddWithValue("@MedicineID", medicineID);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        TextBox0.Text = reader["MedicineID"].ToString();
                        TextBox1.Text = reader["PatientID"].ToString();
                        TextBox2.Text = reader["Medicine_Name"].ToString();
                        TextBox3.Text = reader["Description"].ToString();
                        TextBox4.Text = reader["Price"].ToString();
                        TextBox5.Text = reader["Stock"].ToString();
                    }
                }
            }
        }

        private void UpdateMedicine(string medicineID)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Medicine SET MedicineID = @MedicineID, PatientID = @PatientID, Medicine_Name = @Medicine_Name, Description = @Description, Price = @Price, Stock = @Stock,  Updated_AT = GETDATE() WHERE MedicineID = @MedicineID", con))
                {
                    cmd.Parameters.AddWithValue("@MedicineID", TextBox0.Text.Trim());
                    cmd.Parameters.AddWithValue("@PatientID", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Medicine_Name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Price", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Stock", TextBox5.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // Redirect back to the Doctor page after editing
            Response.Redirect("Medicines.aspx");
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Retrieve DoctorID from the query string
            if (Request.QueryString["MedicineID"] != null)
            {
                string medicineID = Request.QueryString["MedicineID"];
                UpdateMedicine(medicineID);
            }
        }
    }
}