using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace GTU_Portal
{
    public partial class addBranch1 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    if (Session["Branch_id"] == null)
                    {

                    }
                    else
                    {
                        Label1.Text = Session["Branch_id"].ToString();
                        string query1 = @"select Branch_name from BRANCH_MAST where Branch_id='" + Label1.Text + "'";

                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            SqlCommand cmd1 = new SqlCommand(query1, conn);
                            conn.Open();
                            SqlDataReader reader = cmd1.ExecuteReader();
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    BranchTextBox.Text = reader.GetString(0);
                                }
                            }
                            else
                            {
                                BranchTextBox.Text = "";
                            }
                        }
                    }

                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
        } //method end

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Label1.Text != "0")
                {
                    //update
                    string query2 = @"update BRANCH_MAST set Branch_name='" + BranchTextBox.Text + "' where Branch_id='" + Label1.Text + "'";
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand(query2, conn);
                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();
                        Label1.Text = rows + " record updated";
                    }
                }
                else
                {
                    //insert
                    string branchName = BranchTextBox.Text;
                    string query = @"insert into BRANCH_MAST values ('" + branchName + "')";

                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand(query, conn);
                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();
                        Label1.Text = rows + " record inserted";
                    }
                }
            }
            catch (Exception)
            {
               // Response.Redirect("ErrorPage.aspx");
                throw;
            }
        } //method end

    } //class end
}