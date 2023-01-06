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
    public partial class pratrak1 : System.Web.UI.Page
    {
        private static int Report;

        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["ctrls"] = Print;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=800px,width=800px,scrollbars=1');</script>");

        }

        protected void formload(object sender, EventArgs e)
        {
            ModalPopupExtender10.Show();
        }

        protected void Button26_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button27_Click(object sender, EventArgs e)
        {

        }

        protected void btn_upload_pdf_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.PostedFile != null)
                {
                    using (SqlConnection cn = new SqlConnection(CS))
                    {
                        string query = @"insert into Observer_Report values('" + TextBox2.Text + "','" + "PDF/" + FileUpload1.FileName + "')";
                        String p = Server.MapPath("PDF");
                        FileUpload1.SaveAs(p + "/" + FileUpload1.FileName);
                        SqlCommand cmd = new SqlCommand(query, cn);
                        cn.Open();
                        cmd.ExecuteNonQuery();
                        cn.Close();

                        //notify                    
                        Report++;
                        Session["Report"] = Report;

                        TextBox2.Text = "";
                    } 
                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                //Response.Redirect("<script>alert('Somthing went wrong....plz try again')</script>");
               // throw;
            }
        }

        protected void formPrint_Click(object sender, EventArgs e)
        {
            //System.IO.MemoryStream ms = new System.IO.MemoryStream();

            //Utpal.Visible = true;
            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-disposition", "attachment;filename = Certificates/Utpal.pdf");
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);
            //Utpal.RenderControl(hw);
            //StringReader sr = new StringReader(sw.ToString());
            //Document pdfDoc = new Document(PageSize.A4.Rotate(), 10f, 10f, 100f, 0f);
            //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //PdfWriter writer = PdfWriter.GetInstance(pdfDoc, ms);

            ////PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            //pdfDoc.Open();
            //htmlparser.Parse(sr);
            //pdfDoc.Close();

            //byte[] bytes = ms.ToArray();
            //ms.Close();

            Session["ctrls"] = Print;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=800px,width=800px,scrollbars=1');</script>");

        }
    }
}