using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace GTU_Portal
{
    public partial class ContactUs : System.Web.UI.Page
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
                    string query = @"select * from CONTACT_US ";
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
                                UniNameTextBox.Text = reader.GetString(1);
                                UniAddressTextBox.Text = reader.GetString(2);
                                UniMobileTextBox.Text = reader.GetString(3);
                                UniEmailTextBox.Text = reader.GetString(4);

                                OfficerNameTextBox.Text = reader.GetString(6);
                                OfficerDesignationTextBox.Text = reader.GetString(7);
                                OfficerMobileTextBox.Text = reader.GetString(8);
                                OfficerPhoneTextBox.Text = reader.GetString(9);
                                OfficerEmailTextBox.Text = reader.GetString(10);
                            }
                        }
                        else
                        {
                            UniNameTextBox.Text = "";
                            UniAddressTextBox.Text = "";
                            UniMobileTextBox.Text = "";
                            UniEmailTextBox.Text = "";

                            OfficerNameTextBox.Text = "";
                            OfficerDesignationTextBox.Text = "";
                            OfficerMobileTextBox.Text = "";
                            OfficerPhoneTextBox.Text = "";
                            OfficerEmailTextBox.Text = "";
                        }
                    }
                    ViewState["UniNameTextBox"] = UniNameTextBox.Text;
                    ViewState["UniAddressTextBox"] = UniAddressTextBox.Text;
                    ViewState["UniMobileTextBox"] = UniMobileTextBox.Text;
                    ViewState["UniEmailTextBox"] = UniEmailTextBox.Text;


                    ViewState["OfficerNameTextBox"] = OfficerNameTextBox.Text;
                    ViewState["OfficerDesignationTextBox"] = OfficerDesignationTextBox.Text;
                    ViewState["OfficerMobileTextBox"] = OfficerMobileTextBox.Text;
                    ViewState["OfficerPhoneTextBox"] = OfficerPhoneTextBox.Text;
                    ViewState["OfficerEmailTextBox"] = OfficerEmailTextBox.Text;

                    //Response.Write("<script>alert('Page Load')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string u_name = UniNameTextBox.Text;
        //        string u_add = UniAddressTextBox.Text;
        //        string u_mobile = UniMobileTextBox.Text;
        //        string u_email = UniEmailTextBox.Text;

        //        if (ViewState["UniNameTextBox"] != "" && ViewState["UniAddressTextBox"] != "" && ViewState["UniMobileTextBox"] != "" && ViewState["UniEmailTextBox"] != "")
        //        {
        //            using (SqlConnection conn = new SqlConnection(CS))
        //            {
        //                string query = @"update CONTACT_US set Cu_uni_name='" + u_name + "', Cu_uni_address ='" + u_add + "', Cu_phone  = '" + u_mobile + "', Cu_email = '" + u_email + "' where Cu_id = " + 1;
        //                cmd = new SqlCommand(query, conn);
        //                conn.Open();
        //                int row = cmd.ExecuteNonQuery();
        //            }
        //            //Response.Write("<script>alert('Update')</script>");
        //        }

        //        else
        //        {
        //            using (SqlConnection conn = new SqlConnection(CS))
        //            {
        //                string query = @"insert into CONTACT_US (Cu_uni_name, Cu_uni_address, Cu_phone, Cu_email) values ('" + u_name + "','" + u_add + "','" + u_mobile + "','" + u_email + "')";
        //                cmd = new SqlCommand(query, conn);
        //                conn.Open();
        //                int row = cmd.ExecuteNonQuery();
        //            }
        //            //Response.Write("<script>alert('insert')</script>");
        //        }


        //    }
        //    catch (Exception)
        //    {
        //        Response.Write("<script>alert('Something went wrong. Try again.')</script>");
        //    }

        //    //if (ViewState["desc1"] != "" && ViewState["desc2"] != "")
        //    //{
        //    //    using (SqlConnection conn = new SqlConnection(CS))
        //    //    {
        //    //        string query = @"update MISSION_STATEMENT set Ms_desc1='" + desc1 + "', Ms_desc2='"+ desc2 +"' where Ms_id = " + 1;
        //    //        cmd = new SqlCommand(query, conn);
        //    //        conn.Open();
        //    //        int row = cmd.ExecuteNonQuery();
        //    //    }
        //    //    Response.Write("<script>alert('Update')</script>");
        //    //}
        //    //else
        //    //{
        //    //    using (SqlConnection conn = new SqlConnection(CS))
        //    //    {
        //    //        string query = @"insert into MISSION_STATEMENT (Ms_desc1, Ms_desc2) values ('" + desc1 + "','"+ desc2 +"')";
        //    //        cmd = new SqlCommand(query, conn);
        //    //        conn.Open();
        //    //        int row = cmd.ExecuteNonQuery();
        //    //    }
        //    //    Response.Write("<script>alert('insert')</script>");
        //    //}
        //}

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string u_name = UniNameTextBox.Text;
                string u_add = UniAddressTextBox.Text;
                string u_mobile = UniMobileTextBox.Text;
                string u_email = UniEmailTextBox.Text;

                string o_name = OfficerNameTextBox.Text;
                string o_des = OfficerDesignationTextBox.Text;
                string o_phone = OfficerPhoneTextBox.Text;
                string o_mobile = OfficerMobileTextBox.Text;
                string o_email = OfficerEmailTextBox.Text;
                

                if (ViewState["UniNameTextBox"] != "" && ViewState["UniAddressTextBox"] != "" && ViewState["UniMobileTextBox"] != "" && ViewState["UniEmailTextBox"] != "" && ViewState["OfficerNameTextBox"] != "" && ViewState["OfficerDesignationTextBox"] != "" && ViewState["OfficerMobileTextBox"] != "" && ViewState["OfficerPhoneTextBox"] != "" && ViewState["OfficerEmailTextBox"] != "")
                {
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        string query = @"update CONTACT_US set Cu_uni_name='" + u_name + "', Cu_uni_address ='" + u_add + "', Cu_phone  = '" + u_mobile + "', Cu_email = '" + u_email + "' , CU_pr_name ='" + o_name + "', " +
                                        "Cu_pr_designation ='" + o_des + "', Cu_pr_phone = '" + o_phone + "', Cu_pr_mobile = '" + o_mobile + "', Cu_pr_email = '" + o_email + "' where Cu_id = " + 1;
                        cmd = new SqlCommand(query, conn);
                        conn.Open();
                        int row = cmd.ExecuteNonQuery();
                    }
                    
                }
                               
                else
                {
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        if (PhotoFileUpload.HasFile)
                        {
                            int length = PhotoFileUpload.PostedFile.ContentLength;
                            byte[] imgbyte = new byte[length];
                            HttpPostedFile img = PhotoFileUpload.PostedFile;
                            //set the binary data
                            img.InputStream.Read(imgbyte, 0, length);
                            string filename = Path.GetFileName(PhotoFileUpload.PostedFile.FileName);

                            string query = @"insert into CONTACT_US (Cu_pr_image, Cu_pr_name, Cu_pr_designation, Cu_pr_phone, Cu_pr_mobile, Cu_pr_email, Cu_uni_name, Cu_uni_address, Cu_phone, Cu_email) values 
                            ('" + imgbyte + "','" + o_name + "','" + o_des + "','" + o_phone + "','" + o_mobile + "','" + o_email + "','" + u_name + "','" + u_add + "','" + u_mobile + "','" + u_email + "')";
                            cmd = new SqlCommand(query, conn);
                            conn.Open();
                            int row = cmd.ExecuteNonQuery();

                            //using (SqlConnection con = new SqlConnection(CS))
                            //{
                            //    using (SqlCommand cmd = new SqlCommand())
                            //    {
                            //        cmd.CommandText = "UPDATE User_Table SET Image = @Data WHERE U_id = '" + uid + "'";
                            //        cmd.Parameters.AddWithValue("@Data", imgbyte);
                            //        cmd.Connection = con;
                            //        con.Open();
                            //        cmd.ExecuteNonQuery();
                            //        con.Close();
                            //    }
                            //}
                        }                       
                    }
                    //Response.Write("<script>alert('insert')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("<script>alert('"+ (ex.Message) +"')</script>");
                //Response.Write("<script>alert('Something went wrong..Try again later.')</script>");
            }
        }
    }
}