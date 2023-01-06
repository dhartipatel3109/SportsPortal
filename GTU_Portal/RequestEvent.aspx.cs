using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;

namespace GTU_Portal
{
    public partial class RequestEvent : System.Web.UI.Page
    {
        private static int LOI;
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    string query = @"select distinct evnt.Event_name, game.Game_name, egd.Gender, egd.Game_date, egd.Event_type from EVent_Game_Detail_Extra egd
                                   join Event evnt on evnt.Event_id = egd.Event_id
                                   join GAME_MAST game on game.Game_id = egd.Game_id
                                    where evnt.Event_status = 'yes'";

                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        SqlCommand cmd1 = new SqlCommand(query, conn);
                        conn.Open();

                        DataTable dt1 = new DataTable();
                        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                        da1.Fill(dt1);

                        GridView1.DataSource = dt1;
                        GridView1.DataBind();
                    }

                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        conn.Open();
                        string query2 = @"truncate table Temp";
                        SqlCommand sc2 = new SqlCommand(query2, conn);
                        DataTable dt2 = new DataTable();
                        SqlDataAdapter da2 = new SqlDataAdapter(sc2);
                        da2.Fill(dt2);
                        GridView3.DataSource = dt2;
                        GridView3.DataBind();
                    }
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }

            //int eventID = 0, gameID = 0, gender = 0;
            if (Session["C_id"] == null)
            {

            }
            else
            {
                //string query1="select evnt.Event_id, evnt.Event_name from Event_Game_Detail_Extra egd join Event evnt on evnt.Event_id = egd.Event_id";
                //DropDownList1.DataSource = dt1;
                //DropDownList1.DataTextField = "Event_name";
                //DropDownList1.DataValueField = "Event_id";
                //DropDownList1.DataBind();
                //else
                //{
                //    Label1.Text = "Incorrect username or password";

                //}
                //con.Close();++

                //string query1="select game.Game_id as Game from Event_Game_Detail_Extra egd join GAME_MAST game on game.Game_id = egd.Game_id where ";
                //GameDropDownList.DataSource = ;
                //GameDropDownList.DataTextField = "supplier_name";
                //GameDropDownList.DataValueField = "sr_no";
                //GameDropDownList.DataBind();
            }
        }


        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    ModalPopupExtender10.Show();
        //}

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["ctrls"] = Print;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=800px,width=800px,scrollbars=1');</script>");

        }

        //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //string query1 = "select distinct egd.Game_id,game.Game_name from Event_Game_Detail_Extra egd join GAME_MAST game on game.Game_id = egd.Game_id where egd.Egd_id = "+DropDownList1.SelectedValue;
        //using (SqlConnection con = new SqlConnection(CS))
        //{
        //    SqlCommand sc1 = new SqlCommand(query1, con);
        //    sc1.ExecuteNonQuery();
        //    DataTable dt1 = new DataTable();
        //    SqlDataAdapter da1 = new SqlDataAdapter(sc1);
        //    da1.Fill(dt1);
        //    //string query1="select evnt.Event_name from Event_Game_Detail_Extra egd join Event evnt on evnt.Event_id = egd.Event_id";

        //    GameDropDownList.DataSource = dt1;
        //    GameDropDownList.DataTextField = "Game_name";
        //    GameDropDownList.DataValueField = "Game_id";
        //    GameDropDownList.DataBind();
        //}
        //  }

        // protected void GameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        // {
        //string query1 = "select  egd.Gender from Event_Game_Detail_Extra egd  where egd.Game_id = "+GameDropDownList.SelectedValue;
        //string query2 = "select  egd.Event_type from Event_Game_Detail_Extra egd  where egd.Game_id = " + GameDropDownList.SelectedValue;
        //using (SqlConnection con = new SqlConnection(CS))
        //{
        //    SqlCommand sc1 = new SqlCommand(query1, con);
        //    SqlCommand sc2 = new SqlCommand(query2, con);

        //    //sc1.ExecuteNonQuery();
        //    DataTable dt1 = new DataTable();
        //    DataTable dt2 = new DataTable();

        //    SqlDataAdapter da1 = new SqlDataAdapter(sc1);
        //    SqlDataAdapter da2 = new SqlDataAdapter(sc2);

        //    da1.Fill(dt1);
        //    da2.Fill(dt2);
        //    //string query1="select evnt.Event_name from Event_Game_Detail_Extra egd join Event evnt on evnt.Event_id = egd.Event_id";

        //    GenderDropDownList.DataSource = dt1;
        //    GenderDropDownList.DataTextField = "Gender";
        //    GenderDropDownList.DataValueField = "Gender";
        //    GenderDropDownList.DataBind();

        //    GenderDropDownList.DataSource = dt1;
        //    GenderDropDownList.DataTextField = "Gender";
        //    GenderDropDownList.DataValueField = "Gender";
        //    GenderDropDownList.DataBind();
        //}   
        // }

        protected void CreateLOIButton_Click(object sender, EventArgs e)
        {
            int eventId = 0, gameId = 0;
            int egd_id = 0;
            int zone_id = 0;
            try
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    CheckBox ck1 = (CheckBox)row.FindControl("CheckBox1");
                    if (ck1.Checked)
                    {
                        string eventName = row.Cells[1].Text;
                        string gameName = row.Cells[2].Text;
                        string gndr = row.Cells[3].Text;
                        string gameDate = row.Cells[4].Text;
                        string eventType = row.Cells[5].Text;

                        string q1 = @"select egd.Event_id, egd.Game_id from Event_Game_Detail_Extra egd 
                                    join Event evnt on evnt.Event_id = egd.Event_id 
                                    join Game_MAST game on egd.Game_id = game.Game_id 
                                    where evnt.Event_name='" + eventName + "' and game.Game_name='" + gameName + "' and egd.Event_type='" + eventType + "' and egd.Gender = '" + gndr + "'";
                        //string q2 = @"select egd.Game_id from Event_Game_Detail_Extra egd 
                        //            join Game_MAST game on egd.Game_id = game.Game_id 
                        //            where game.Game_name='" + gameName + "' and egd.Event_type='" + eventType + "'";

                        //     string up = @"select  egd.Egd_id, evnt.Event_name, gm.Game_name, egd.Gender, egd.Game_date, egd.Event_type from Event_Game_Detail_Extra egd
                        //                 join Event evnt on evnt.Event_id = egd.Event_id
                        //                 join Game_Mast gm on gm.Game_id = egd.Game_id
                        //                 where evnt.Event_name='"+eventName+"' and gm.Game_name='"+ gameName + " and egd.Gender='"+ gndr + "'";

                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            // temp start
                            conn.Open();
                            string query0 = @"insert into Temp (event,game,gender,eventtype)values
                                        ('" + eventName + "','" + gameName + "','" + gndr + "','" + eventType + "')";
                            SqlCommand cmd0 = new SqlCommand(query0, conn);
                            cmd0.ExecuteNonQuery();
                            conn.Close();
                            // temp end


                            conn.Open();
                            SqlCommand cmd1 = new SqlCommand(q1, conn);
                            SqlDataReader reader1 = cmd1.ExecuteReader();
                            while (reader1.Read())
                            {
                                eventId = reader1.GetInt32(0);
                                gameId = reader1.GetInt32(1);
                            }
                            conn.Close();


                            conn.Open();
                            string q3 = @"select egd.Egd_id from Event_Game_Detail_Extra egd where egd.Event_id='" + eventId + "' and egd.Game_id='" + gameId + "' and egd.Event_type='" + eventType + "'";
                            SqlCommand cmd4 = new SqlCommand(q3, conn);
                            SqlDataReader reader3 = cmd4.ExecuteReader();
                            while (reader3.Read())
                            {
                                egd_id = reader3.GetInt32(0);
                            }
                            conn.Close();

                            conn.Open();
                            string qq = "select C_zone from COLLEGE_MAST where C_id = " + Session["C_id"].ToString();
                            SqlCommand cmd5 = new SqlCommand(qq, conn);
                            SqlDataReader reader4 = cmd5.ExecuteReader();
                            while (reader4.Read())
                            {
                                zone_id = reader4.GetInt32(0);
                            }
                            conn.Close();

                            conn.Open();
                            string query1 = @"insert into Event_Game_Request (Egd_id, Zone_id, C_id, U_username) values
                                        ('" + egd_id + "','" + zone_id + "','" + Session["C_id"].ToString() + "','" + Session["Username"].ToString() + "')";
                            SqlCommand cmd3 = new SqlCommand(query1, conn);
                            cmd3.ExecuteNonQuery();
                            conn.Close();
                        }
                    }
                }

                lblCollegeId.Text = Session["C_id"].ToString();
                //string query1 = @"select * from COLLEGE_MAST where C_id='" + lblCollegeId.Text + "'";

                SqlConnection con = new SqlConnection(CS);
                con.Open();
                string query = @"select * from COLLEGE_MAST where C_id='" + lblCollegeId.Text + "'";
                SqlCommand sc = new SqlCommand(query, con);
                sc.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(sc);
                da.Fill(dt);
                int i = sc.ExecuteNonQuery();
                if (dt.Rows.Count > 0)
                {
                    ClgCodeLabel.Text = dt.Rows[0]["C_id"].ToString();
                    ClgNameLabel.Text = dt.Rows[0]["C_name"].ToString();
                    Image1.ImageUrl = dt.Rows[0]["C_header"].ToString();
                    FacultyNameLabel.Text = Session["Username"].ToString();
                    FacultyContactLabel.Text = dt.Rows[0]["C_mobile"].ToString();
                }
                con.Close();

                con.Open();
                string query2 = @"select * from Temp";
                SqlCommand sc2 = new SqlCommand(query2, con);
                sc2.ExecuteNonQuery();
                DataTable dt2 = new DataTable();
                SqlDataAdapter da2 = new SqlDataAdapter(sc2);
                da2.Fill(dt2);
                GridView3.DataSource = dt2;
                GridView3.DataBind();
                con.Close();

                ModalPopupExtender10.Show();

            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void Button26_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query2 = @"truncate table Temp";
                    SqlCommand sc2 = new SqlCommand(query2, conn);
                    DataTable dt2 = new DataTable();
                    SqlDataAdapter da2 = new SqlDataAdapter(sc2);
                    da2.Fill(dt2);
                    GridView3.DataSource = dt2;
                    GridView3.DataBind();
                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void Button27_Click(object sender, EventArgs e)
        {

        }

        protected void btn_upload_pdf_Click(object sender, EventArgs e)
        {
            try
            {
                //string FileNames = Path.GetFileName(FileUpload1.PostedFile.FileName);
                ////Save files to images folder
                //FileUpload1.SaveAs(Server.MapPath("PDF/" + FileNames));

                try
                {
                    using (SqlConnection cn = new SqlConnection(CS))
                    {
                        string query = @"insert into LOI values('" + TextBox2.Text + "','" + "PDF/" + FileUpload1.FileName + "','" + DateTime.UtcNow + "','" + Session["C_id"].ToString() + "')";
                        String p = Server.MapPath("PDF");
                        FileUpload1.SaveAs(p + "/" + FileUpload1.FileName);
                        SqlCommand cmd = new SqlCommand(query, cn);
                        cn.Open();
                        cmd.ExecuteNonQuery();
                        cn.Close();

                        //notify                    
                        LOI++;
                        Session["LOI"] = LOI;

                        TextBox2.Text = "";
                    }
                }
                catch (Exception)
                {
                    //Response.Redirect("ErrorPage.aspx");
                    //Response.Redirect("<script>alert('Somthing went wrong....plz try again')</script>");
                    throw;
                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        } //end method
    }

}
