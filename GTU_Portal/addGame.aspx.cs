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
    public partial class addGame : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Game_id"] == null)
                {

                }
                else
                {
                    Label1.Text = Session["Game_id"].ToString();
                    string query1 = @"select Game_name from GAME_MAST where Game_id='" + Label1.Text + "'";
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        SqlCommand cmd1 = new SqlCommand(query1, conn);
                        conn.Open();
                        SqlDataReader reader = cmd1.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                GameTextBox.Text = reader.GetString(0);
                            }
                        }
                        else
                        {
                            GameTextBox.Text = "";
                        }
                    }
                }

            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Label1.Text != "0")
                {
                    //update
                    //Response.Write("<script>alert('" + GameTextBox.Text + "')</script>");
                    string query2 = @"update GAME_MAST set Game_name='" + GameTextBox.Text + "' where Game_id='" + Label1.Text + "'";
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
                    string gameName = GameTextBox.Text;
                    string query = @"insert into GAME_MAST values ('" + gameName + "')";

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
        }
    }
}