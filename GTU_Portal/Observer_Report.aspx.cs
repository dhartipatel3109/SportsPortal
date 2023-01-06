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
    public partial class WebForm26 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OpenPDF(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = (LinkButton)sender;
                if (lnk != null)
                {
                    Response.AddHeader("content-disposition", "attachment; filename=" + lnk.CommandArgument);
                    Response.WriteFile(Server.MapPath(lnk.CommandArgument.ToString()));
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rows;
            rows = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "status")
            {

                try
                {
                    string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        string q2 = @"delete from Observer_Report where Observer_id = " + rows;

                        SqlCommand cmd2 = new SqlCommand(q2, conn);
                        conn.Open();
                        cmd2.ExecuteNonQuery();
                        // Label3.Text = rows + " recorded inserted";
                        Response.Redirect("~/Observer_Report.aspx");

                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + (ex.Message) + "')</script>");
                }
            }

        }
    }
}