using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GTU_Portal
{
    public partial class OfficeOrderForm : System.Web.UI.Page
    {
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