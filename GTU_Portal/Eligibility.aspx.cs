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
    public partial class WebForm13 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        conn.Open();
                        string query1 = @"select distinct evnt.Event_name,egd.Event_id from Event_Game_Detail_Extra egd
                                        join Event evnt on evnt.Event_id = egd.Event_id
                                        where evnt.Event_status = 'yes'";
                        SqlCommand cmd = new SqlCommand(query1, conn);
                        SqlDataAdapter adp = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adp.Fill(dt);

                        EventDropDownList.DataSource = dt;
                        EventDropDownList.DataTextField = "Event_name";
                        EventDropDownList.DataValueField = "Event_id";
                        EventDropDownList.DataBind();

                        EventDropDownList.Items.Insert(0, new ListItem("--Select Event--", "--Select Event--"));
                    }

                    string query = @"select ega.Ega_id, evnt.Event_name, egd.Game_date, game.Game_name, egd.Gender, egd.Event_type, zone.Zone_name, clg.C_name from Event_Game_Assign ega
                                join Event_Game_Detail_Extra egd on ega.Egd_id = egd.Egd_id
                                join Event evnt on evnt.Event_id = egd.Event_id
                                join GAME_MAST game on game.Game_id = egd.Game_id
                                join ZONE_MAST zone on zone.Zone_id = ega.Zone_id
                                join COLLEGE_MAST clg on clg.C_id = ega.C_id
                                where evnt.Event_status = 'yes'";

                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        //SqlCommand cmd = new SqlCommand(query, conn);
                        conn.Open();
                        SqlDataAdapter da = new SqlDataAdapter(query, conn);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        GridView1.DataSourceID = null;
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }

        protected void EventDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string query = @"select ega.Ega_id, evnt.Event_name, egd.Game_date, game.Game_name, egd.Gender, egd.Event_type, zone.Zone_name, clg.C_name from Event_Game_Assign ega
                                join Event_Game_Detail_Extra egd on ega.Egd_id = egd.Egd_id
                                join Event evnt on evnt.Event_id = egd.Event_id
                                join GAME_MAST game on game.Game_id = egd.Game_id
                                join ZONE_MAST zone on zone.Zone_id = ega.Zone_id
                                join COLLEGE_MAST clg on clg.C_id = ega.C_id
                                where evnt.Event_status = 'yes' and ";

                string extra = EventDropDownList.SelectedItem.ToString();
                if (extra != "")
                {
                    //var id = EventDropDownList.SelectedValue;
                    query += "evnt.Event_name like '%" + extra + "%' or ";
                }
                query += " 1!=1";

                string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    //SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    GridView1.DataSourceID = null;
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rows;
            rows = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "StudentData")
            {               
                Session["Eli_id"] = rows;
                Response.Redirect("~/StudentRecord.aspx");
            }
        }
    }
}