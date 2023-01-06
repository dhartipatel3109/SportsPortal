using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GTU_Portal
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {

            using (SqlConnection cn = new SqlConnection(CS))
            {
                string q = @"Update Event_Game_Assign_student set Win_Level = '1' where Team_id = '" + Winner.Text + "' ";
                SqlCommand cmd = new SqlCommand(q, cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }

            using (SqlConnection cn = new SqlConnection(CS))
            {
                string q = @"Update Event_Game_Assign_student set Win_Level = '2' where Team_id = '" + Fstrunner.Text + "' ";
                SqlCommand cmd = new SqlCommand(q, cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }

            using (SqlConnection cn = new SqlConnection(CS))
            {
                string q = @"Update Event_Game_Assign_student set Win_Level = '3' where Team_id = '" + Sndrunner.Text + "' ";
                SqlCommand cmd = new SqlCommand(q, cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }

            using (SqlConnection cn = new SqlConnection(CS))
            {
                string q = @"UPDATE A
                                SET Result_Status = 'yes'
                                FROM Event_Game_Assign A
                                JOIN Event_Game_Assign_student B
                                ON A.Ega_id = B.Ega_id
                                WHERE Team_id = '" + Winner.Text + "' ";
                SqlCommand cmd = new SqlCommand(q, cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }

            //Response.Redirect("Certificate.aspx?WinnerName=" + Winner.Text + "&1st=" + Fstrunner.Text + "&2nd=" + Sndrunner.Text );

        }
    }
}