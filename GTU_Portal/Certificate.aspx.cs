using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;

namespace GTU_Portal
{
    public partial class Ceritificate1 : System.Web.UI.Page
    {
        //static int sr = 00001;
        //string Year = DateTime.Parse(DateTime.Now.ToString()).Year.ToString();
        string cr_id;

        string Team;
        private static string email;
        private static int i = 0;
        private static int ega_id = 0;
 
        private static Int64 enrol;

        private static int srrr = 00001;
        private string Year = DateTime.Parse(DateTime.Now.ToString()).Year.ToString();

        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Int64 stu_id = 0;
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && Request.QueryString["id"] != string.Empty)
                {
                    cr_id = Request.QueryString["id"].ToString();
                    using (SqlConnection cn = new SqlConnection(CS))
                    {
                        cn.Open();
                        string q1 = @"select distinct cr.cr_no, stu.Student_id, stu.Student_name, clg.C_name as 'Student College', gm.Game_name, ev.Event_name, clg1.C_name as 'Assign clg', egd.Game_date from Certificate cr
                                        join Event_Game_Assign ega on ega.Ega_id = cr.Ega_id
                                        join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                                        join Event ev on ev.Event_id = egd.Event_id
                                        join GAME_MAST gm on gm.Game_id = egd.Game_id
                                        join STUDENT_MAST stu on stu.Student_id = cr.Student_id
                                        join COLLEGE_MAST clg on clg.C_id = stu.Student_college
                                        join COLLEGE_MAST clg1 on clg1.C_id = ega.C_id where cr.cr_no='"+cr_id+"'";

                        SqlCommand cmd = new SqlCommand(q1, cn);
                        
                        SqlDataReader rd = cmd.ExecuteReader();
                        if (rd.HasRows)
                        {
                            while (rd.Read())
                            {
                                Name.Text = rd["Student_name"].ToString();
                                studentCollegeName.Text = rd["Student College"].ToString();
                                GameDate.Text = rd["Game_date"].ToString();
                                Game.Text = rd["Game_name"].ToString();
                                Evtname.Text = rd["Event_name"].ToString();
                                //email = rd["Student_email"].ToString();
                                hostclgname.Text = rd["Assign clg"].ToString();
                                stu_id = Convert.ToInt64(rd["Student_id"].ToString());
                            }
                        }
                        cn.Close();

                        cn.Open();
                        char[] spearator = { '/' };

                        string[] slist = cr_id.Split(spearator, StringSplitOptions.RemoveEmptyEntries);
                        enrol = Convert.ToInt64(slist[2].ToString());
                        ega_id = Convert.ToInt32(slist[3].ToString());

                        string qq = @"select egas.Win_Level from Event_Game_Assign_student egas
                                    where egas.Student_id = '"+ enrol +"' and egas.Ega_id = "+ega_id;

                        SqlCommand cmd1 = new SqlCommand(qq, cn);
                        
                        SqlDataReader rd1 = cmd1.ExecuteReader();
                        if (rd1.HasRows)
                        {
                            while (rd1.Read())
                            {
                                int lvl = Convert.ToInt32(rd1["Win_Level"].ToString());
                                if (lvl == 1)
                                {
                                    level.Text = "Winner";
                                }
                                else if (lvl == 2)
                                {
                                    level.Text = "1st Runner-up";
                                }
                                else if (lvl == 3)
                                {
                                    level.Text = "2nd Runner-up";
                                }
                                else
                                {
                                    level.Text = "Participation";
                                }
                                //generatetable(ega_id, stu_id);
                            }
                        }
                        cn.Close();
                    }

                    using (SqlConnection cn = new SqlConnection(CS))
                    {
                        cn.Open();
                        string q1 = @"truncate table Vendar";
                        SqlCommand cmd = new SqlCommand(q1, cn);
                        cmd.ExecuteNonQuery();
                        cn.Close();
                    }
                }
            }
        }

        protected void generatetable(int ega_id, Int64 enrolment)
        {
            //IronPdf.AspxToPdf.RenderThisPageAsPdf(IronPdf.AspxToPdf.FileBehavior.InBrowser,"pdf.pdf");

            i++;
            System.IO.MemoryStream ms = new System.IO.MemoryStream();

            string filename = enrolment + "/" + ega_id;

            Certificate.Visible = true;
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename = Certificates/" + filename + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Certificate.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4.Rotate(), 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, ms);

            //PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();

            byte[] bytes = ms.ToArray();
            ms.Close();

            //string cr_no = Year + "/" + srrr;
            //srrr = srrr + 1;

            //using (SqlConnection cn = new SqlConnection(CS))
            //{
            //    cn.Open();
            //    string qq = @"insert into Certificate values ('" + cr_no + "','" + ega_id + "','" + enrolment + "','" + filename + "',' Certificates/" + filename + "') ";
            //    SqlCommand cmd = new SqlCommand(qq, cn);
            //    cmd.ExecuteNonQuery();
            //    cn.Close();
            //}

            //MailMessage message = new MailMessage();
            //message.From = new MailAddress("rajpatel2111998@gmail.com");
            //message.To.Add(new MailAddress(email));

            ////string mailbody = "Certificate";
            //message.Attachments.Add(new Attachment(new MemoryStream(bytes), +i + ".pdf"));
            //message.Subject = "GTU Technological University - Sports Portal Registration";
            ////message.Body = "<body style='background-color: white'><form id='form1'> <div id='Certificate' runat='server'><div class='container' style='padding: 5%; text-align: center; background-color: white; border-radius: 16px; background-image: url('ri_1.png'); background-repeat: no-repeat; background-size: cover'> <div class='row'><div style='height: 100px'><br /> <br /> <img src='logo.png' style='padding-left: 20px' alt='GTU Logo' height='70px' width='90px'></div> <h1 style='font-size: 35px; color: #227093'>Gujarat Technical University</h1><h3 style='font-size: 20px; color: #227093'>Certificate Of <b class='b' style='color: red; font-size: 25px'>Participation</b></h3><i class='fa fa-certificate' style='font-size: 50px; color: green'></i><h3 class='w3' style='font-size: 20px;'>This Certificate is given to</h3><h2 style='font-size: 35px; text-transform: uppercase; color: #FF3399'><span id='dname'></span>'"+ Name.Text + "'</h2><h3 class='w3' style='font-size: 20px;'>Active student of,</h3> <h2 style='font-size: 30px; color: #054d9a'><span id='dage'></span><asp:Label id='CollegeName' runat='server'></asp:Label> </h2> <h3 class='w3' style='font-size: 20px;'>has participated in <b class='b'><asp:Label id='Game' runat='server'></asp:Label></b>competition of <b class='b'> <asp:Label id='Evtname' runat='server'></asp:Label></b>.</h3> <br /> <div style='display: inline-blok; height: 120px'><div style='float: left; width: 20%; border-width: 7%; margin-left: 10%'><h4>14 Feb, 2020</h4> <p style='border-bottom: 5px solid black; border: 0 0 5px 0;'></p><h4 style='text-align: center'><asp:Label id='GameDate' runat='server'></asp:Label> </h4></div><div style='float: right; width: 20%; border-width: 7%; margin-right: 10%'><h4>Navin Sheth</h4><p style='border-bottom: 5px solid black; border: 0 0 5px 0;'></p><h4 style='text-align: center'>SECRETERY</h4></div> </div></div></div><br /> <br /> </div> </form></body></body>";
            //message.BodyEncoding = Encoding.UTF8;
            //message.IsBodyHtml = true;
            //SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            //System.Net.NetworkCredential basicCredential1 = new
            //System.Net.NetworkCredential("rajpatel2111998@gmail.com", "viru2106");
            //client.EnableSsl = true;
            //client.UseDefaultCredentials = false;
            //client.Credentials = basicCredential1;
            //try
            //{
            //    client.Send(message);
            //}

            //catch (Exception ex)
            //{
            //    throw ex;
            //}


        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        
        protected void create_pdf_Click(object sender, EventArgs e)
        {
            Session["ctrls"] = Certificate;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=800px,width=800px,scrollbars=1');</script>");
        }
    }
}




