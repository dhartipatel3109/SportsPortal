using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Net.Mail;
using System.Text;

namespace GTU_Portal
{
    public partial class WebForm24 : System.Web.UI.Page
    {
        static int auto_inc = 00001;
        string Year = DateTime.Parse(DateTime.Now.ToString()).Year.ToString();

        private static string eventname, gamename, gamedate, eventtype, gender;
        private static string assignclg;
        private static int winlevel = 0, cid=0;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
        SqlCommand cmd = null;

        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        private static int ega_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        if (Request.QueryString["id"] != null && Request.QueryString["id"] != string.Empty)
                        {
                            ega_id = Convert.ToInt32(Request.QueryString["id"]);

                            conn.Open();
                            string q1 = @"select distinct evt.Event_name, gm.Game_name, egd.Game_date, clg.C_name, egd.Event_type, egd.Gender from Event_Game_Assign ega
                                        join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                                        join Event evt on evt.Event_id = egd.Event_id
                                        join GAME_MAST gm on gm.Game_id = egd.Game_id
                                        join COLLEGE_MAST clg on clg.C_id = ega.C_id
                                        where ega.Ega_id = '" + ega_id + "' ";

                            SqlCommand cmd = new SqlCommand(q1, conn);


                            SqlDataAdapter adp = new SqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            adp.Fill(dt);

                            SqlDataReader dr = cmd.ExecuteReader();
                            if (dt.Rows.Count > 0)
                            {
                                if (dr.Read())
                                {
                                    EventName.Text = dr["Event_name"].ToString();
                                    GameName.Text = dr["Game_name"].ToString();
                                    GameDate.Text = dr["Game_date"].ToString();
                                    EventType.Text = dr["Event_type"].ToString();
                                    Clgs.Text = dr["C_name"].ToString();
                                    Gndr.Text = dr["Gender"].ToString();

                                    eventname = dr["Event_name"].ToString();
                                    gamename = dr["Game_name"].ToString();
                                    gamedate = dr["Game_date"].ToString();
                                    eventtype = dr["Event_type"].ToString();
                                    gender = dr["Gender"].ToString();
                                    assignclg = dr["C_name"].ToString();
                                }
                            }
                            conn.Close();
                        }
                    }

                    using (SqlConnection conn1 = new SqlConnection(CS))
                    {
                        conn1.Open();
                        string q1 = @"select distinct egas.Team_id, egas.Win_Level, egas.Participant_Level, egas.Egas_id, egas.Student_id, sm.Student_name,sm.Student_mobile,sm.Student_email,
                                    cm.C_name, egd.Game_date, egd.Gender, egd.Event_type, evt.Event_name, gm.Game_name from Event_Game_Assign_student egas 
                                    join Event_Game_Assign ega on ega.Ega_id = egas.Ega_id
                                    join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                                    join Event evt on evt.Event_id = egd.Event_id
                                    join GAME_MAST gm on gm.Game_id = egd.Game_id
                                    join STUDENT_MAST sm ON sm.Student_id = egas.Student_id
                                    join COLLEGE_MAST cm on cm.C_id = sm.Student_college
                                    where ega.Ega_id = '" + ega_id + "' and egas.Participant_Level = 'Enabled'";

                        SqlCommand cmd = new SqlCommand(q1, conn1);
                        SqlDataAdapter adp = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adp.Fill(dt);

                        GridView1.DataSourceID = null;
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        conn1.Close();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Int64 enrolment;
            string cr_no;
            using (SqlConnection conn1 = new SqlConnection(CS))
            {
                conn1.Open();
                string q1 = @"select distinct Certificate_status from Certificate where Ega_id = " + ega_id + " and Certificate_status = 'yes'";
                SqlCommand cmd = new SqlCommand(q1, conn1);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    Response.Write("<script>alert('Certificates are already generated for this game')</script>");
                }
                else
                {
                    conn1.Close();
                    conn1.Open();
                    int rows = 0;
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        enrolment = Convert.ToInt64(row.Cells[1].Text);

                        cr_no = Year + "/" + auto_inc + "/" + enrolment + "/" + ega_id;
                        auto_inc = auto_inc + 1;

                        string qq = @"INSERT INTO Certificate (cr_no, Ega_id, Student_id, Certificate_status) Values 
                        ('" + cr_no + "', '" + ega_id + "', '" + enrolment + "', 'yes')";

                        SqlCommand cmd1 = new SqlCommand(qq, conn1);
                        cmd1.ExecuteNonQuery();
                        rows++;
                    }
                    conn1.Close();
                    Response.Write("<script>alert('" + rows + " certificate generated')</script>");
                }
                //Response.Redirect("Certificate.aspx?id="+ ega_id);
            }
        }
    }
}