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
    public partial class Zone : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
            DropDownList1.Items.Insert(0, new ListItem("--Select Zone--", "--Select Zone--"));

        }

        protected void Display()
        {
            try
            {
                conn.Open();
                string q1 = "select * from ZONE_MAST";

                SqlDataAdapter adp = new SqlDataAdapter(q1, conn);
                DataTable dt = new DataTable();

                adp.Fill(dt);

                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                conn.Close();
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int ccc = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "edit")
                {
                    Session["Zone_id"] = ccc;
                    Response.Redirect("addZone.aspx");
                }
                if (e.CommandName == "delete")
                {
                    Session["Zone_id"] = ccc;
                    int id = Convert.ToInt32(Session["Zone_id"].ToString());
                    string query = @"delete from ZONE_MAST where Zone_id=" + id;
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
                    {
                        conn.Open();
                        cmd = new SqlCommand(query, conn);
                        cmd.ExecuteNonQuery();
                    }

                    Response.Redirect("Zone.aspx");
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void AddZone_Click(object sender, EventArgs e)
        {
            Session.Remove("Zone_id");
            Response.Redirect("addZone.aspx");
        }

        protected void ZoneButton_Click(object sender, EventArgs e)
        {
            try
            {
                string tempZoneName = Convert.ToString(DropDownList1.SelectedItem);
                string query = @"select * from ZONE_MAST where Zone_name like '%" + tempZoneName + "%'";

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
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            //GridViewRow row = GridView1.Rows[GridView1.EditIndex];
            //TextBox txtStartTime = (TextBox)row.FindControl("");
            //Display();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //int i = e.RowIndex;

            //int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);

            //string q2 = @"delete from ZONE_MAST where Zone_id=@Zone_id";

            //conn.Open();
            //cmd = new SqlCommand(q2, conn);
            //cmd.Parameters.AddWithValue("@Zone_id", id);

            //cmd.ExecuteNonQuery();
            //conn.Close();

            //GridView1.EditIndex = -1;
            //Display();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //int i = e.RowIndex;

            //int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);
            //TextBox name = (TextBox)GridView1.Rows[i].Cells[1].Controls[0];

            //string q2 = @"Update ZONE_MAST set Zone_name=@Zone_name where Zone_id=@Zone_id";

            //conn.Open();
            //cmd = new SqlCommand(q2, conn);
            //cmd.Parameters.AddWithValue("@Zone_id", id);
            //cmd.Parameters.AddWithValue("@Zone_name", name.Text);

            //cmd.ExecuteNonQuery();
            //conn.Close();

            //GridView1.EditIndex = -1;
            //Display();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //GridView1.EditIndex = -1;
            //Display();
        }
    }
}