//public static void UploadImage(string imageData)
//{
//    string fileNameWitPath = "~/Client/ScreenShot/custom_name.png";
//    using (FileStream fs = new FileStream(fileNameWitPath, FileMode.Create))
//    {
//        using (BinaryWriter bw = new BinaryWriter(fs))
//        {
//            byte[] data = Convert.FromBase64String(imageData);//convert from base64
//            bw.Write(data);
//            bw.Close();


//            MailMessage message = new MailMessage();
//            message.From = new MailAddress("rajpatel2111998@gmail.com");
//            message.To.Add(new MailAddress(email));

//            string mailbody = "result";
//            message.Attachments.Add(new Attachment(new MemoryStream(data),"result.jpg"));
//            message.Subject = "GTU Technological University - Sports Portal Registration";
//            message.Body = mailbody;
//            message.BodyEncoding = Encoding.UTF8;
//            message.IsBodyHtml = true;
//            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
//            System.Net.NetworkCredential basicCredential1 = new
//            System.Net.NetworkCredential("rajpatel2111998@gmail.com", "viru2106");
//            client.EnableSsl = true;
//            client.UseDefaultCredentials = false;
//            client.Credentials = basicCredential1;
//            try
//            {
//                client.Send(message);
//            }

//            catch (Exception ex)
//            {
//                //Response.Redirect("ErrorPage.aspx");
//                throw ex;
//            }

//        }
//    }
//}