using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
//using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace GTU_Portal
{
    public partial class Manage2 : System.Web.UI.Page
    {
        string eventValue = null;
        string eventName = null;
        private static string email;
        private static int count = 0;

        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Event_id"] != null)
                {
                    eventValue = Session["Event_id"].ToString();

                    string query = @"select Event_name from Event where Event_id = '" + eventValue + "'";
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand(query, conn);
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                eventName = reader.GetString(0);
                            }
                        }
                        else
                        {
                            Console.WriteLine("No rows found.");
                        }
                    }
                    EventNameLabelBox.Text = eventName;
                }
                else
                {
                    EventNameLabelBox.Text = "";
                }

            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");                
            }

        }

        protected void BoyButton_Click(object sender, EventArgs e)
        {
            try
            {
                string gameID, gameName, gameDate;
                string gender = "Boys";
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    gameID = ((TextBox)GridView1.Rows[i].FindControl("Label1")).Text.Trim().ToString();
                    gameName = ((TextBox)GridView1.Rows[i].FindControl("Label2")).Text.Trim().ToString();
                    gameDate = ((TextBox)GridView1.Rows[i].FindControl("txtdate1")).Text.Trim();

                    DateTime currentDate = DateTime.Now;
                    TimeSpan difference = Convert.ToDateTime(gameDate) - currentDate;

                    if(difference.Days < 0)
                    {
                        Response.Write("<script>alert('Date should be greater than today's date')</script>");
                        break;                        
                    }

                    RadioButtonList cbList = (RadioButtonList)GridView1.Rows[i].FindControl("EventTypeCheckBoxList1");
                    CheckBox cb = ((CheckBox)GridView1.Rows[i].FindControl("CheckBox1"));
                    //var checkedButton = GridView1.Controls.OfType<RadioButton>()
                    //                  .FirstOrDefault(r => r.Checked);

                    if (cb.Checked && gameDate != "")
                    {
                        //genderId = hdnfldVariable.Value;
                        //Label3.Text = genderId;

                        foreach (System.Web.UI.WebControls.ListItem item in cbList.Items)
                        {

                            // CheckBoxList cbl = (CheckBoxList)GridView1.Rows[i].FindControl("EventForCheckBoxList");
                            //for (int m = 0; m < cb.Items.Count; m++)
                            //{
                            if (item.Selected)
                            {
                                string eventType = item.Value;
                                using (SqlConnection conn = new SqlConnection(CS))
                                {
                                    string qq1 = @"select * from Event_Game_Detail_Extra egd where egd.Event_id = '"+ eventValue + "' and egd.Game_id = '"+ gameID + "' and egd.Gender='"+ gender+"'";
                                    conn.Open();
                                    SqlCommand cmd1 = new SqlCommand(qq1, conn);
                                    SqlDataReader reader1 = cmd1.ExecuteReader();
                                    if (reader1.HasRows)
                                    {
                                        Response.Write("<script>alert('This game along for Boys is already created...')</script>");
                                        break;
                                    }
                                    conn.Close();

                                    conn.Open();
                                    string q2 = @"insert into Event_Game_Detail_Extra(Event_id,Game_id,Game_date,Gender,Event_type) values 
                                                ('" + eventValue + "','" + gameID + "','" + gameDate + "','" + gender + "','" + eventType + "');";

                                    SqlCommand cmd2 = new SqlCommand(q2, conn);
                                    int rows = cmd2.ExecuteNonQuery();
                                    
                                    // Label3.Text = rows + " recorded inserted";
                                }
                                //Submit.Visible = true;
                                //Reset.Visible = false;
                            }
                            else
                            {
                                Response.Write("<script>alert('CheckBox is not selected...')</script>");
                                break;
                            }
                        }
                    }
                    Submit.Visible = true;
                    Reset.Visible = false;
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");                
            }
        }

        protected void GirlButton_Click(object sender, EventArgs e)
        {
            try
            {
                string gameID, gameName, gameDate;
                string gender = "Girls";
                for (int i = 0; i < GridView2.Rows.Count; i++)
                {
                    gameID = ((TextBox)GridView2.Rows[i].FindControl("Label1")).Text.Trim().ToString();
                    gameName = ((TextBox)GridView2.Rows[i].FindControl("Label2")).Text.Trim().ToString();
                    gameDate = ((TextBox)GridView2.Rows[i].FindControl("txtdate2")).Text.Trim();

                    DateTime currentDate = DateTime.Now;
                    TimeSpan difference = Convert.ToDateTime(gameDate) - currentDate;

                    if (difference.Days < 0)
                    {
                        Response.Write("<script>alert('Date should be greater than today's date')</script>");
                        break;
                    }

                    RadioButtonList cbList = (RadioButtonList)GridView2.Rows[i].FindControl("EventTypeCheckBoxList2");
                    CheckBox cb = ((CheckBox)GridView2.Rows[i].FindControl("CheckBox2"));
                    //var checkedButton = GridView2.Controls.OfType<RadioButton>()
                    //                  .FirstOrDefault(r => r.Checked);

                    if (cb.Checked && gameDate != "")
                    {
                        //genderId = hdnfldVariable.Value;
                        //Label3.Text = genderId;

                        foreach (System.Web.UI.WebControls.ListItem item in cbList.Items)
                        {

                            // CheckBoxList cbl = (CheckBoxList)GridView1.Rows[i].FindControl("EventForCheckBoxList");
                            //for (int m = 0; m < cb.Items.Count; m++)
                            //{
                            if (item.Selected)
                            {
                                string eventType = item.Value;
                                using (SqlConnection conn = new SqlConnection(CS))
                                {
                                    string qq2 = @"select * from Event_Game_Detail_Extra egd where egd.Event_id = '" + eventValue + "' and egd.Game_id = '" + gameID + "' and egd.Gender='" + gender + "'";
                                    conn.Open();
                                    SqlCommand cmd11 = new SqlCommand(qq2, conn);
                                    SqlDataReader reader11 = cmd11.ExecuteReader();
                                    if (reader11.HasRows)
                                    {
                                        Response.Write("<script>alert('This game along for Boys is already created...')</script>");
                                        break;
                                    }
                                    conn.Close();


                                    conn.Open();
                                    string datetime = gameDate + " " + DateTime.Now.ToShortTimeString();
                                    string q2 = @"insert into Event_Game_Detail_Extra(Event_id,Game_id,Game_date,Gender,Event_type) values 
                                                ('" + eventValue + "','" + gameID + "','" + datetime + "','" + gender + "','" + eventType + "');";

                                    //Response.Write("<script>alert('Query built...')</script>");
                                    SqlCommand cmd2 = new SqlCommand(q2, conn);
                                    //conn.Open();
                                    int rows = cmd2.ExecuteNonQuery();
                                    conn.Close();

                                    //Response.Write("<script>alert('Query fired...')</script>");
                                     Label3.Text = rows + " recorded inserted";
                                }
                            }
                        }
                    }
                }
                Submit.Visible = true;
                Reset.Visible = false;
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {
                string q = @"select egd.Egd_id, evt.Event_name, gm.Game_name, egd.Game_date, egd.Event_type, egd.Gender from Event_Game_Detail_Extra egd                                     
                                    Join GAME_MAST gm on gm.Game_id = egd.Game_id
									Join Event evt on evt.Event_id = egd.Event_id where evt.Event_status = 'yes' ";

                cn.Open();
                SqlCommand cmd = new SqlCommand(q, cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView3.DataSource = dt;
                GridView3.DataBind();

                cn.Close();
            }

            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select U_email from User_table",cn))
                {
                    count++;
                    //System.IO.MemoryStream ms = new System.IO.MemoryStream();
                    //byte[] bytes;

                    PdfPTable pt = new PdfPTable(GridView3.HeaderRow.Cells.Count);
                    Font font = new Font();
                    font.Color = new BaseColor(GridView3.HeaderStyle.ForeColor);
                    PdfPCell pc = new PdfPCell(new Phrase("Event Name : "+EventNameLabelBox.Text, font)) { HorizontalAlignment = iTextSharp.text.Element.ALIGN_CENTER };
                    pc.Colspan = 5;
                    pc.BackgroundColor = new BaseColor(GridView3.HeaderStyle.BackColor);
                    pt.AddCell(pc);

                    foreach (TableCell tb in GridView3.HeaderRow.Cells)
                    {
                        font = new Font();
                        font.Color = new BaseColor(GridView3.HeaderStyle.ForeColor);

                        pc = new PdfPCell(new Phrase(tb.Text, font));
                        pc.BackgroundColor = new BaseColor(GridView3.HeaderStyle.BackColor);
                        pt.AddCell(pc);
                    }

                    foreach (GridViewRow gd in GridView3.Rows)
                    {
                        foreach(TableCell tc in gd.Cells)
                        {                           
                            pc = new PdfPCell(new Phrase(tc.Text));                         
                            pt.AddCell(pc);
                        }
                    }
                    
                    Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
                    //PdfWriter.GetInstance(pdfDoc, ms);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

                    pdfDoc.Open();
                    pdfDoc.Add(pt);
                    pdfDoc.Close();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename="+eventName+".pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    
                    cn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    //if (dr.HasRows)
                    //{
                    //    while (dr.Read())
                    //    {                            
                    //        email = dr["U_email"].ToString();

                    //        bytes = ms.ToArray();
                    //        ms.Close();


                    //        MailMessage message = new MailMessage();
                    //        message.From = new MailAddress("rajpatel2111998@gmail.com");
                    //        message.To.Add(new MailAddress(email));

                    //        string mailbody = "Games";
                    //        message.Attachments.Add(new Attachment(new MemoryStream(bytes), eventName+".pdf"));
                    //        message.Subject = "GTU Technological University - Sports Portal Registration";
                    //        message.Body = mailbody;
                    //        message.BodyEncoding = Encoding.UTF8;
                    //        message.IsBodyHtml = true;                            
                    //        SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                    //        System.Net.NetworkCredential basicCredential1 = new
                    //        System.Net.NetworkCredential("rajpatel2111998@gmail.com", "viru2106");
                    //        client.EnableSsl = true;
                    //        client.UseDefaultCredentials = false;
                    //        client.Credentials = basicCredential1;
                    //        try
                    //        {
                    //            client.Send(message);
                    //        }

                    //        catch (Exception)
                    //        {
                    //            //Response.Write("<script>alert('Email is not sent....try again. '"+ ex.Message +"'')</script>");
                    //            //return;                                
                    //            throw;
                    //        }

                    //    }
                    //    cn.Close();                        
                    //}                    
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        //protected void GridView3_DataBound(object sender, EventArgs e)
        //{
        //    GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
        //    TableHeaderCell cell = new TableHeaderCell();
        //    cell.Text = "Customers";
        //    cell.ColumnSpan = 5;
        //    row.Controls.Add(cell);

        //    //row.BackColor = ColorTranslator.FromHtml("#3AC0F2");
        //    GridView3.HeaderRow.Parent.Controls.AddAt(0, row);
        //}
    }
}


//CheckBoxList cb = (CheckBoxList)GridView1.Rows[i].FindControox1l("EventForCheckBoxList");
//foreach (ListItem item in cb.Items)
//{
//    // CheckBoxList cbl = (CheckBoxList)GridView1.Rows[i].FindControl("EventForCheckBoxList");
//    //for (int m = 0; m < cb.Items.Count; m++)
//    //{
//    if (item.Selected)
//    {
//        threesss = item.Text;
//        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
//        using (SqlConnection conn = new SqlConnection(CS))
//        {
//            string q2 = @"insert into Event_Game_Detail(Event_id,Game_id,Gender,Game_startDate) values ('" + eventValue + "','" + one + "','" + threesss.ToString() + "','" + txtdate + "');";

//            SqlCommand cmd2 = new SqlCommand(q2, conn);
//            conn.Open();
//            int rows = cmd2.ExecuteNonQuery();
//            Label3.Text = rows + " recorded inserted";
//        }
//    }
//    //}