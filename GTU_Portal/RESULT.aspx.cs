using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace GTU_Portal
{
    public partial class WebForm27 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string q1 = @"select Event_name, Event_id from Event where Event_status = 'yes'";
                    SqlCommand cmd = new SqlCommand(q1, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    EventDropdownList.DataSource = dt;
                    EventDropdownList.DataTextField = "Event_name";
                    EventDropdownList.DataValueField = "Event_id";
                    EventDropdownList.DataBind();

                    EventDropdownList.Items.Insert(0, new ListItem("--Select Game--", "--Select Game--"));
                }
            }
        }
       
        protected void EventDropdownList_SelectedIndexChanged1(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(CS))
            {
                conn.Open();
                string q1 = @"select gm.Game_name, egd.Game_id from GAME_MAST gm
                            join Event_Game_Detail_Extra egd on egd.Game_id = gm.Game_id
                            where egd.Event_id = '" + EventDropdownList.SelectedValue + "'";

                SqlCommand cmd = new SqlCommand(q1, conn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                GameDropdownList.DataSource = dt;
                GameDropdownList.DataTextField = "Game_name";
                GameDropdownList.DataValueField = "Game_id";
                GameDropdownList.DataBind();

                GameDropdownList.Items.Insert(0, new ListItem("--Select Game--", "--Select Game--"));
                conn.Close();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
        protected void search_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(CS))
            {
                conn.Open();
                string q1 = @"select distinct evt.Event_name, gm.Game_name, egd.Game_date,egd.Event_type,cr.cr_no,stu.Student_id,stu.Student_name,stu.Student_mobile,stu.Student_email  from Event_Game_Assign_student egas
                            join Event_Game_Assign ega on ega.Ega_id = egas.Ega_id
                            join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                            join Event evt on evt.Event_id = egd.Event_id
                            join GAME_MAST gm on gm.Game_id = egd.Game_id
                            join STUDENT_MAST stu on stu.Student_id = egas.Student_id
                            join Certificate cr on cr.Ega_id = ega.Ega_id
                             where evt.Event_id = '" + EventDropdownList.SelectedValue + "' and gm.Game_id = '" + GameDropdownList.SelectedValue + "' and egd.Gender = '" + GenderDropdownList.SelectedValue + "'";

                SqlCommand cmd = new SqlCommand(q1, conn);

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();

                conn.Close();
            }
        }
}
}