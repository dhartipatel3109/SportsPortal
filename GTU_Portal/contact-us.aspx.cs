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
    public partial class contact_us : System.Web.UI.Page
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
                    string query = @"select * from MISSION_STATEMENT ";
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
                                // desc1.Text = reader.GetString(1);
                                // desc2.Text = reader.GetString(2);
                            }
                        }
                        else
                        {
                            // desc2.Text = "";
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
    }
}