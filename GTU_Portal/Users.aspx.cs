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
    public partial class Users : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
                {
                    CollegeDropDownList.Items.Insert(0, new ListItem("--Select College--", "--Select College--"));
                }
                    Display();
            }

        }

        protected void Display()
        {
            try
            {
                conn.Open();
                string q1 = @"select u.U_username,u.U_usertype, u.U_mobile, u.C_id, u.U_email, c.C_name from User_Table u
                                     join COLLEGE_MAST c on c.C_id = u.C_id order by U_id";

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

        protected void UserButton_Click(object sender, EventArgs e)
        {
            try
            {
                string query = @"select u.U_username,u.U_usertype, u.U_mobile, u.C_id, u.U_email, c.C_name from User_Table u
                                     join COLLEGE_MAST c on c.C_id = u.C_id where ";
                if (UserNameTextBox.Text != "")
                {
                    query += "u.U_username like '%" + UserNameTextBox.Text + "%' or ";
                }
                if (UserMobileTextBox.Text != "")
                {
                    query += "u.U_mobile like '%" + UserMobileTextBox.Text + "%' or ";
                }
                if (UserEmailTextBox.Text != "")
                {
                    query += "u.U_email like '%" + UserEmailTextBox.Text + "%' or ";
                }

                string extra = CollegeDropDownList.SelectedItem.ToString();                
                if (extra != "--Select College--")
                {
                    int id = Convert.ToInt32(CollegeDropDownList.SelectedValue);
                    query += "c.C_id like '%" + id + "%' or ";
                }

                string utype = UserTypeDropDownList.SelectedItem.ToString();
                if (utype != "--Select Type--")
                {
                    int id = Convert.ToInt32(UserTypeDropDownList.SelectedValue);
                    query += "u.U_usertype like '%" + id + "%' or ";
                }
                query += " 1!=1 order by U_id";

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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                string ccc = e.CommandArgument.ToString();
                if (e.CommandName == "edit")
                {
                    Session["U_email"] = ccc;
                    Response.Redirect("addUsers.aspx");
                }
                if (e.CommandName == "delete")
                {
                    Session["U_email"] = ccc;
                    string id = Session["U_email"].ToString();
                    string query = @"delete from User_Table where U_email= '" +id+"' ";
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
                    {
                        conn.Open();
                        cmd = new SqlCommand(query, conn);
                        cmd.ExecuteNonQuery();
                    }

                    Response.Redirect("Users.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }

        protected void AddUser_Click(object sender, EventArgs e)
        {
            Session.Remove("U_email");
            Response.Redirect("addUsers.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell statusCell = e.Row.Cells[1];
                if (statusCell.Text == "1")
                {
                    statusCell.Text = "GTU Sports Officer";
                }
                if (statusCell.Text == "2")
                {
                    statusCell.Text = "College Manager";
                }
                if (statusCell.Text == "3")
                {
                    statusCell.Text = "GTU Observer";
                }
            }
        }
    }
}