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
    public partial class WebForm28 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(CS))
            {
                conn.Open();
                string q1 = @"select cr.cr_no,stu.Student_id,stu.Student_name,stu.Student_mobile,stu.Student_email,gm.Game_name,clg.C_name as 'Assign Clg',ega.Ega_id,clg1.C_name as 'Student College'  from Certificate cr
                                join Event_Game_Assign ega on ega.Ega_id = cr.Ega_id
                                join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Ega_id
                                join Event ev on ev.Event_id = egd.Event_id
                                join GAME_MAST gm on gm.Game_id = egd.Game_id
                                join STUDENT_MAST stu on stu.Student_id = cr.Student_id
                                join COLLEGE_MAST clg on clg.C_id = ega.C_id
                                join COLLEGE_MAST clg1 on clg1.C_id = stu.Student_college
                                where ega.Ega_id = '" + Session["Ega_id"] + "' ";

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


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                string ccc = e.CommandArgument.ToString();

                if (e.CommandName == "Certificate")
                {
                    Response.Redirect("Certificate.aspx?id="+ccc);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }
    }
}