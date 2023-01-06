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
    public partial class WebForm8 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        SqlCommand cmd = null;
        int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = @"select top 1 * from ABOUT_US order by Ab_id desc";
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
                            description.Text = reader.GetString(1);
                        }
                    }
                    else
                    {
                        description.Text = "";
                    }
                }
            }
        }
    }
}