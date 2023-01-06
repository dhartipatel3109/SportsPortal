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
    public partial class Branch1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
            //DropDownList1.Items.Insert(0, new ListItem("--Select Branch--", "--Select Branch--"));

        }

        protected void Display()
        {
            try
            {
                conn.Open();
                string q1 = "select * from BRANCH_MAST order by Branch_id";

                SqlDataAdapter adp = new SqlDataAdapter(q1, conn);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int ccc = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "edit")
                {
                    Session["Branch_id"] = ccc;
                    Response.Redirect("addBranch.aspx");                   
                }
                if (e.CommandName == "delete")
                {
                    Session["Branch_id"] = ccc;
                    int id = Convert.ToInt32(Session["Branch_id"].ToString());
                    string query = @"delete from BRANCH_MAST where Branch_id=" + id;
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
                    {
                        conn.Open();
                        cmd = new SqlCommand(query, conn);
                        cmd.ExecuteNonQuery();
                    }

                    Response.Redirect("Branch.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }

        protected void BranchButton_Click(object sender, EventArgs e)
        {
            try
            {
                string tempBranchName = Convert.ToString(DropDownList1.SelectedItem);
                string query = @"select * from BRANCH_MAST where Branch_name like '%" + tempBranchName + "%'";
                string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
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

            //string q2 = @"delete from BRANCH_MAST where Branch_id=@Branch_id";

            //conn.Open();
            //cmd = new SqlCommand(q2, conn);
            //cmd.Parameters.AddWithValue("@Branch_id", id);

            //cmd.ExecuteNonQuery();
            //conn.Close();

            //GridView1.EditIndex = -1;
            //Display();
        }

        protected void AddBranch_Click(object sender, EventArgs e)
        {
            Session.Remove("Branch_id");
            Response.Redirect("addBranch.aspx");
        }

        //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    int i = e.RowIndex;

        //    int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);
        //    TextBox name = (TextBox)GridView1.Rows[i].Cells[1].Controls[0];

        //    string q2 = @"Update BRANCH_MAST set Branch_name=@Branch_name where Branch_id=@Branch_id";

        //    conn.Open();
        //    cmd = new SqlCommand(q2, conn);
        //    cmd.Parameters.AddWithValue("@Branch_id", id);
        //    cmd.Parameters.AddWithValue("@Branch_name", name.Text);

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

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    int ccc = int.Parse(e.CommandArgument.ToString());
        //    if (e.CommandName == "edit")
        //    {
        //        Session["ID"] = ccc;
        //        Response.Redirect("addBranch.aspx");
        //        //qry = "select * from headerfooter where id='" + ccc + "'";
        //        //cs.DataBind(qry);
        //        //if (cs.ds.Tables[0].Rows.Count > 0)
        //        //{
        //        //    btnadd_headerfooter.Visible = false;
        //        //    btnedit_headerfooter.Visible = true;
        //        //    Image1.ImageUrl = cs.ds.Tables[0].Rows[0]["header"].ToString();
        //        //    Image2.ImageUrl = cs.ds.Tables[0].Rows[0]["footer"].ToString();
        //        //    bindheaderfooter();
        //        //}
        //    }
        //}
    }
}