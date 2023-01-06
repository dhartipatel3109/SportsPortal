using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Data;

namespace GTU_Portal
{
    public partial class WebForm25 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
        }

        protected void Display()
        {
            using (SqlConnection conn = new SqlConnection(CS))
            {
                conn.Open();
                string query = @" Select ega.Ega_id, evt.Event_id, egd.Event_type, game.Game_name, evt.Event_Name, z.Zone_Name, egd.Game_date, egd.Gender
                                    From Event_Game_Assign ega
                                    Join Event_Game_Detail_Extra egd on ega.Egd_id = egd.Egd_id
                                    Join GAME_MAST game on game.Game_id = egd.Game_id 
                                    Join Event evt on evt.Event_id = egd.Event_id
                                    Join ZONE_MAST z on z.Zone_id = ega.Zone_id where evt.Event_status = 'yes'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                conn.Close();
            }
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int rows;
            rows = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "StudentData")
            {
                Session["Ega_id"] = rows;
                Response.Redirect("~/Result2_1.aspx");
            }
        }

        //        protected void EventDropdownList_SelectedIndexChanged(object sender, EventArgs e)
        //        {
        //            using (SqlConnection conn = new SqlConnection(CS))
        //            {
        //                conn.Open();
        //                string q1 = @"select gm.Game_name, egd.Game_id from GAME_MAST gm
        //                            join Event_Game_Detail_Extra egd on egd.Game_id = gm.Game_id
        //                            where egd.Event_id = '" + EventDropdownList.SelectedValue + "'";

        //                SqlCommand cmd = new SqlCommand(q1, conn);
        //                SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //                DataTable dt = new DataTable();
        //                adp.Fill(dt);

        //                GameDropdownList.DataSource = dt;
        //                GameDropdownList.DataTextField = "Game_name";
        //                GameDropdownList.DataValueField = "Game_id";
        //                GameDropdownList.DataBind();
        //            }
        //        }
}
}