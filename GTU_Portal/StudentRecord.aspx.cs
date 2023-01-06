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
using AjaxControlToolkit;

namespace GTU_Portal
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        private static int Game_id;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
        SqlCommand cmd = null;

        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        conn.Open();
                        string q1 = @"select distinct evt.Event_name, gm.Game_name, egd.Game_date,egd.Event_type from Event_Game_Assign_student egas
                                                join Event_Game_Assign ega on ega.Ega_id = egas.Ega_id
                                                join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                                                join Event evt on evt.Event_id = egd.Event_id
                                                join GAME_MAST gm on gm.Game_id = egd.Game_id
                                                    where ega.Ega_id = '" + Session["Eli_id"] + "' ";

                        SqlCommand cmd = new SqlCommand(q1, conn);


                        SqlDataAdapter adp = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adp.Fill(dt);

                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dt.Rows.Count > 0)
                        {
                            if (dr.Read())
                            {
                                EventName.InnerText = dr["Event_name"].ToString();
                                GameName.InnerText = dr["Game_name"].ToString();
                                GameDate.InnerText = dr["Game_date"].ToString();
                                EventType.InnerText = dr["Event_type"].ToString();
                                Label1.InnerText = dr["Event_name"].ToString();
                                Label2.InnerText = dr["Game_name"].ToString();
                                Label3.InnerText = dr["Game_date"].ToString();
                                Label4.InnerText = dr["Event_type"].ToString();
                            }
                        }
                        conn.Close();
                    }

                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        conn.Open();
                        string q1 = @"select distinct egas.Team_id,egas.Egas_id, egas.Student_id,sm.Student_name,sm.Student_mobile,sm.Student_email,cm.C_name, egd.Game_date, egd.Gender, egd.Event_type, evt.Event_name, gm.Game_name from Event_Game_Assign_student egas 
                                            join Event_Game_Assign ega on ega.Ega_id = egas.Ega_id
                                            join Event_Game_Detail_Extra egd on egd.Egd_id = ega.Egd_id
                                            join Event evt on evt.Event_id = egd.Event_id
                                            join GAME_MAST gm on gm.Game_id = egd.Game_id
                                            join STUDENT_MAST sm ON sm.Student_id = egas.Student_id
                                            join COLLEGE_MAST cm on cm.C_id = sm.Student_college
                                                where ega.Ega_id = '" + Session["Eli_id"] + "' ";

                        SqlCommand cmd = new SqlCommand(q1, conn);


                        SqlDataAdapter adp = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adp.Fill(dt);

                        GridView1.DataSourceID = null;
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        GridView2.DataSourceID = null;
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                        conn.Close();
                    }
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            try
            {
                for (int i = GridView1.Rows.Count - 1; i > 0; i--)
                {
                    GridViewRow row = GridView1.Rows[i];
                    GridViewRow previousRow = GridView1.Rows[i - 1];
                    for (int j = 0; j < row.Cells.Count; j++)
                    {
                        if (row.Cells[j].Text == previousRow.Cells[j].Text)
                        {
                            if (previousRow.Cells[j].RowSpan == 0)
                            {
                                if (row.Cells[j].RowSpan == 0)
                                {
                                    previousRow.Cells[j].RowSpan += 2;
                                }
                                else
                                {
                                    previousRow.Cells[j].RowSpan = row.Cells[j].RowSpan + 1;
                                }
                                row.Cells[j].Visible = false;
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void Pdf_Click(object sender, EventArgs e)
        {            
            ModalPopupExtender10.Show();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["ctrls"] = Print;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=800px,width=800px,scrollbars=1');</script>");

        }

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            try
            {
                for (int i = GridView1.Rows.Count - 1; i > 0; i--)
                {
                    GridViewRow row = GridView1.Rows[i];
                    GridViewRow previousRow = GridView1.Rows[i - 1];
                    for (int j = 0; j < row.Cells.Count; j++)
                    {
                        if (row.Cells[j].Text == previousRow.Cells[j].Text)
                        {
                            if (previousRow.Cells[j].RowSpan == 0)
                            {
                                if (row.Cells[j].RowSpan == 0)
                                {
                                    previousRow.Cells[j].RowSpan += 2;
                                }
                                else
                                {
                                    previousRow.Cells[j].RowSpan = row.Cells[j].RowSpan + 1;
                                }
                                row.Cells[j].Visible = false;
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }
    }
}