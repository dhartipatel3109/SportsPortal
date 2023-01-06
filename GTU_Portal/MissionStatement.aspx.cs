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
    public partial class MissionStatement : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        SqlCommand cmd = null;

        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    string query = @"select * from MISSION_STATEMENT ";
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        cmd = new SqlCommand(query, conn);
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                id = reader.GetInt32(0);
                                Desc1TextBox.Text = reader.GetString(1);
                                Desc2TextBox.Text = reader.GetString(2);
                            }
                        }
                        else
                        {
                            Desc1TextBox.Text = "";
                            Desc2TextBox.Text = "";
                        }
                    }
                    ViewState["desc1"] = Desc1TextBox.Text;
                    ViewState["desc2"] = Desc2TextBox.Text;
                    //Response.Write("<script>alert('Page Load')</script>");
                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

        protected void MissionStatementButton_Click(object sender, EventArgs e)
        {
            try
            {
                string desc1 = Desc1TextBox.Text;
                //Response.Write("<script>alert('" + desc1 + "')</script>");
                string desc2 = Desc2TextBox.Text;
                //Response.Write("<script>alert('" + desc2 + "')</script>");
                if (ViewState["desc1"] != "" && ViewState["desc2"] != "")
                {
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        string query = @"update MISSION_STATEMENT set Ms_desc1='" + desc1 + "', Ms_desc2='" + desc2 + "' where Ms_id = " + 1;
                        conn.Open();
                        cmd = new SqlCommand(query, conn);
                        int row = cmd.ExecuteNonQuery();
                        label.Text = row + "Updated";
                        desc1 = "";
                        desc2 = "";
                    }
                    //Response.Write("<script>alert('Update')</script>");
                }
                else
                {
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        string query = @"insert into MISSION_STATEMENT (Ms_desc1, Ms_desc2) values ('" + desc1 + "','" + desc2 + "')";
                        conn.Open();
                        cmd = new SqlCommand(query, conn);
                        int row = cmd.ExecuteNonQuery();
                        label.Text = row + "Inserted";
                        desc1 = "";
                        desc2 = "";
                    }
                    //Response.Write("<script>alert('insert')</script>");
                }
            }
            catch (Exception)
            {
                //Response.Redirect("ErrorPage.aspx");
                throw;
            }
            
            //if (desc2 != "")
            //{
            //    using (SqlConnection conn = new SqlConnection(CS))
            //    {
            //        string query = @"update MISSION_STATEMENT set Ms_desc2='" + desc2 + "' where Ms_id = " + 1;
            //        cmd = new SqlCommand(query, conn);
            //        conn.Open();
            //        int row = cmd.ExecuteNonQuery();
            //    }
            //}
            //else
            //{
            //    using (SqlConnection conn = new SqlConnection(CS))
            //    {
            //        string query = @"insert into MISSION_STATEMENT (Ms_desc2) values ('" + desc2 + "')";
            //        cmd = new SqlCommand(query, conn);
            //        conn.Open();
            //        int row = cmd.ExecuteNonQuery();
            //    }
            //}
        }


    }
}