using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GTU_Portal
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private static int uid;
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    conn.Open();
                    string query = @"select distinct c.C_name, u.U_id, u.U_usertype, u.U_username, u.U_userid, u.U_password, u.U_mobile, u.U_email from User_Table u
                                        Join COLLEGE_MAST c on c.C_id = u.C_id
                                        where U_username = '" + Session["Username"] + "' ";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (dt.Rows.Count > 0)
                    {
                        reader.Read();
                        uid = Convert.ToInt32(reader["U_id"].ToString());
                        imgnamelabel1.Text = reader["U_username"].ToString();
                        Name.Text = imgnamelabel1.Text;
                        univerditylabel.Text = reader["C_name"].ToString();
                        nlabel.Text = reader["U_username"].ToString();
                        uidlabel.Text = reader["U_userid"].ToString();
                        Userid.Text = uidlabel.Text;
                        plabel.Text = reader["U_password"].ToString();
                        Password.Text = plabel.Text;
                        mlabel.Text = reader["U_mobile"].ToString();
                        MobileNo.Text = mlabel.Text;
                        elabel.Text = reader["U_email"].ToString();
                        Email.Text = elabel.Text;
                        
                        var role = reader["U_usertype"].ToString();
                        if (role == "1")
                            Rolelabel.Text = "Gtu Sports Officer";
                        else
                            Rolelabel.Text = "College Manager";

                        
                    }
                    conn.Close();

                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        con.Open();
                        string img = @"select Image from User_Table where U_username = '" + Session["Username"] + "'";
                        SqlCommand cd = new SqlCommand(img,con);
                        SqlDataReader dre = cd.ExecuteReader(); 
                        SqlDataAdapter ad = new SqlDataAdapter(cmd);
                        DataTable dt1 = new DataTable();
                        ad.Fill(dt1);

                        if (dt1.Rows.Count > 0)
                        {
                            dre.Read();
                            var image = dre["Image"].ToString();
                            if(image != "")
                            {
                                UploadImage.ImageUrl = "ImageHandler.ashx?U_userid=" + uidlabel.Text;

                            }
                            else
                            {
                                UploadImage.ImageUrl = "/UploadPic/images.png";

                            }
                        }                        
                        con.Close();
                    }
                }
            }
            //}
            //catch (Exception)
            //{
            //    Response.Redirect("ErrorPage.aspx");
            //    throw;
            //}
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //try
            //{
            using (SqlConnection conn = new SqlConnection(CS))
            {
                conn.Open();
                string query1 = @"UPDATE User_Table SET U_username='" + Name.Text + "',U_userid = '" + Userid.Text + "', U_password ='" + Password.Text + "', U_mobile = '" + MobileNo.Text + "', U_email = '" + Email.Text + "'  WHERE U_id = '" + uid + "'";               

                //UploadImage.ImageUrl = "ImageHandler.ashx?U_userid=" + uidlabel.Text;

                SqlCommand cmd = new SqlCommand(query1, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                
            }
            Response.Redirect("login2.aspx");
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                int length = FileUpload1.PostedFile.ContentLength;
                byte[] imgbyte = new byte[length];
                HttpPostedFile img = FileUpload1.PostedFile;
                //set the binary data
                img.InputStream.Read(imgbyte, 0, length);
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "UPDATE User_Table SET Image = @Data WHERE U_id = '" + uid + "'";
                        cmd.Parameters.AddWithValue("@Data", imgbyte);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }           
                
                UploadImage.ImageUrl = "ImageHandler.ashx?U_userid=" + uidlabel.Text;
                Response.Redirect("login2.aspx");
            }
        }
    }
}