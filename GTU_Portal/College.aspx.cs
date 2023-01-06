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
    public partial class College : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
        }

        protected void Display()
        {
            try
            {
                conn.Open();
                string q1 = @"select c.C_id, c.C_name, city.City_name, zone.Zone_name from COLLEGE_MAST c
                            join CITY_MAST city on city.City_id = c.C_city
                            join ZONE_MAST zone on zone.Zone_id = c.C_zone";

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
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void CollegeButton_Click(object sender, EventArgs e)
        {
            try
            {
                string query = @"select c.C_id, c.C_name, city.City_name, zone.Zone_name from COLLEGE_MAST c
                            join CITY_MAST city on city.City_id = c.C_city
                            join ZONE_MAST zone on zone.Zone_id = c.C_zone where C_name like '%" + CollegeNameTextBox.Text + "%'";

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
                //Response.Redirect("ErrorPage.aspx");
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
                    Session["C_id"] = ccc;
                    Response.Redirect("addCollege.aspx");
                }
                if (e.CommandName == "delete")
                {
                    Session["C_id"] = ccc;
                    int id = Convert.ToInt32(Session["C_id"].ToString());
                    string query = @"delete from COLLEGE_MAST where C_id=" + id;
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
                    {
                        conn.Open();
                        cmd = new SqlCommand(query, conn);
                        cmd.ExecuteNonQuery();
                    }

                    Response.Redirect("College.aspx");
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void AddCollege_Click(object sender, EventArgs e)
        {
            Session.Remove("C_id");
            Response.Redirect("addCollege.aspx");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridView1.EditIndex = e.NewEditIndex;
            //GridViewRow row = GridView1.Rows[GridView1.EditIndex];
            //TextBox txtStartTime = (TextBox)row.FindControl("");
            //Display();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //int i = e.RowIndex;

            //int id = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);

            //string q2 = @"delete from COLLEGE_MAST where C_id=@C_id";

            //conn.Open();
            //cmd = new SqlCommand(q2, conn);
            //cmd.Parameters.AddWithValue("@C_id", id);

            //cmd.ExecuteNonQuery();
            //conn.Close();

            //GridView1.EditIndex = -1;
            //Display();
        }

        //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    int i = e.RowIndex;

        //    int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);
        //    TextBox name = (TextBox)GridView1.Rows[i].Cells[1].Controls[0];

        //    string q2 = @"Update COLLEGE_MAST set C_name=@C_name where C_id=@C_id";

        //    conn.Open();
        //    cmd = new SqlCommand(q2, conn);
        //    cmd.Parameters.AddWithValue("@C_id", id);
        //    cmd.Parameters.AddWithValue("@C_name", name.Text);

        //    cmd.ExecuteNonQuery();
        //    conn.Close();

        //    GridView1.EditIndex = -1;
        //    Display();
        //}

        //protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    GridView1.EditIndex = -1;
        //    Display();
        //}
    }
}