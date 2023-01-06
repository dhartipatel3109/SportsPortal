using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GTU_Portal
{   
    public partial class WebForm6 : System.Web.UI.Page
    {
        private static int i = 0;

        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection cn = new SqlConnection(CS))
                {
                    string query = @"insert into Notification values('" + TextBox1.Text + "', '" + DateTime.Now + "')";

                    SqlCommand cmd = new SqlCommand(query, cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();

                    //notify
                    i++;
                    Session["Notify"] = i;

                    Label1.Text = "Message Sent.";
                    TextBox1.Text = "";
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                //Response.Redirect("<script>alert('Somthing went wrong....plz try again')</script>");
                throw;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection cn = new SqlConnection(CS))
                {
                    string query = @"insert into Game_Circular values('" + TextBox2.Text + "','"+"PDF/"+fileupload.FileName+"')";
                    String p = Server.MapPath("PDF");
                    fileupload.SaveAs(p + "/" + fileupload.FileName);
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();

                    //notify                    

                    Label2.Text = "Message Sent.";
                    TextBox2.Text = "";
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                //Response.Redirect("<script>alert('Somthing went wrong....plz try again')</script>");
                throw;
            }
        }
    }
}