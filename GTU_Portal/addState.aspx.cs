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
    public partial class addState : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    if (Session["State_id"] == null)
                    {

                    }
                    else
                    {
                        Label1.Text = Session["State_id"].ToString();
                        string query1 = @"select State_name from STATE_MAST where State_id='" + Label1.Text + "'";

                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            SqlCommand cmd1 = new SqlCommand(query1, conn);
                            conn.Open();
                            SqlDataReader reader = cmd1.ExecuteReader();
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    StateTextBox.Text = reader.GetString(0);
                                }
                            }
                            else
                            {
                                StateTextBox.Text = "";
                            }
                        }
                    }

                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
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
                    string query2 = @"update STATE_MAST set State_name='" + StateTextBox.Text + "' where State_id='" + Label1.Text + "'";
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
                    string stateName = StateTextBox.Text;
                    string query = @"insert into STATE_MAST values ('" + stateName + "')";

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
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        } //method end

    } //class end


    //    protected void Page_Load(object sender, EventArgs e)
    //    {

    //    }

    //    protected void Button1_Click(object sender, EventArgs e)
    //    {
    //        string stateName = StateTextBox.Text;
    //        string query = @"insert into STATE_MAST values ('"+stateName+"')";

    //        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
    //        using (SqlConnection conn = new SqlConnection(CS))
    //        {
    //            SqlCommand cmd = new SqlCommand(query, conn);
    //            conn.Open();
    //            int rows = cmd.ExecuteNonQuery();
    //            Label1.Text = rows + " inserted";
    //        }
    //    }


    //}
}