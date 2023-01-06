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
    public partial class addEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('" + DateTime.Now.ToLocalTime() + "')</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string eventName = AddEventTextBox.Text;
                //DateTime Date_Time = DateTime.Now.Date;
                //string query = @"insert into Event (Event_name, Enter_date) values ('" + eventName + "', '" + Date_Time + "');";

                Session["Event_date"] = DateTime.Now.ToLocalTime();

                string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand(@"insert into Event (Event_name, Event_date, Event_status) values ('" + eventName + "', '" + DateTime.Now.ToLocalTime() + "','yes')", conn);
                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    Label1.Text = rows + " record inserted";
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