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
    public partial class State : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
            //DropDownList1.Items.Insert(0, new ListItem("--Select State--", "--Select State--"));

        }

        protected void Display()
        {
            try
            {
                conn.Open();
                string q1 = "select * from STATE_MAST";

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


        protected void StateButton_Click(object sender, EventArgs e)
        {
            try
            {
                string tempStateName = Convert.ToString(DropDownList1.SelectedItem);
                string query = @"select * from STATE_MAST where State_name like '%" + tempStateName + "%'";

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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int ccc = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "edit")
                {
                    Session["State_id"] = ccc;
                    Response.Redirect("addState.aspx");
                }
                if (e.CommandName == "delete")
                {
                    Session["State_id"] = ccc;
                    int id = Convert.ToInt32(Session["State_id"].ToString());
                    string query = @"delete from STATE_MAST where State_id=" + id;
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
                    {
                        conn.Open();
                        cmd = new SqlCommand(query, conn);
                        cmd.ExecuteNonQuery();
                    }

                    Response.Redirect("State.aspx");
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void AddState_Click(object sender, EventArgs e)
        {
            Session.Remove("State_id");
            Response.Redirect("addState.aspx");
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

            //string q2 = @"delete from STATE_MAST where State_id=@State_id";

            //conn.Open();
            //cmd = new SqlCommand(q2, conn);
            //cmd.Parameters.AddWithValue("@State_id", id);

            //cmd.ExecuteNonQuery();
            //conn.Close();

            //GridView1.EditIndex = -1;
            //Display();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //int i = e.RowIndex;

            //int id = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
            //TextBox name = (TextBox)GridView1.Rows[i].Cells[3].Controls[0];

            //string q2 = @"Update STATE_MAST set State_name=@State_name where State_id=@State_id";

            //conn.Open();
            //cmd = new SqlCommand(q2, conn);
            //cmd.Parameters.AddWithValue("@State_id", id);
            //cmd.Parameters.AddWithValue("@State_name", name.Text);

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

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

    }
}