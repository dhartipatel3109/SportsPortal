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
    public partial class addZone : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    if (Session["Zone_id"] == null)
                    {

                    }
                    else
                    {
                        Label1.Text = Session["Zone_id"].ToString();
                        string query1 = @"select Zone_name from ZONE_MAST where Zone_id='" + Label1.Text + "'";

                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            SqlCommand cmd1 = new SqlCommand(query1, conn);
                            conn.Open();
                            SqlDataReader reader = cmd1.ExecuteReader();
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    ZoneTextBox.Text = reader.GetString(0);
                                }
                            }
                            else
                            {
                                ZoneTextBox.Text = "";
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
            if (Label1.Text != "0")
            {
                //update
                string query2 = @"update ZONE_MAST set Zone_name='" + ZoneTextBox.Text + "' where Zone_id='" + Label1.Text + "'";
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
                string zoneName = ZoneTextBox.Text;
                string query = @"insert into ZONE_MAST( Zone_name ) values ('" + zoneName + "')";

                using (SqlConnection conn = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    Label1.Text = rows + " record inserted";
                }
            }
        } //method end

    } //class end


    //    protected void Page_Load(object sender, EventArgs e)
    //    {

    //    }

    //    protected void Button1_Click(object sender, EventArgs e)
    //    {
    //        string zoneName = ZoneTextBox.Text;

    //        string query = @"insert into ZONE_MAST values ('" + zoneName + "')";

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