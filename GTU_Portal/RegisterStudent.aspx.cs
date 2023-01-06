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
    public partial class RegisterStudent : System.Web.UI.Page
    {
        int ega_id;
        Random rand = new Random();
        int randVar;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
        SqlCommand cmd = null;
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            rand.Next();

            try
            {
                if (!IsPostBack)
                {
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        conn.Open();
                        string query = @"select distinct evnt.Event_name,egd.Event_id from Event_Game_Detail_Extra egd
                                        join Event evnt on evnt.Event_id = egd.Event_id
                                        where evnt.Event_status = 'yes'";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataAdapter adp = new SqlDataAdapter(cmd);
                        DataTable dt1 = new DataTable();
                        adp.Fill(dt1);

                        EventDropDownList.DataSource = dt1;
                        EventDropDownList.DataTextField = "Event_name";
                        EventDropDownList.DataValueField = "Event_id";
                        EventDropDownList.DataBind();

                        EventDropDownList.Items.Insert(0, new ListItem("SelectEvent", "SelectEvent"));
                    }

                    DataTable dt = new DataTable();
                    dt.Columns.AddRange(new DataColumn[5] {
                        new DataColumn("Student_id"), new DataColumn("Student_name"), new DataColumn("Student_mobile"), new DataColumn("Student_email"), new DataColumn("Student_college")
                });
                    ViewState["CurrentData"] = dt;
                    //GridView1.DataBind();
                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }

        }

        protected void EventDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query = @"select distinct game.Game_name ,egd.Game_id from Event_Game_Detail_Extra egd
                                 join GAME_MAST game on game.Game_id = egd.Game_id
                                 where egd.Event_id = '" + EventDropDownList.SelectedValue + "'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    GameDropDownList.DataSource = dt;
                    GameDropDownList.DataTextField = "Game_name";
                    GameDropDownList.DataValueField = "Game_id";
                    GameDropDownList.DataBind();

                    GameDropDownList.Items.Insert(0, new ListItem("Select Game", "Select Game"));
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }

        }

        protected void GameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            randVar = rand.Next();
        }

        //        protected void Button1_Click(object sender, EventArgs e)
        //        {
        //            using (SqlConnection conn = new SqlConnection(CS))
        //            {
        //                using (SqlCommand cmd = new SqlCommand("select ega.Ega_id from Event_Game_Detail_Extra egd Join Event_Game_Assign ega on ega.Egd_id = egd.Egd_id Join Event_Game_Assign_student egas on egas.Ega_id = ega.Ega_id where egd.Event_id = '" + EventDropDownList.SelectedValue + "' and egd.Game_id = '" + GameDropDownList.SelectedValue + "'", conn))
        //                {
        //                    conn.Open();
        //                    using (SqlDataReader reader = cmd.ExecuteReader())
        //                    {
        //                        if(reader.HasRows)
        //                        {
        //                            while (reader.Read())
        //                            {
        //                                ega_id = reader.GetInt32(0);
        //                            }
        //                        }

        //                    }
        //                }
        //            }




        ////            string ega_id = @"(select ega.Ega_id from Event_Game_Detail_Extra egd 
        ////								Join Event_Game_Assign ega on ega.Egd_id = egd.Egd_id
        ////								Join Event_Game_Assign_student egas on egas.Ega_id = ega.Ega_id
        ////                                where egd.Event_id = '" + EventDropDownList.SelectedValue + "' and egd.Game_id = '" + GameDropDownList.SelectedValue + "')";

        //////            int eg = Convert.ToInt32(ega_id);
        ////            using (SqlConnection conn = new SqlConnection(CS))
        ////            {
        ////                conn.Open();
        ////                SqlCommand cmd = new SqlCommand(ega_id, conn);
        ////                SqlDataReader reader = cmd.ExecuteReader();
        ////                if (reader.HasRows)
        ////                {
        ////                    while (reader.Read())
        ////                    {
        ////                        ega_id = reader.GetInt32(0).ToString();
        ////                    }
        ////                }
        ////                conn.Close();
        ////            }

        //            using (SqlConnection conn = new SqlConnection(CS))
        //            {
        //                conn.Open();
        //                if(ega_id != 0)
        //                {
        //                    string query = @"insert into Event_Game_Assign_student values('" + ega_id + "','" + EnrolmentTextBox.Text + "','" + StudentNameTextBox.Text + "','" + MobileTextBox.Text + "','" + EmailTextBox.Text + "','" + StudentCollegeTextBox.Text + "')";
        //                    SqlCommand cmd = new SqlCommand(query, conn);
        //                    //SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //                    //DataTable dt = new DataTable();
        //                    //adp.Fill(dt);                
        //                    cmd.ExecuteNonQuery();
        //                    conn.Close();
        //                }
        //            }
        //        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand("select ega.Ega_id, egd.Egd_id, egd.Event_id, egd.Game_id from Event_Game_Detail_Extra egd Join Event_Game_Assign ega on ega.Egd_id = egd.Egd_id  where egd.Event_id = '" + EventDropDownList.SelectedValue + "' and egd.Game_id = '" + GameDropDownList.SelectedValue + "'", conn))
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    ega_id = reader.GetInt32(0);
                                }
                            }
                        }
                    }
                }

                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    if (ega_id != 0)
                    {
                        string query = @"insert into Event_Game_Assign_student values('" + ega_id + "','" + randVar + "','" + EnrolmentTextBox.Text + "','" + StudentNameTextBox.Text + "','" + MobileTextBox.Text + "','" + EmailTextBox.Text + "','" + StudentCollegeTextBox.Text + "')";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
            //randVar = rand.Next();
        }

        //protected void Add_Click(object sender, EventArgs e)
        //{

        //    DataTable dt = (DataTable)ViewState["CurrentData"];
        //    dt.Rows.Add(EnrolmentTextBox.Text.Trim(), StudentNameTextBox.Text.Trim(), MobileTextBox.Text.Trim(), EmailTextBox.Text.Trim(), StudentCollegeTextBox.Text.Trim());
        //    ViewState["Emp"] = dt;
        //    this.BindGrid();

        //    EnrolmentTextBox.Text = string.Empty;
        //    StudentNameTextBox.Text = string.Empty;
        //    MobileTextBox.Text = string.Empty;
        //    EmailTextBox.Text = string.Empty;
        //    StudentCollegeTextBox.Text = string.Empty;
        //    EnrolmentTextBox.Focus();

            //conn.Open();

            //if (ViewState["CurrentData"] != null)
            //{
            //    DataTable dt = (DataTable)ViewState["CurrentData"];
            //    int count = dt.Rows.Count;
            //    BindGrid(count);
            //}
            //else
            //{
            //    BindGrid(1);
            //}


            //conn.Close();

            //using (SqlConnection conn = new SqlConnection(CS))
            //{
            //    using (SqlCommand cmd1 = new SqlCommand("select ega.Ega_id, egd.Egd_id, egd.Event_id, egd.Game_id from Event_Game_Detail_Extra egd Join Event_Game_Assign ega on ega.Egd_id = egd.Egd_id  where egd.Egd_id = '" + EventDropDownList.SelectedValue + "' and egd.Game_id = '" + GameDropDownList.SelectedValue + "'", conn))
            //    {
            //        conn.Open();
            //        using (SqlDataReader reader = cmd1.ExecuteReader())
            //        {
            //            if (reader.HasRows)
            //            {
            //                while (reader.Read())
            //                {
            //                    ega_id = reader.GetInt32(0);
            //                }
            //            }
            //        }
            //    }
            //}

            //conn.Open();
            //string q1 = "select * from Event_Game_Detail_Extra egd Join Event_Game_Assign ega on ega.Egd_id = egd.Egd_id where egd.Event_id = '" + EventDropDownList.SelectedValue + "' and egd.Game_id = '" + GameDropDownList.SelectedValue + "'";

            //SqlCommand cmd = new SqlCommand(q1, conn);
            //SqlDataAdapter adp = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //adp.Fill(dt);

            //GridView1.DataSourceID = null;
            //GridView1.DataSource = dt;
            //GridView1.DataBind();
            //conn.Close();
       // }

        //private void BindGrid()
        //{
        //    GridView1.DataSource = (DataTable)ViewState["CurrentData"];
        //    GridView1.DataBind();
        //}

    }
}