using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GTU_Portal
{
    public partial class WebForm21 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {

                using (SqlConnection conn = new SqlConnection(CS))
                {
                    if (fileupload.HasFile)
                    {
                        string fileName = Path.GetFileName(fileupload.PostedFile.FileName);
                        fileupload.PostedFile.SaveAs(Server.MapPath("~/Gallery Photo/") + fileName);
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }

                    //if (fileupload.HasFile)
                    //{
                    //    int length = fileupload.PostedFile.ContentLength;
                    //    byte[] imgbyte = new byte[length];
                    //    HttpPostedFile img = fileupload.PostedFile;
                    //    //set the binary data
                    //    img.InputStream.Read(imgbyte, 0, length);
                    //    string filename = Path.GetFileName(fileupload.PostedFile.FileName);

                    //    string query = @"insert into Gallery values ('" + imgbyte + "')";
                    //    SqlCommand cmd = new SqlCommand(query, conn);
                    //    conn.Open();
                    //    cmd.ExecuteNonQuery();
                    //    Label2.Text = "Message Sent.";

                    //}
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }
    }
}