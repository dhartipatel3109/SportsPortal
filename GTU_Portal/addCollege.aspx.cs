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
    public partial class addCollege : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    if (Session["C_id"] == null)
                    {

                    }
                    else
                    {
                        Label1.Text = Session["C_id"].ToString();
                        string query1 = @"select * from COLLEGE_MAST where C_id='" + Label1.Text + "'";

                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            SqlCommand cmd1 = new SqlCommand(query1, conn);
                            conn.Open();
                            SqlDataReader reader = cmd1.ExecuteReader();
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    CollegeIdTextBox.Text = reader["C_id"].ToString();
                                    CollegeTextBox.Text = reader["C_name"].ToString();
                                    CollegeAddressTextArea.InnerText = reader["C_address"].ToString();
                                    MobileTextBox.Text = reader["C_mobile"].ToString();
                                    EmailTextBox.Text = reader["C_email"].ToString();
                                    CityDropDownList.Text = reader["C_city"].ToString();
                                    ZoneDropDownList.Text = reader["C_city"].ToString();
                                    StateDropDownList.Text = reader["C_city"].ToString();
                                    PincodeTextBox.Text = reader["C_pincode"].ToString();
                                    WebsiteTextBox.Text = reader["C_website"].ToString();
                                }
                            }
                            else
                            {
                                CollegeTextBox.Text = "";
                            }
                        }
                    }

                }

                CityDropDownList.Items.Insert(0, new ListItem("--Select City--", "--Select City--"));
                StateDropDownList.Items.Insert(0, new ListItem("--Select City--", "--Select City--"));
                ZoneDropDownList.Items.Insert(0, new ListItem("--Select City--", "--Select City--"));
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
                    string query2 = @"update COLLEGE_MAST set C_name='" + CollegeTextBox.Text + "' where C_id='" + Label1.Text + "'";
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
                    //int clgId = Convert.ToInt32(CollegeIdTextBox.Text);
                    //string clgName = CollegeTextBox.Text;

                    //TextBox address = (TextBox)Page.FindControl("CollegeAddressTextArea");
                    ////string clgAddress = address.Text;

                    ////string clgAddress = Request.Form["CollegeAddressTextArea"];

                    //string clgAddress = CollegeAddressTextArea.ToString();
                    //int mobile = Int32.Parse(MobileTextBox.Text);
                    //string email = EmailTextBox.Text;
                    //int cityId = Convert.ToInt32(CityDropDownList.SelectedValue);
                    //int stateId = Convert.ToInt32(StateDropDownList.SelectedValue);
                    //int zoneId = Convert.ToInt32(ZoneDropDownList.SelectedValue);
                    //int pincode = Convert.ToInt32(PincodeTextBox.Text);
                    //string website = WebsiteTextBox.Text;


                    string query = @"insert into COLLEGE_MAST (C_id,C_name,C_address,C_city,C_state,C_mobile,C_email,C_pincode,C_website,C_zone) 
                                values ('" + CollegeIdTextBox.Text + "','" + CollegeTextBox.Text + "','" + CollegeAddressTextArea.Value + "','" + CityDropDownList.SelectedValue + "','" + StateDropDownList.SelectedValue + "','" + MobileTextBox.Text + "','" + EmailTextBox.Text + "','" + PincodeTextBox.Text + "','" + WebsiteTextBox.Text + "','" + ZoneDropDownList.SelectedValue + "');";

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



    //protected void Page_Load(object sender, EventArgs e)
    //    {

    //    }

    //    protected void Button1_Click(object sender, EventArgs e)
    //    {

        //    int clgId = Convert.ToInt32(CollegeIdTextBox.Text);
        //    string clgName = CollegeTextBox.Text;

        //    TextBox address = (TextBox)Page.FindControl("CollegeAddressTextArea");
        //    string clgAddress = address.Text;

        //    string clgAddress = Request.Form["CollegeAddressTextArea"];

        //    string clgAddress = CollegeAddressTextArea.ToString();
        //    long mobile = (long)Convert.ToDouble(MobileTextBox.Text);
        //    string email = EmailTextBox.Text;
        //    int cityId = Convert.ToInt32(CityDropDownList.SelectedValue);
        //    int stateId = Convert.ToInt32(StateDropDownList.SelectedValue);
        //    int zoneId = Convert.ToInt32(ZoneDropDownList.SelectedValue);
        //    int pincode = Convert.ToInt32(PincodeTextBox.Text);
        //    string website = WebsiteTextBox.Text;

    //        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
    //        using (SqlConnection conn = new SqlConnection(CS))
    //        {

    //            string query = @"insert into COLLEGE_MAST (C_id,C_name,C_address,C_city,C_state,C_mobile,C_email,C_pincode,C_website,C_zone) 
    //                            values ('" + CollegeIdTextBox.Text + "','" + CollegeTextBox.Text + "','" + CollegeAddressTextArea.Value + "','" + CityDropDownList.SelectedValue + "','" + StateDropDownList.SelectedValue + "','" + MobileTextBox.Text + "','" + EmailTextBox.Text + "','" + PincodeTextBox.Text + "','" + WebsiteTextBox.Text + "','" + ZoneDropDownList.SelectedValue + "');";
    //            SqlCommand cmd = new SqlCommand(query, conn);
    //            conn.Open();
    //            int rows = cmd.ExecuteNonQuery();
    //            Label1.Text = rows + " recorded inserted";
    //        }

    //    }
    //}
}