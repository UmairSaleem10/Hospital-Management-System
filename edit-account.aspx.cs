using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project
{
    public partial class edit_account : System.Web.UI.Page
    {
        string strcon = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve ID from the query string
                if (Request.QueryString["ID"] != null)
                {
                    string id = Request.QueryString["ID"];
                    LoadAccountData(id);
                }
            }
        }
        private void LoadAccountData(string id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ID, Account_Name, Account_No, Bank_Name FROM account WHERE ID = @ID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        TextBox0.Text = reader["ID"].ToString();
                        TextBox1.Text = reader["Account_Name"].ToString();
                        TextBox2.Text = reader["Account_No"].ToString();
                        TextBox3.Text = reader["Bank_Name"].ToString();
                    }
                }
            }
        }
        private void UpdateEmployee(string id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE account SET ID = @ID, Account_Name = @Account_Name, Account_No = @Account_No, Bank_Name = @Bank_Name, Updated_AT = GETDATE() WHERE ID = @ID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.Parameters.AddWithValue("@Account_Name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Account_No", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Bank_Name", TextBox3.Text.Trim());
                    // Log the update operation to the Audit table
                    LogAudit("Account", id, "Update");
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Account edited successfully!');</script>");
                }
            }
            // Redirect back to the Doctor page after editing
            Response.Redirect("account.aspx");
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Retrieve DoctorID from the query string
            if (Request.QueryString["ID"] != null)
            {
                string id= Request.QueryString["ID"];
                UpdateEmployee(id);
                Response.Write("<script>alert('Employee edited successfully!');</script>");
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