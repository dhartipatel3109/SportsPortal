﻿using System;
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
    public partial class WebForm22 : System.Web.UI.Page
    {
        int egd_id = 0;
        int zone_id;

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
                string query = @"select evt.Event_name, gm.Game_name, egd.Game_date, egd.Gender, egd.Event_type, zn.Zone_name, clg.C_name, sm.Student_name, sm.Student_email, egas.Win_Level from Event_Game_Assign_student egas
                                Join Event_Game_Assign ega on ega.Ega_id = egas.Ega_id
                                Join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                                Join STUDENT_MAST sm on sm.Student_id = egas.Student_id
                                Join GAME_MAST gm on gm.Game_id = egd.Game_id
                                Join Event evt on evt.Event_id = egd.Event_id
                                Join COLLEGE_MAST clg on clg.C_id = ega.C_id
                                Join ZONE_MAST zn on zn.Zone_id = ega.Zone_id
                                where evt.Event_status = 'yes' and ";

                string extra = EventDropDownList.SelectedItem.ToString();
                if (extra != "")
                {
                    //var id = EventDropDownList.SelectedValue;
                    query += "evt.Event_name like '%" + extra + "%' or ";
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
                string query = @"select evt.Event_name, gm.Game_name, egd.Game_date, egd.Gender, egd.Event_type, zn.Zone_name, clg.C_name, sm.Student_name, sm.Student_email, egas.Win_Level from Event_Game_Assign_student egas
                                Join Event_Game_Assign ega on ega.Ega_id = egas.Ega_id
                                Join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                                Join STUDENT_MAST sm on sm.Student_id = egas.Student_id
                                Join GAME_MAST gm on gm.Game_id = egd.Game_id
                                Join Event evt on evt.Event_id = egd.Event_id
                                Join COLLEGE_MAST clg on clg.C_id = ega.C_id
                                Join ZONE_MAST zn on zn.Zone_id = ega.Zone_id
                                where evt.Event_status = 'yes' and ";

                string extra = EventDropDownList.SelectedItem.ToString();
                string game = GameDropDownList.SelectedItem.ToString();
                if (extra != "")
                {
                    //var id = EventDropDownList.SelectedValue;
                    query += "evt.Event_name like '%" + extra + "%' and ";
                }
                if (game != "")
                {
                    query += "gm.Game_name like '%" + game + "%' or ";
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
                        //uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
                        conn.Open();
                        string query = @"select clg.C_name, clg.C_id from COLLEGE_MAST clg
                                        join ZONE_MAST zn on zn.Zone_id = clg.C_zone
                                        where zn.Zone_id =  '" + ZoneDropDownList.SelectedValue + "'";
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

        protected void CollegeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query1 = @"select evt.Event_name, gm.Game_name, egd.Game_date, egd.Gender, egd.Event_type, zn.Zone_name, clg.C_name, sm.Student_name, sm.Student_email, egas.Win_Level from Event_Game_Assign_student egas
                                    Join Event_Game_Assign ega on ega.Ega_id = egas.Ega_id
                                    Join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                                    Join STUDENT_MAST sm on sm.Student_id = egas.Student_id
                                    Join GAME_MAST gm on gm.Game_id = egd.Game_id
                                    Join Event evt on evt.Event_id = egd.Event_id
                                    Join COLLEGE_MAST clg on clg.C_id = ega.C_id
                                    Join ZONE_MAST zn on zn.Zone_id = ega.Zone_id
                                    where sm.Student_college = '"+ CollegeDropDownList.SelectedValue +"' ";                    

                    SqlCommand cmd = new SqlCommand(query1, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    GridView1.DataSource = dt;                    
                    GridView1.DataBind();
                    conn.Close();
                    //end for event drop down                    
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");               
            }
        }
    }
}