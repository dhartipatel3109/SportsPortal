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

    public partial class ManageEvent : System.Web.UI.Page
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

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    //using (SqlConnection conn = new SqlConnection(CS))
        //    //{
        //    //    using (SqlCommand cmd = new SqlCommand("Select game.Game_name,evt.Event_id, evt.Event_Name, z.Zone_Name, egd.Game_date From Event_Game_Assign ega Join Event_Game_Detail_Extra egd on ega.Egd_id = egd.Egd_id Join GAME_MAST game on game.Game_id = egd.Game_id Join Event evt on evt.Event_id = egd.Event_id Join ZONE_MAST z on z.Zone_id = ega.Zone_id", conn))
        //    //    {
        //    //        conn.Open();
        //    //        using (SqlDataReader reader = cmd.ExecuteReader())
        //    //        {
        //    //            if (reader.HasRows)
        //    //            {
        //    //                while (reader.Read())
        //    //                {
        //    //                    Event_id = reader.GetInt32(0);
        //    //                    Session["Event_id"] = Event_id;
        //    //                }
        //    //            }

        //    //        }
        //    //    }
        //    //}


        //    try
        //    {
        //        int ccc = int.Parse(e.CommandArgument.ToString());
        //        if (e.CommandName == "StudentData")
        //        {
        //            Session["Event_id"] = ccc;
        //            Response.Redirect("StudentData.aspx");
        //        }
        //        //if (e.CommandName == "delete")
        //        //{
        //        //    Session["Event_id"] = ccc;
        //        //    int id = Convert.ToInt32(Session["Event_id"].ToString());
        //        //    string query = @"delete from BRANCH_MAST where Branch_id=" + id;
        //        //    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
        //        //    {
        //        //        conn.Open();
        //        //        cmd = new SqlCommand(query, conn);
        //        //        cmd.ExecuteNonQuery();
        //        //    }

        //        //    Response.Redirect("Branch.aspx");
        //        //}
        //    }
        //    catch (Exception)
        //    {
        //        Response.Redirect("ErrorPage.aspx");
        //        throw;
        //    }
        //}      
       
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rows;            
            rows = Convert.ToInt32(e.CommandArgument.ToString());
            
            if (e.CommandName == "StudentData")
            {
                Session["Ega_id"] = rows;
                Response.Redirect("~/StudentData.aspx");
            }

            else if (e.CommandName == "UploadCertificates")
            {
                Session["Ega_id"] = rows;
                Response.Redirect("~/UploadCertificate.aspx");
            }

             //(e.CommandName == ""UploadResult"")
            else
            {
                Session["Ega_id"] = rows;
                Response.Redirect("~/UploadResult.aspx");
            }
        }

        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        string status = e.Row.Cells[3].Text;
        //        Button btn = (Button)e.Row.Cells[6].FindControl("StudentDataButton");

        //        //Button StatusButton = (Button)e.Row.Cells[4].FindControl("StatusButton");                

        //        //if (status == "no")
        //        //{
        //        //    btn.Enabled = false;
        //        //    btn.Visible = false;
        //        //    StatusButton.Visible = false;
        //        //    btn.Style.Add("background-color", "red");
        //        //}
        //        //else
        //        //{
        //        //    StatusButton.Visible = true;
        //        //    btn.Enabled = true;
        //        //    btn.Style.Add("background-color", "green");
        //        //}
        //    }
        //}
    }
}