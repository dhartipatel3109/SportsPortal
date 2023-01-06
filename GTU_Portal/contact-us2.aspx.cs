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
    public partial class WebForm10 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        SqlCommand cmd = null;
        int id;
        protected void Page_Load(object sender, EventArgs e)
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
                            universityName.InnerText = reader.GetString(1);
                            universityAddress.InnerText = reader.GetString(2);
                            universityPhone.InnerText = reader.GetString(3);
                            universityEmail.InnerText = reader.GetString(4);

                            officerName.InnerText = reader.GetString(6);
                            officerDesignation.InnerText = reader.GetString(7);
                            officerPhoneNo.InnerText = reader.GetString(8);
                            officerMobile.InnerText = reader.GetString(9);
                            officerEmail.InnerText = reader.GetString(10);

                            var image = reader["Cu_pr_image"].ToString();
                            if (image != "")
                            {
                                OfficerPhoto.ImageUrl = "/UploadPic/AkashSir.jpg";

                                //OfficerPhoto.ImageUrl = "Contact_Image.ashx?Cu_id=1";
                            }
                            else
                            {
                                OfficerPhoto.ImageUrl = "/UploadPic/images.png";
                            }

                            // desc1.Text = reader.GetString(1);
                            // desc2.Text = reader.GetString(2);

                        }
                    }
                    else
                    {
                        universityName.InnerText = "";
                        universityAddress.InnerText = "";
                        universityPhone.InnerText = "";
                        universityEmail.InnerText = "";

                        //OfficerPhoto.
                        officerName.InnerText = "";
                        officerDesignation.InnerText = "";
                        officerPhoneNo.InnerText = "";
                        officerMobile.InnerText = "";
                        officerEmail.InnerText = "";
                    }
                }
            }
        }
    }
}