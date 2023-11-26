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
    public partial class Medicines : System.Web.UI.Page
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
                    gridView.Columns[8].Visible = true;
                    gridView.Columns[9].Visible = true;
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Medicine (MedicineID, PatientID, Medicine_Name, Description, Price, Stock, Created_At,Updated_At) VALUES (@MedicineID, @PatientID, @Medicine_Name, @Description, @Price, @Stock, GETDATE(), GETDATE())", con);
                cmd.Parameters.AddWithValue("@MedicineID", TextBox0.Text.Trim());
                cmd.Parameters.AddWithValue("@PatientID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Medicine_Name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Description", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Stock", TextBox5.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Medicine added successfully!');</script>");
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
                    using (SqlCommand cmd = new SqlCommand("SELECT MedicineID, PatientID, Medicine_Name, Description, Price, Stock, Created_At,Updated_At FROM Medicine", con))
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
                string medicineID = gridView.DataKeys[rowIndex].Value.ToString();
                Response.Redirect($"med-edit.aspx?MedicineID={medicineID}");
            }
            else if (e.CommandName == "Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
                {
                    string medicineID = gridView.DataKeys[rowIndex].Value.ToString();
                    DeleteMedicine(medicineID);
                }
            }
        }
        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex >= 0 && rowIndex < gridView.Rows.Count)
            {
                string medicineID = gridView.DataKeys[rowIndex].Value.ToString();
                DeleteMedicine(medicineID);
                BindGridView(); // Refresh the GridView after deletion
            }
        }
        private void DeleteMedicine(string medicineID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Medicine WHERE MedicineID = @MedicineID", con))
                    {
                        cmd.Parameters.AddWithValue("@MedicineID", medicineID);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Medicine deleted successfully!');</script>");
                        // Refresh the GridView after deletion
                        BindGridView();
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
                    using (SqlCommand cmd = new SqlCommand("SELECT MedicineID, PatientID, Medicine_Name, Description, Price, Stock, Created_At,Updated_At FROM Medicine", con))
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
    }
}