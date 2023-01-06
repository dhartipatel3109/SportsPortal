using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace GTU_Portal
{
    public partial class aboutUs : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        SqlCommand cmd = null;

        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    string query = @"select * from ABOUT_US ";
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        cmd = new SqlCommand(query, conn);
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                id = reader.GetInt32(0);
                                TextArea.Text = reader.GetString(1);
                            }
                        }
                        else
                        {
                            TextArea.Text = "";
                        }
                    }
                    ViewState["desc"] = TextArea.Text;
                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void AboutUsButton_Click(object sender, EventArgs e)
        {
            try
            {
                string desc = TextArea.Text;
                //Response.Write("<script>alert('" + TextArea.Text + "')</script>");
                if (ViewState["desc"] != "")
                {
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        string query = @"update ABOUT_US set Ab_desc='" + desc + "' where Ab_id = " + 1;
                        cmd = new SqlCommand(query, conn);
                        conn.Open();
                        int row = cmd.ExecuteNonQuery();
                    }
                }
                else
                {
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        string query = @"insert into ABOUT_US (Ab_desc) values ('" + desc + "')";
                        cmd = new SqlCommand(query, conn);
                        conn.Open();
                        int row = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

    }// end class

}