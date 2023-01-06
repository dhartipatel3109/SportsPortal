using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chk : System.Web.UI.Page
{
    int egd_id = 0;
    int zone_id;
    string U_email;

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
                    string qq = @"SELECT * FROM ZONE_MAST ORDER BY Zone_id";

                    SqlCommand cmd = new SqlCommand(query1, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    EventDropDownList.DataSource = dt;
                    EventDropDownList.DataTextField = "Event_name";
                    EventDropDownList.DataValueField = "Event_id";
                    EventDropDownList.DataBind();
                    conn.Close();
                    //end for event drop down

                    //start for zone drop down
                    conn.Open();
                    SqlCommand cmdd = new SqlCommand(qq, conn);
                    SqlDataAdapter adpp = new SqlDataAdapter(cmdd);
                    DataTable dtt = new DataTable();
                    adpp.Fill(dtt);

                    ZoneDropDownList.DataSource = dtt;
                    ZoneDropDownList.DataTextField = "Zone_name";
                    ZoneDropDownList.DataValueField = "Zone_id";
                    ZoneDropDownList.DataBind();
                    conn.Close();
                    //end for zone drop down

                    EventDropDownList.Items.Insert(0, new ListItem("--Select Event--", "--Select Event--"));
                    CollegeDropDownList.Items.Insert(0, new ListItem("--Select College--", "--Select College--"));
                    GameDropDownList.Items.Insert(0, new ListItem("--Select Game--", "--Select Game--"));
                    ZoneDropDownList.Items.Insert(0, new ListItem("--Select Zone--", "--Select Zone--"));
                }
                //Display();
                //DropDownList zonedrp = (DropDownList)GridView1.FindControl("ZoneDropDownList");                    
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
            string query = @"select ega.Ega_id, evnt.Event_name, game.Game_name, ega.Assign_date, egd.Gender, egd.Event_type, zone.Zone_name, clg.C_name from Event_Game_Assign ega
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

            using (SqlConnection conn = new SqlConnection(CS))
            {
                conn.Open();
                string q = @"select distinct game.Game_name ,egd.Game_id from Event_Game_Detail_Extra egd
                                 join GAME_MAST game on game.Game_id = egd.Game_id
                                 where egd.Event_id = '" + EventDropDownList.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                GameDropDownList.DataSource = dt;
                GameDropDownList.DataTextField = "Game_name";
                GameDropDownList.DataValueField = "Game_id";
                GameDropDownList.DataBind();

                GameDropDownList.Items.Insert(0, new ListItem("--Select Game--", "--Select Game--"));
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + (ex.Message) + "')</script>");
        }
    }

    protected void GameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string query = @"select ega.Ega_id, evnt.Event_name, game.Game_name, ega.Assign_date, egd.Gender, egd.Event_type, zone.Zone_name, clg.C_name from Event_Game_Assign ega
                                join Event_Game_Detail_Extra egd on ega.Egd_id = egd.Egd_id
                                join Event evnt on evnt.Event_id = egd.Event_id
                                join GAME_MAST game on game.Game_id = egd.Game_id
                                join ZONE_MAST zone on zone.Zone_id = ega.Zone_id
                                join COLLEGE_MAST clg on clg.C_id = ega.C_id
                                where evnt.Event_status = 'yes' and ";

            string extra = EventDropDownList.SelectedItem.ToString();
            string game = GameDropDownList.SelectedItem.ToString();
            if (extra != "")
            {
                //var id = EventDropDownList.SelectedValue;
                query += "evnt.Event_name like '%" + extra + "%' and ";
            }
            if (game != "")
            {
                query += "game.Game_name like '%" + game + "%' or ";
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

            using (SqlConnection conn = new SqlConnection(CS))
            {
                conn.Open();
                string qu = @"select egd.Gender from Event_Game_Detail_Extra egd
                                 where egd.Game_id = '" + GameDropDownList.SelectedValue + "' and egd.Event_id = '" + EventDropDownList.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(qu, conn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        //if (dt.Rows[i - 1][0].ToString() == "B"){     CheckBoxList1.Items[i].Selected = true;     }
                        //else{     CheckBoxList1.Items[i].Selected = false;    }
                        //if (dt.Rows[i - 1][0].ToString() == "G"){     CheckBoxList1.Items[i].Selected = true;     }
                        //else{     CheckBoxList1.Items[i].Selected = false;        }

                        if (dt.Rows[i][0].ToString() == "Boys")
                        {
                            CheckBoxList1.Items[0].Selected = true;
                        }
                        else
                        {
                            CheckBoxList1.Items[0].Selected = false;
                        }
                        if (dt.Rows[i][0].ToString() == "Girls")
                        {
                            CheckBoxList1.Items[1].Selected = true;
                        }
                        else
                        {
                            CheckBoxList1.Items[1].Selected = false;
                        }
                    }
                }
                //GameDropDownList.DataSource = dt;
                //GameDropDownList.DataTextField = "Game_name";
                //GameDropDownList.DataValueField = "Game_id";
                //GameDropDownList.DataBind();
            }

            using (SqlConnection conn = new SqlConnection(CS))
            {
                conn.Open();
                string q = @"select egd.Event_type from Event_Game_Detail_Extra egd
                                 where egd.Game_id = '" + GameDropDownList.SelectedValue + "' and egd.Event_id = '" + EventDropDownList.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i][0].ToString() == "Zonal")
                        {
                            //RadioButtonList1.Items[0].Selected = true;
                            ZoneDropDownList.Visible = true;
                            CheckBoxList2.Items[0].Selected = true;
                        }
                        else
                        {
                            CheckBoxList2.Items[0].Selected = false;

                            //RadioButtonList1.Items[1].Selected = true;
                            //ZoneDropDownList.Visible = false;
                        }

                        if (dt.Rows[i][0].ToString() == "Inter-Zonal")
                        {
                            //RadioButtonList1.Items[0].Selected = true;
                            ZoneDropDownList.Visible = true;
                            CheckBoxList2.Items[1].Selected = true;
                        }
                        else
                        {
                            CheckBoxList2.Items[1].Selected = false;

                            //RadioButtonList1.Items[1].Selected = true;
                            //ZoneDropDownList.Visible = false;
                        }
                    }
                }

            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + (ex.Message) + "')</script>");
        }
    }

    protected void ZoneDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ZoneDropDownList.SelectedValue != "11")
            {
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query = @"select clg.C_id, clg.C_name from COLLEGE_MAST clg
                                    join Event_Game_Request req on req.C_id = clg.C_id
                                    join Event_Game_Detail_Extra egd on egd.Egd_id = req.Egd_id
                                    join Event evnt on evnt.Event_id = egd.Event_id
                                    join GAME_MAST gm on gm.Game_id = egd.Game_id
                                    where evnt.Event_id = '" + EventDropDownList.SelectedValue + "' " +
                                "and gm.Game_id ='" + GameDropDownList.SelectedValue + "' " +
                                "and req.Zone_id = '" + ZoneDropDownList.SelectedValue + "'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    CollegeDropDownList.DataSourceID = null;
                    CollegeDropDownList.DataSource = dt;
                    CollegeDropDownList.DataTextField = "C_name";
                    CollegeDropDownList.DataValueField = "C_id";
                    CollegeDropDownList.DataBind();

                    CollegeDropDownList.Items.Insert(0, new ListItem("--Select College--", "--Select College--"));
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query = @"select C_id,C_name from COLLEGE_MAST";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    CollegeDropDownList.DataSource = dt;
                    CollegeDropDownList.DataTextField = "C_name";
                    CollegeDropDownList.DataValueField = "C_id";
                    CollegeDropDownList.DataBind();

                    CollegeDropDownList.Items.Insert(0, new ListItem("--Select College--", "--Select College--"));
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + (ex.Message) + "')</script>");
        }
    }


    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //try
        //{
        //    if (RadioButtonList1.SelectedItem.Text == "Z")
        //    {
        //        ZoneDropDownList.Visible = true;
        //    }
        //    else
        //    {
        //        ZoneDropDownList.Visible = false;

        //        using (SqlConnection conn = new SqlConnection(CS))
        //        {
        //            conn.Open();
        //            string query = @"select C_id,C_name from COLLEGE_MAST";
        //            SqlCommand cmd = new SqlCommand(query, conn);
        //            SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //            DataTable dt = new DataTable();
        //            adp.Fill(dt);

        //            CollegeDropDownList.DataSource = dt;
        //            CollegeDropDownList.DataTextField = "C_name";
        //            CollegeDropDownList.DataValueField = "C_id";
        //            CollegeDropDownList.DataBind();

        //            CollegeDropDownList.Items.Insert(0, new ListItem("--Select College--", "--Select College--"));
        //        }
        //    }
        //}
        //catch (Exception)
        //{
        //    Response.Write("<script>alert('Something went wrong')</script>");
        //}
    }

    protected void AssignButton_Click(object sender, EventArgs e)
    {
        try
        {
            string q = @"select evnt.Event_name, game.Game_name, ega.Assign_date, egd.Gender, egd.Event_type, clg.C_name from Event_Game_Assign ega
                           join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                            join Event evnt on evnt.Event_id = egd.Event_id
                            join GAME_MAST game on game.Game_id = egd.Game_id
                            join COLLEGE_MAST clg on clg.C_id = ega.C_id
                            where egd.Event_id = '" + EventDropDownList.SelectedValue + "' and egd.Gender = '" + CheckBoxList1.SelectedValue + "' and egd.Game_id = '" + GameDropDownList.SelectedValue + "' ";

            using (SqlConnection sn = new SqlConnection(CS))
            {
                sn.Open();
                SqlCommand sc = new SqlCommand(q, sn);
                SqlDataReader reader = sc.ExecuteReader();
                if (reader.HasRows)
                {
                    Response.Write("<script>alert('This Game is already assigned so either delete previous one');</script>");
                    return;
                }
                sn.Close();
            }


            string q1 = @"select egd.Egd_id from Event_Game_Detail_Extra egd where egd.Event_id = '" + EventDropDownList.SelectedValue + "' and egd.Game_id = '" + GameDropDownList.SelectedValue + "' and egd.Gender = '" + CheckBoxList1.SelectedValue + "'";
            using (SqlConnection conn = new SqlConnection(CS))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(q1, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        egd_id = reader.GetInt32(0);
                    }
                }
            }

            zone_id = Convert.ToInt32(ZoneDropDownList.SelectedValue);
            using (SqlConnection conn = new SqlConnection(CS))
            {
                string query = @"insert into Event_Game_Assign (Egd_id, Zone_id, C_id, Assign_date, Result_Status) values
                                        ('" + egd_id + "','" + zone_id + "','" + CollegeDropDownList.SelectedValue + "','" + finalDate.Text + "', 'no')";
                //Response.Write("<script>alert('" + egd_id + "')</script>");
                //Response.Write("<script>alert('" + zone_id + "')</script>");
                //Response.Write("<script>alert('" + CollegeDropDownList.SelectedValue + "')</script>");

                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();

                Display();
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + (ex.Message) + "')</script>");
        }
    } //end of method

    protected void Display()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(CS))
            {
                string query = @"select ega.Ega_id,egd.Event_type, evnt.Event_name, game.Game_name, ega.Assign_date, egd.Gender, zone.Zone_name, clg.C_name from Event_Game_Assign ega
                                join Event_Game_Detail_Extra egd on ega.Egd_id = egd.Egd_id
                                join Event evnt on evnt.Event_id = egd.Event_id
                                join GAME_MAST game on game.Game_id = egd.Game_id
                                join ZONE_MAST zone on zone.Zone_id = ega.Zone_id
                                join COLLEGE_MAST clg on clg.C_id = ega.C_id
                                where evnt.Event_status = 'yes'
                                order by ega.Ega_id desc";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + (ex.Message) + "')</script>");
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Display();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            string ccc = e.CommandArgument.ToString();

            if (e.CommandName == "delete")
            {
                Session["Ega_id"] = ccc;
                string id = Session["Ega_id"].ToString();
                string query = @"delete from Event_Game_Assign where Ega_id= '" + id + "' ";
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    int rows = cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('" + rows + " Deleted')</script>");
                }

                Display();
                //Response.Redirect("Users.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + (ex.Message) + "')</script>");
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                foreach (Control control in e.Row.Cells[i].Controls)
                {
                    if (string.IsNullOrEmpty((control as Label).Text))
                    {
                        e.Row.Cells[i].Text = "NULL";
                    }
                }
                if (e.Row.Cells[i].Text == "&nbsp;")
                {
                    e.Row.Cells[i].Text = "NULL";
                }
            }
        }
    }
    protected void SendMail_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            var eventName = GridView1.Rows[i].Cells[1].Text;
            var gameName = GridView1.Rows[i].Cells[2].Text;
            var finaldate = GridView1.Rows[i].Cells[3].Text;
            var gender = GridView1.Rows[i].Cells[4].Text;
            var zoneName = GridView1.Rows[i].Cells[6].Text;
            var collageName = GridView1.Rows[i].Cells[7].Text;
            collageName = HttpUtility.HtmlDecode(collageName);

            using (SqlConnection conn = new SqlConnection(CS))
            {
                string userEmail = @"select ut.U_email from COLLEGE_MAST clg
                                join User_Table ut on clg.C_id = ut.C_id
                                where clg.C_name = '" + collageName + "'";

                conn.Open();
                SqlCommand cmd = new SqlCommand(userEmail, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        U_email = reader["U_email"].ToString();
                    }
                }

                if (U_email != "" && U_email != null)
                {
                    try
                    {
                        MailMessage message = new MailMessage();
                        message.From = new MailAddress("rajpatel2111998@gmail.com");
                        message.To.Add(new MailAddress(U_email));

                        string mailbody = @"<h3>Congratulations</h3><br/>
                                <p>Your LOI request has been accepted for <b>Event Name : </b> '" + eventName + "' and <b>Game Name : </b> '" + gameName + "'</p><br/><p>Which will be held on <b>'" + finaldate + "'</b> in <b>'" + zoneName + "'</b> zone for <b>'" + gender + "'</b></p>";

                        message.Subject = "GTU Technological University - Sports Portal";
                        message.Body = mailbody;
                        message.BodyEncoding = Encoding.UTF8;
                        message.IsBodyHtml = true;
                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                        System.Net.NetworkCredential basicCredential1 = new
                        System.Net.NetworkCredential("rajpatel2111998@gmail.com", "viru2106");
                        client.EnableSsl = true;
                        client.UseDefaultCredentials = false;
                        client.Credentials = basicCredential1;
                        client.Send(message);
                    }
                    catch (Exception)
                    {
                        Response.Write("<script>alert('Oops Something went wrong to stop mailing...Try again later')</script>");
                    } 
                }
            }
        }
    }
}
