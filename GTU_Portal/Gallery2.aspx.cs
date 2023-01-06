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
    public partial class WebForm17 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        SqlCommand cmd = null;
        int i = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Gallery Photo/"));
                //List<ListItem> files = new List<ListItem>();                

                foreach (string filePath in filePaths)
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl creatediv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                    creatediv.Attributes.Add("class", "column");

                    System.Web.UI.HtmlControls.HtmlGenericControl creatediv2 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                    creatediv2.Attributes.Add("class", "card");

                    string fileName = Path.GetFileName(filePath);
                    Image img = new Image();
                    img.ID = "Image" + i;
                    img.ImageUrl = "~/Gallery Photo/" + fileName;
                    img.Attributes.Add("Height", "225px");
                    img.Attributes.Add("Width", "225px");
                    img.Attributes.Add("class", "pop");

                    creatediv2.Controls.Add(img);
                    creatediv.Controls.Add(creatediv2);
                    MyContainer.Controls.Add(creatediv);

                    i++;
                   
                }                             
            }

            //if (!IsPostBack)
            //{
            //    string query = @"select * from Gallery ";
            //    using (SqlConnection conn = new SqlConnection(CS))
            //    {
            //        cmd = new SqlCommand(query, conn);
            //        conn.Open();
            //        SqlDataReader reader = cmd.ExecuteReader();
            //        if (reader.HasRows)
            //        {
            //            while (reader.Read())
            //            {
            //                int gallery = Int32.Parse(reader["Gall_id"].ToString());
            //                var image = reader["Photo"].ToString();
            //                if (image != "")
            //                {
            //                    GalleryPhoto.ImageUrl = "GalleryPhoto.ashx?Gall_id=" + gallery;

            //                    //OfficerPhoto.ImageUrl = "Contact_Image.ashx?Cu_id=1";
            //                }
            //                else
            //                {
            //                    GalleryPhoto.ImageUrl = "/UploadPic/images.png";
            //                }

            //                // desc1.Text = reader.GetString(1);
            //                // desc2.Text = reader.GetString(2);

            //            }
            //        }                    
            //    }
            //}
        }
    }
}