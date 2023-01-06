using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace GTU_Portal
{
    public partial class Event : System.Web.UI.Page
    {
        string newEventDate = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Event_date"] != null)
                {
                    newEventDate = Session["Event_date"].ToString();
                }
            }

            //EventDropDownList.Items.Insert(0, new ListItem("--Select Event--", "--Select Event--"));
        }

        protected void EventButton_Click(object sender, EventArgs e)
        {
            try
            {
                string query = @"select * from Event where ";
                
                string extra = EventDropDownList.SelectedItem.ToString();
                if (extra != "")
                {
                    //var id = EventDropDownList.SelectedValue;
                    query += "Event_name like '%" + extra + "%' or ";
                }
                query += " 1!=1";

                string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    //SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSourceID = null;
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            //Response.Redirect("Manage.aspx?Event"+EventDropDownList.SelectedValue);
            int rows;
            rows = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "manage")
            {
                Session["Event_id"] = rows;
                Response.Redirect("~/Manage2.aspx");

            }

            if (e.CommandName == "status")
            {

                try
                {
                    string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        string q2 = @"update Event set Event_status = 'no' where Event_id = " + rows;

                        SqlCommand cmd2 = new SqlCommand(q2, conn);
                        conn.Open();
                        cmd2.ExecuteNonQuery();
                        // Label3.Text = rows + " recorded inserted";
                        Response.Redirect("~/Event.aspx");

                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + (ex.Message) + "')</script>");
                }
            }

            //Response.Redirect(string.Format("~/Manage.aspx?Event={0}", EventDropDownList.SelectedValue));
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    string status = e.Row.Cells[3].Text;
                    Button btn = (Button)e.Row.Cells[4].FindControl("ManageButton");

                    Button StatusButton = (Button)e.Row.Cells[4].FindControl("StatusButton");

                    //Label lbl = (Label)e.Row.FindControl("Label1");
                    //lbl.Text = rowEventDate;

                    //DateTime rwEvntDt = Convert.ToDateTime(rowEventDate);
                    //DateTime nwEvntDt = Convert.ToDateTime(newEventDate);

                    if (status == "no")
                    {
                        btn.Enabled = false;
                        btn.Visible = false;
                        StatusButton.Visible = false;
                        btn.Style.Add("background-color", "red");
                    }
                    else
                    {
                        StatusButton.Visible = true;
                        btn.Enabled = true;
                        btn.Style.Add("background-color", "green");
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