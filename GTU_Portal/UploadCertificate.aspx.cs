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
    public partial class WebForm20 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (conn)
                {
                    conn.Open();
                    string q = @"select ega.Ega_id, egd.Egd_id, evnt.Event_name, gm.Game_name, egd.Gender, egd.Event_type, zn.Zone_name, clg.C_name, ega.Result_Status from Event_Game_Assign ega 
                            join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id 
                            join Event evnt on evnt.Event_id = egd.Event_id 
                            join GAME_MAST gm on gm.Game_id = egd.Game_id 
                            join ZONE_MAST zn on zn.Zone_id = ega.Zone_id 
                            join COLLEGE_MAST clg on clg.C_id = ega.C_id 
                            where evnt.Event_status = 'yes' and ega.C_id='"+ Session["C_id"] +"'";

                    SqlCommand cmd = new SqlCommand(q, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    conn.Close();
                }
            }
        }

        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        string bl = (e.Row.Cells[8].Text);
        //        if (bl.ToString() == "no")
        //        {
        //            LinkButton link = (LinkButton)e.Row.Cells[8].FindControl("LinkButton1");
        //            link.ForeColor = System.Drawing.Color.Red;
        //            link.Enabled = false;
        //        }
        //    }
        //}

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ega_id;
            ega_id = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "result")
            {
                try
                {
                    string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        string q2 = @"select distinct Result_Status from Event_Game_Assign where Ega_id = '" + ega_id +"' and Result_Status = 'yes'";

                        conn.Open();
                        SqlCommand cmd2 = new SqlCommand(q2, conn);
                        SqlDataReader rd = cmd2.ExecuteReader();
                        if (rd.HasRows)
                        {
                            Response.Redirect("EventResult.aspx?id=" + ega_id);
                        }
                        else
                        {   
                            Response.Write("<script>alert('Sorry, You cannot upload certificate... please Upload Result for this Event then after you can')</script>");
                        }
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