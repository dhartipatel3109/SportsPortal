using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Drawing;
using System.IO;

namespace GTU_Portal
{

    public partial class User : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    if (Session["U_email"] == null)
                    {

                    }
                    else
                    {
                        Label1.Text = Session["U_email"].ToString();
                        string query1 = @"select * from User_Table where U_email='" + Label1.Text + "'";

                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            SqlCommand cmd1 = new SqlCommand(query1, conn);
                            conn.Open();
                            SqlDataReader reader = cmd1.ExecuteReader();
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    UserNameTextBox.Text = reader["U_username"].ToString();
                                    UserIdTextBox.Text = reader["U_userid"].ToString();
                                    PasswordTextBox.Text = reader["U_password"].ToString();
                                    UserEmailTextBox.Text = reader["U_email"].ToString();
                                    UserMobileTextBox.Text = reader["U_mobile"].ToString();
                                    UserTypeDropDownList.Text = reader["U_usertype"].ToString();
                                }
                            }
                            else
                            {
                                UserNameTextBox.Text = "";
                            }
                        }
                    }

                }

                CollegeDropDownList.Items.Insert(0, new ListItem("--Select College--", "--Select College--"));
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + (ex.Message) + "')</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Label1.Text != "0")
                {
                    //update
                    string query2 = @"update User_Table set U_username='" + UserNameTextBox.Text + "' , U_userid='" + UserIdTextBox.Text + "', U_password='" + PasswordTextBox.Text + "', U_mobile='" + UserMobileTextBox.Text + "', U_email='" + UserEmailTextBox.Text + "', U_usertype='" + UserTypeDropDownList.SelectedValue + "', C_id='" + CollegeDropDownList.SelectedValue + "' where U_email='" + Label1.Text + "'";
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
                    //System.Drawing.Image img = System.Drawing.Image.FromFile("E:/images.png");

                    ////ImageConverter Class convert Image object to Byte array.
                    //byte[] bytes = (byte[])(new ImageConverter()).ConvertTo(img, typeof(byte[]));
                    //byte[] imagebyte = File.ReadAllBytes("~/images.png");                       

                    MailMessage message = new MailMessage();
                    message.From = new MailAddress("rajpatel2111998@gmail.com");
                    message.To.Add(new MailAddress(UserEmailTextBox.Text));

                    string mailbody = "<b>Your UserID is :</b> '" + UserIdTextBox.Text + "'<br /> <b>Password is :</b> '" + PasswordTextBox.Text + "'";
                    message.Subject = "GTU Technological University - Sports Portal Registration";
                    message.Body = mailbody;
                    message.BodyEncoding = Encoding.UTF8;
                    message.IsBodyHtml = true;
                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                    System.Net.NetworkCredential basicCredential1 = new
                    System.Net.NetworkCredential("rajpatel2111998@gmail.com", "viru2106");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = basicCredential1;
                    try
                    {
                        client.Send(message);

                        int usertype = Convert.ToInt32(UserTypeDropDownList.SelectedValue);
                        int c_id = Convert.ToInt32(CollegeDropDownList.SelectedValue);
                        string query = @"insert into User_Table (U_username, U_userid, U_password, U_mobile, U_email, U_usertype, C_id) values ('" + UserNameTextBox.Text + "','" + UserIdTextBox.Text + "','" + PasswordTextBox.Text + "','" + UserMobileTextBox.Text + "','" + UserEmailTextBox.Text + "','" + usertype + "','" + c_id + "');";

                        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                        using (SqlConnection conn = new SqlConnection(CS))
                        {
                            SqlCommand cmd = new SqlCommand(query, conn);
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                            //Label2.Text = rows + "record inserted";                            
                        }

                    }

                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + (ex.Message) + "')</script>");
                    }
                }
            }
            catch (Exception)
            {
                //Response.Redirect("<script>alert('Email doesn't exist...plz try again.')</script>");
                Response.Redirect("ErrorPage.aspx");
            }
        }
    }
}