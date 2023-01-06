using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GTU_Portal
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string query = 
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
                        string q2 = @"delete from LOI where L_id = " + rows;

                        SqlCommand cmd2 = new SqlCommand(q2, conn);
                        conn.Open();
                        cmd2.ExecuteNonQuery();
                        // Label3.Text = rows + " recorded inserted";
                        Response.Redirect("~/LOI.aspx");

                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + (ex.Message) + "')</script>");
                }
            }

        }

        protected void Search_Click(object sender, EventArgs e)
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query = @"SELECT l.L_id, l.File_Name, l.Uploaded_File, l.Date, cm.C_name FROM LOI AS l INNER JOIN COLLEGE_MAST AS cm ON cm.C_id = l.C_id
                                    where YEAR(l.Date) = '" + Year.Text + "'  ORDER BY l.L_id DESC";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    GridView1.DataSourceID = null;
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "');</script>");
            }
        }
}
}