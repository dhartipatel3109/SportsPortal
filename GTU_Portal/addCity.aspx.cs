using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace GTU_Portal
{
    public partial class addBranch : System.Web.UI.Page
    {
        //    protected void Page_Load(object sender, EventArgs e)
        //    {

        //    }

        //    protected void Button1_Click(object sender, EventArgs e)
        //    {
        //        string cityName = CityTextBox.Text;
        //        int stateId = Convert.ToInt32(StateDropDownList.SelectedValue);



        //        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        //        using (SqlConnection conn = new SqlConnection(CS))
        //        {
        //            //SqlCommand cmd = new SqlCommand(query, conn);
        //            //conn.Open();
        //            //SqlDataReader reader = cmd.ExecuteReader();
        //            //while (reader.Read())
        //            //{
        //            //    stateid = reader.GetInt32(0);
        //            //}
        //            //conn.Close();


        //            string q2 = @"insert into CITY_MAST (City_name, State_id) values ('"+cityName+"',"+stateId+");";
        //            SqlCommand cmd2 = new SqlCommand(q2, conn);
        //            conn.Open();
        //            int rows = cmd2.ExecuteNonQuery();
        //            Label1.Text = rows + " recorded inserted";
        //        }
        //    }
        //}

        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    if (Session["City_id"] == null)
                    {

                    }
                    else
                    {
                        Label1.Text = Session["City_id"].ToString();
                        string query1 = @"select City_name from CITY_MAST where City_id='" + Label1.Text + "'";

                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            SqlCommand cmd1 = new SqlCommand(query1, conn);
                            conn.Open();
                            SqlDataReader reader = cmd1.ExecuteReader();
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    CityTextBox.Text = reader.GetString(0);
                                }
                            }
                            else
                            {
                                CityTextBox.Text = "";
                            }
                        }
                    }

                }

                StateDropDownList.Items.Insert(0, new ListItem("--Select State--", "--Select State--"));

            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        } //method end

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Label1.Text != "0")
                {
                    //update
                    string query2 = @"update CITY_MAST set City_name='" + CityTextBox.Text + "' where City_id='" + Label1.Text + "'";
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand(query2, conn);
                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();
                        Label1.Text = rows + " record updated";
                    }
                }
                else
                {
                    //insert
                    string cityName = CityTextBox.Text;
                    string query = @"insert into CITY_MAST (City_name) values ('" + cityName + "');";

                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand(query, conn);
                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();
                        Label1.Text = rows + " record inserted";
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        } //method end

    } //class end
}