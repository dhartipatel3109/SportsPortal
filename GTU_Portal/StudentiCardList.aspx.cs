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
    public partial class StudentiCardList : System.Web.UI.Page
    {
        int ega_id;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
        SqlCommand cmd = null;

        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        private static string gamename, gamedate;
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
                            string q1 = @"select distinct evt.Event_name, gm.Game_name, egd.Game_date,egd.Event_type from Event_Game_Assign_student egas
                                        join Event_Game_Assign ega on ega.Ega_id = egas.Ega_id
                                        join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                                        join Event evt on evt.Event_id = egd.Event_id
                                        join GAME_MAST gm on gm.Game_id = egd.Game_id
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
                                    EventName.InnerText = dr["Event_name"].ToString();
                                    GameName.InnerText = dr["Game_name"].ToString();
                                    GameDate.InnerText = dr["Game_date"].ToString();
                                    EventType.InnerText = dr["Event_type"].ToString();

                                    gamename = dr["Game_name"].ToString();
                                    gamedate = dr["Game_date"].ToString();
                                }
                            }
                            conn.Close();
                        }
                    }

                    if (ega_id != 0 || ega_id != null)
                    {
                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            conn.Open();
                            string q1 = @"select ega.Ega_id, egas.Student_id,sm.Student_name,sm.Student_mobile,sm.Student_email, cm.C_name from Event_Game_Assign_student egas 
                                    join Event_Game_Assign ega on ega.Ega_id = egas.Ega_id
                                    join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                                    join Event evt on evt.Event_id = egd.Event_id
                                    join GAME_MAST gm on gm.Game_id = egd.Game_id
                                    join STUDENT_MAST sm ON sm.Student_id = egas.Student_id
                                    join COLLEGE_MAST cm on cm.C_id = sm.Student_college
                                    where ega.Ega_id = '" + ega_id + "' and sm.Student_college = '" + Session["C_id"].ToString() + "'";

                            SqlCommand cmd = new SqlCommand(q1, conn);


                            SqlDataAdapter adp = new SqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            adp.Fill(dt);

                            GridView1.DataSourceID = null;
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            conn.Close();
                        } 
                    }
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Int64 studentid;
            try
            {
                studentid = Convert.ToInt64(e.CommandArgument.ToString());

                if (e.CommandName == "download")
                {
                    iCard.Visible = true;
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        conn.Open();
                        string qq = @"select stu.Student_name, clg.C_name, stu.Student_pic_path from STUDENT_MAST stu
                                    join COLLEGE_MAST clg on clg.C_id = stu.Student_college where stu.Student_id = '" + studentid + "'";

                        SqlCommand cmd = new SqlCommand(qq, conn);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                gametxt.Text = gamename.ToString();
                                studentnametxt.Text = reader.GetString(0);
                                studentclgtxt.Text = reader.GetString(1);
                                gamedatetxt.Text = gamedate.ToString();
                                student_img.ImageUrl = reader.GetString(2);
                            }
                        }
                        conn.Close();
                    }

                    Session["ctrls"] = iCard;
                    ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=800px,width=800px,scrollbars=1');</script>");


                    //Downloading logic
                    //System.IO.MemoryStream ms = new System.IO.MemoryStream();

                    //Response.ContentType = "application/pdf";
                    //Response.AddHeader("content-disposition", "attachment;filename = " + studentid + "/" + gamename +".pdf");
                    //Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    //StringWriter sw = new StringWriter();
                    //HtmlTextWriter hw = new HtmlTextWriter(sw);
                    //iCard.RenderControl(hw);
                    //StringReader sr = new StringReader(sw.ToString());
                    //Document pdfDoc = new Document(PageSize.A4.Rotate(), 10f, 10f, 100f, 0f);
                    //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    ////PdfWriter writer = PdfWriter.GetInstance(pdfDoc, ms);

                    //PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

                    //pdfDoc.Open();
                    //htmlparser.Parse(sr);
                    //pdfDoc.Close();

                    //byte[] bytes = ms.ToArray();
                    //ms.Close();
                }
            }
            catch
            {
                throw;
            }
        }
        
    }
}