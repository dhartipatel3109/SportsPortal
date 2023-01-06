using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Configuration;

namespace GTU_Portal
{
    public partial class Game : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
            //GameDropDownList.Items.Insert(0, new ListItem("--Select Game--", "--Select Game--"));

        }

        protected void Display()
        {
            try
            {
                conn.Open();
                string q1 = "select * from GAME_MAST order by Game_id";

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


        protected void GameButton_Click(object sender, EventArgs e)
        {
            try
            {
                string tempGameName = Convert.ToString(GameDropDownList.SelectedItem);
                string query = @"select * from GAME_MAST where Game_name like '%" + tempGameName + "%'";
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
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //int i = e.RowIndex;
            //int id = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
            //string q2 = @"delete from GAME_MAST where Game_id=@Game_id";
            //conn.Open();
            //cmd = new SqlCommand(q2, conn);
            //cmd.Parameters.AddWithValue("@Game_id", id);
            //cmd.ExecuteNonQuery();
            //conn.Close();
            //GridView1.EditIndex = -1;
            //Display();
        }

        //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    int i = e.RowIndex;
        //    int id = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
        //    TextBox name = (TextBox)GridView1.Rows[i].Cells[3].Controls[0];
        //    string q2 = @"Update GAME_MAST set Game_name=@Game_name where Game_id=@Game_id";
        //    conn.Open();
        //    cmd = new SqlCommand(q2, conn);
        //    cmd.Parameters.AddWithValue("@Game_id", id);
        //    cmd.Parameters.AddWithValue("@Game_name", name.Text);
        //    cmd.ExecuteNonQuery();
        //    conn.Close();
        //    GridView1.EditIndex = -1;
        //    Display();
        //}

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //GridView1.EditIndex = -1;
            //Display();
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ccc = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName == "edit")
            {
                Session["Game_id"] = ccc;
                Response.Redirect("addGame.aspx");
                //qry = "select * from headerfooter where id='" + ccc + "'";
                //cs.DataBind(qry);
                //if (cs.ds.Tables[0].Rows.Count > 0)
                //{
                //    btnadd_headerfooter.Visible = false;
                //    btnedit_headerfooter.Visible = true;
                //    Image1.ImageUrl = cs.ds.Tables[0].Rows[0]["header"].ToString();
                //    Image2.ImageUrl = cs.ds.Tables[0].Rows[0]["footer"].ToString();
                //    bindheaderfooter();
                //}
            }
            if (e.CommandName == "delete")
            {
                try
                {
                    Session["Game_id"] = ccc;
                    int id = Convert.ToInt32(Session["Game_id"].ToString());
                    string query = @"delete from GAME_MAST where Game_id=" + id;
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
                    {
                        conn.Open();
                        cmd = new SqlCommand(query, conn);
                        cmd.ExecuteNonQuery();
                    }
                    Response.Redirect("Game.aspx");
                }
                catch (Exception)
                {
                    Response.Redirect("ErrorPage.aspx");
                    throw;
                }
            }
        }

        protected void AddGame_Click(object sender, EventArgs e)
        {
            Session.Remove("Game_id");
            Response.Redirect("addGame.aspx");
        }

        //private void GridView()
        //{
        //    DataTable dt = new DataTable();
        //    using (SqlConnection conn = new SqlConnection(CS))
        //    {
        //        conn.Open();
        //        SqlDataAdapter da = new SqlDataAdapter("select * from GAME_MAST", conn);
        //        da.Fill(dt);
        //    }           
        //}

        //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    GridView1.EditIndex = e.NewEditIndex;
        //    GridView();
        //}

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
            
        //}

        //protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    try
        //    {
        //        using (SqlConnection conn = new SqlConnection(CS))
        //        {
        //            conn.Open();
        //            string query = "delete GAME_MAST where Game_id=@Game_id";
        //            SqlCommand cmd = new SqlCommand(query, conn);
        //            cmd.Parameters.AddWithValue("@Game_id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        //            cmd.ExecuteNonQuery();
        //            GridView(); 
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }
        //}

        //protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    GridView1.EditIndex = -1;
        //    GridView();
        //}

        //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    try
        //    {
        //        using (SqlConnection conn = new SqlConnection(CS))
        //        {
        //            conn.Open();
        //            string query = "update GAME_MAST set Game_Name=@Game_Name where Game_id=@Game_id";
        //            SqlCommand cmd = new SqlCommand(query, conn);
        //            cmd.Parameters.AddWithValue("@Game_Name", (GridView1.FooterRow.FindControl("Game_Name") as TextBox).Text.Trim());
        //            cmd.Parameters.AddWithValue("@Game_id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        //            cmd.ExecuteNonQuery();
        //            GridView1.EditIndex = -1;
        //            GridView();
        //        }
        //    }
        //    catch(Exception ex) {
        //        Console.WriteLine(ex.Message);          
        //    }
        //}        
    }
}