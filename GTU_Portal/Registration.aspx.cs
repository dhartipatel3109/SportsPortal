using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace GTU_Portal
{
    public partial class Registration : System.Web.UI.Page
    {
        Int64 id;
        Random rand = new Random();
        private static int egd_id = 0;
        private static String Team_Id;
        private static int ega_id;
        private static int counter;
        private static int Max;
        private static int Min;

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

                        EventDropDownList.Items.Insert(0, new ListItem("--Select Event--", "--Select Event--"));
                        GameDropDownList.Items.Insert(0, new ListItem("--Select Game--", "--Select Game--"));
                    }

                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        conn.Open();
                        string query2 = @"truncate table Temp2";
                        SqlCommand sc2 = new SqlCommand(query2, conn);
                        sc2.ExecuteNonQuery();
                        GridView1.DataBind();
                    }
                }
            }
            catch (Exception)
            {
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
                    string query = @"select distinct game.Game_name, egd.Game_id from Event_Game_Detail_Extra egd
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

                    GameDropDownList.Items.Insert(0, new ListItem("--Select Game--", "--Select Game--"));
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void GameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                team.Visible = true;
                counter = 0;

                string randomkey = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
                char[] teamid = new char[7];
                for (int i = 0; i < 7; i++)
                {
                    teamid[i] = randomkey[(int)(35 * rand.NextDouble())];
                }
                TeamIdLabel.Text = "Your Team_id : " + new String(teamid);
                Team_Id = new String(teamid);

                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query = @"select egd.Egd_id, egd.Gender from Event_Game_Detail_Extra egd
                                 where egd.Game_id = '" + GameDropDownList.SelectedValue + "' and egd.Event_id = '" + EventDropDownList.SelectedValue + "'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (dt.Rows.Count > 0)
                    {
                        while (reader.Read())
                        {
                            egd_id = reader.GetInt32(0);
                        }


                        for (int i = 0; i < dt.Rows.Count; i++)
                        {

                            if (dt.Rows[i][1].ToString() == "Boys")
                            {
                                reader.Read();
                                Genderlabel.Text = "Boys";
                                Session["Gender"] = "B";
                            }

                            if (dt.Rows[i][1].ToString() == "Girls")
                            {
                                reader.Read();
                                Genderlabel.Text = "Girls";
                                Session["Gender"] = "G";
                            }
                        }
                    }
                }

                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query = @"select zone.Zone_name from Event_Game_Assign ega
                                join Event_Game_Detail_Extra egd on ega.Egd_id = egd.Egd_id                               
                                join ZONE_MAST zone on zone.Zone_id = ega.Zone_id
                                where egd.Egd_id = '" + egd_id + "'";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            reader.Read();
                            ZoneNamelabel.Text = reader["Zone_name"].ToString();
                        }
                    }

                }

                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query = @"select egd.Game_date, gm.Max_player, gm.Min_player from GAME_MAST gm 
                                 join Event_Game_Detail_Extra egd on gm.Game_id = egd.Game_id
                                 where gm.Game_id = '" + GameDropDownList.SelectedValue + "' and egd.Event_id = '" + EventDropDownList.SelectedValue + "'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    reader.Read();
                    GameDatelabel.Text = reader["Game_date"].ToString();
                    if (reader["Min_player"] != null)
                    {
                        MinPlayerlabel.Text = reader["Min_player"].ToString();
                        Min = Convert.ToInt32(reader["Min_player"].ToString());
                    }
                    else
                    {
                        MinPlayerlabel.Visible = false;
                    }

                    if (reader["Max_player"] != null)
                    {
                        MaxPlayerlabel.Text = reader["Max_player"].ToString();
                        Max = Convert.ToInt32(reader["Max_player"].ToString());
                    }
                    else
                    {
                        MaxPlayerlabel.Visible = false;
                    }

                }

                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();

                    string query = @"select zone.Zone_name, clg.C_name from Event_Game_Assign ega
                                join Event_Game_Detail_Extra egd on ega.Egd_id = egd.Egd_id                              
                                join ZONE_MAST zone on zone.Zone_id = ega.Zone_id
                                join COLLEGE_MAST clg on clg.C_id = ega.C_id
                                where ega.Egd_id = '" + egd_id + "' order by ega.Ega_id desc";

                    if (query != null)
                    {
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataReader reader = cmd.ExecuteReader();
                        reader.Read();

                        if (!reader.HasRows)
                        {
                            Response.Write("<script>alert('This game is not assign to any college so you can not assign student to it')</script>");
                            team.Visible = false;
                        }
                        else
                        {
                            Collegelabel.Text = reader["C_name"].ToString();
                        }
                    }
                    else
                    {
                        Collegelabel.Text = "";
                    }

                }

                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query2 = @"truncate table Temp2";
                    SqlCommand sc2 = new SqlCommand(query2, conn);
                    sc2.ExecuteNonQuery();
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "');</script>");
            }
        }

        protected void NewRegistrationButton_Click(object sender, EventArgs e)
        {
            counter = 0;
            team.Visible = true;
            //How random key is genarated
            try
            {
                EnrolmentTextBox.Text = "";

                string randomkey = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
                char[] teamid = new char[7];
                for (int i = 0; i < 7; i++)
                {
                    teamid[i] = randomkey[(int)(35 * rand.NextDouble())];
                }
                TeamIdLabel.Text = "Your Team_id : " + new String(teamid);
                Team_Id = new String(teamid);

                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query2 = @"truncate table Temp2";
                    SqlCommand sc2 = new SqlCommand(query2, conn);
                    sc2.ExecuteNonQuery();
                    GridView1.DataBind();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            counter++;

            Int64 enrolment = 0, stmobile = 0;
            string stname = "", stemail = "";
            int stcollege = 0;

            int trial = 0;
            try
            {
                //find ega_id               
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand(@"select ega.Ega_id, egd.Egd_id from Event_Game_Detail_Extra egd 
                                                            Join Event_Game_Assign ega on ega.Egd_id = egd.Egd_id  where egd.Egd_id = '" + egd_id + "'", conn))
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
                    string t2 = @"select Student_id from Event_Game_Assign_student 
                                    where Student_id = '" + this.EnrolmentTextBox.Text + "' and Ega_id = '" + ega_id + "'";
                    SqlCommand cmd = new SqlCommand(t2, conn);
                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        if (dr.HasRows == true)
                        {
                            Response.Write("<script>alert('Enrollment Already Has Participated In This Game')</script>");
                            EnrolmentTextBox.Text = "";
                            trial++;
                            break;
                        }
                    }

                    if (trial == 0)
                    {
                        using (SqlConnection cnn = new SqlConnection(CS))
                        {
                            SqlCommand cmd1 = new SqlCommand("Select * from STUDENT_MAST where Student_id= @Student_id", cnn);
                            cmd1.Parameters.AddWithValue("@Student_id", this.EnrolmentTextBox.Text);
                            cnn.Open();
                            SqlDataReader dar = cmd1.ExecuteReader();
                            while (!dar.HasRows)
                            {
                                Response.Write("<script>alert('Enrollment Does not Exist')</script>");
                                EnrolmentTextBox.Text = "";
                                trial++;
                                break;
                            }
                            cnn.Close();
                        }
                    }

                    if (trial == 0)
                    {
                        using (SqlConnection cnn = new SqlConnection(CS))
                        {
                            SqlCommand cmd1 = new SqlCommand("Select * from STUDENT_MAST where Student_id= @Student_id and Student_college = @college", cnn);
                            cmd1.Parameters.AddWithValue("@Student_id", this.EnrolmentTextBox.Text);
                            cmd1.Parameters.AddWithValue("@college", Session["C_id"]);
                            cnn.Open();
                            SqlDataReader dar = cmd1.ExecuteReader();
                            while (!dar.HasRows)
                            {
                                Response.Write("<script>alert('Student is not from your college.')</script>");
                                EnrolmentTextBox.Text = "";
                                trial++;
                                break;
                            }
                            cnn.Close();
                        }
                    }

                    if (trial == 0)
                    {
                        using (SqlConnection cnn = new SqlConnection(CS))
                        {
                            SqlCommand cmd1 = new SqlCommand("Select * from Temp2 where Student_id= @Student_id", cnn);
                            cmd1.Parameters.AddWithValue("@Student_id", this.EnrolmentTextBox.Text);
                            cnn.Open();
                            SqlDataReader dar = cmd1.ExecuteReader();

                            while (dar.HasRows)
                            {
                                Response.Write("<script>alert('Enrollment Already added here')</script>");
                                EnrolmentTextBox.Text = "";
                                trial++;
                                break;
                            }
                            cnn.Close();
                        }
                    }

                    if (trial == 0)
                    {
                        string q = @"SELECT * FROM STUDENT_MAST where Student_id = " + EnrolmentTextBox.Text + "";

                        using (SqlConnection cnn = new SqlConnection(CS))
                        {
                            cnn.Open();
                            SqlCommand c = new SqlCommand(q, conn);
                            SqlDataReader dr1 = c.ExecuteReader();
                            while (dr1.Read())
                            {
                                enrolment = Convert.ToInt64(dr1.GetInt64(0));
                                stname = dr1.GetString(1);
                                stemail = dr1.GetString(3);
                                stmobile = Convert.ToInt64(dr1.GetInt64(2));
                                stcollege = Convert.ToInt32(dr1.GetInt64(0));
                            }
                            cnn.Close();
                        }

                        using (SqlConnection cnn = new SqlConnection(CS))
                        {
                            string q2 = @"insert into Temp2 (Student_id, Student_name, Student_email, Student_mobile, Student_college)
                                              values ('" + enrolment + "','" + stname + "','" + stemail + "','" + stmobile + "','" + stcollege + "')";
                            cnn.Open();
                            SqlCommand c1 = new SqlCommand(q2, conn);
                            c1.ExecuteNonQuery();
                            cnn.Close();
                            BindGrid();
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (counter <= Max && counter >= Min)
                {
                    for (int i = 1; i <= counter; i++)
                    {
                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            using (SqlCommand cmd = new SqlCommand("Select Student_id from Temp2 where [Index] = '" + i + "'", conn))
                            {
                                conn.Open();
                                using (SqlDataReader reader = cmd.ExecuteReader())
                                {
                                    if (reader.HasRows)
                                    {
                                        while (reader.Read())
                                        {
                                            id = reader.GetInt64(0);
                                        }
                                    }
                                }
                            }

                            string query = @"insert into Event_Game_Assign_student values('" + ega_id + "','" + Team_Id + "','" + id + "', '0', '" + Session["C_id"].ToString() + "')";
                            SqlCommand cd = new SqlCommand(query, conn);
                            cd.ExecuteNonQuery();
                            conn.Close();
                        }

                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            string tem = @"truncate table Temp2";
                            SqlCommand cmd = new SqlCommand(tem, conn);
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                    }
                    Response.Write("<script>alert('Team is Successfully created.');</script>");
                }
                else
                {
                    counter = 0;
                    Response.Write("<script>alert('This Number of students are not allowed.. add or delete student according to Game Player')</script>");
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        string tem = @"truncate table Temp2";
                        SqlCommand cmd = new SqlCommand(tem, conn);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }

                }
                //GridView1.DataSource = null;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                team.Visible = false;
            }
        }

        private void BindGrid()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = @"select t.Student_id,t.Student_name,t.Student_mobile,t.Student_email,c.C_name from Temp2 t
                                        join COLLEGE_MAST c on c.C_id = t.Student_college";
                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.SelectCommand = cmd;
                            sda.Fill(dt);
                        }
                    }
                }

                //if (dt.Rows.Count == 0)
                //{
                //    //If no records then add a dummy row.
                //    dt.Rows.Add();
                //}

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
                throw;
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            try
            {
                for (int i = GridView1.Rows.Count - 1; i > 0; i--)
                {
                    GridViewRow row = GridView1.Rows[i];
                    GridViewRow previousRow = GridView1.Rows[i - 1];
                    for (int j = 0; j < row.Cells.Count - 1; j++)
                    {
                        if (row.Cells[j].Text == previousRow.Cells[j].Text)
                        {
                            if (previousRow.Cells[j].RowSpan == 0)
                            {
                                if (row.Cells[j].RowSpan == 0)
                                {
                                    previousRow.Cells[j].RowSpan += 2;
                                }
                                else
                                {
                                    previousRow.Cells[j].RowSpan = row.Cells[j].RowSpan + 1;
                                }
                                row.Cells[j].Visible = false;
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlConnection cn = new SqlConnection(CS);
                cn.Open();
                Int64 ID = Int64.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
                string id = @"Delete From Temp2 where Student_id = '" + ID + "' ";
                SqlCommand cmd = new SqlCommand(id, cn);
                cmd.ExecuteNonQuery();
                cn.Close();
                BindGrid();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
