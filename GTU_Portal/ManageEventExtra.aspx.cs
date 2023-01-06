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
    public partial class ManageEventExtra : System.Web.UI.Page
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
                                    Join ZONE_MAST z on z.Zone_id = ega.Zone_id where evt.Event_status = 'yes' and ega.C_id = '" + Session["C_id"] + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                conn.Close();
                // ("Manage.aspx?Event_if")
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rows;
            rows = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "StudentData")
            {
                Session["Ega_id"] = rows;
                Response.Redirect("~/ObserveStudentData.aspx");
            }

            else if (e.CommandName == "UploadCertificates")
            {
                Session["Ega_id"] = rows;
                Response.Redirect("~/UploadCertificateExtra.aspx");
            }

             //(e.CommandName == ""UploadResult"")
            else
            {
                Session["Ega_id"] = rows;
                Response.Redirect("~/UploadResult.aspx");
            }
        }



    }
}