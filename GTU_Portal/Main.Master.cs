using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections.Specialized;

namespace GTU_Portal
{
    public partial class Main : System.Web.UI.MasterPage
    {
        private static int uid;
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("login2.aspx");
            }
            else
            {
                // lblCollegeId.Text = Session["C_id"].ToString();
                lblusername.Text = Session["Username"].ToString();
                LabelForUsername.Text = Session["Username"].ToString();
                Label1.Text = Session["Username"].ToString();

                if (Session["User_Type"].ToString() == "1")
                {
                    gtu_officer.Style.Add("display", "block");

                    if (Session["LOI"] != null && Session["LOI"].ToString() != "") 
                    {
                        LOI.Text = Session["LOI"].ToString();
                        //LOI2.Text = Session["LOI"].ToString();
                    }

                    if (Session["Observer_id"] != null && Session["Observer_id"].ToString() != "") 
                    {
                        Report.Text = Session["Observer_id"].ToString();
                    }

                    if (Session["Notify"] != null && Session["Notify"].ToString() != "")
                    {
                        Badge.Text = Session["Notify"].ToString();
                        number.InnerText = Session["Notify"].ToString();

                        shake.Attributes.Add("class", "shakebell");

                        using (SqlConnection cn = new SqlConnection(CS))
                        {
                            cn.Open();
                            string query = @"Select Top 3 * from Notification order by N_id desc";

                            SqlCommand cmd = new SqlCommand(query, cn);
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            switch (ds.Tables[0].Rows.Count)
                            {
                                case 1:
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        L1.InnerText = ds.Tables[0].Rows[0]["Message"].ToString();
                                        D1.InnerText = ds.Tables[0].Rows[0]["Date"].ToString();
                                        I2.Visible = false;
                                        I3.Visible = false;
                                    }
                                    break;

                                case 2:
                                    if (ds.Tables[0].Rows.Count > 1)
                                    {
                                        L1.InnerText = ds.Tables[0].Rows[0]["Message"].ToString();
                                        D1.InnerText = ds.Tables[0].Rows[0]["Date"].ToString();
                                        L2.InnerText = ds.Tables[0].Rows[1]["Message"].ToString();
                                        D2.InnerText = ds.Tables[0].Rows[1]["Date"].ToString();
                                        I3.Visible = false;
                                    }
                                    break;

                                case 3:
                                    if (ds.Tables[0].Rows.Count > 2)
                                    {
                                        L1.InnerText = ds.Tables[0].Rows[0]["Message"].ToString();
                                        D1.InnerText = ds.Tables[0].Rows[0]["Date"].ToString();
                                        L2.InnerText = ds.Tables[0].Rows[1]["Message"].ToString();
                                        D2.InnerText = ds.Tables[0].Rows[1]["Date"].ToString();
                                        L3.InnerText = ds.Tables[0].Rows[2]["Message"].ToString();                                        
                                        D3.InnerText = ds.Tables[0].Rows[2]["Date"].ToString();
                                    }
                                    break;
                                
                                case 0:  
                                        I1.Visible = false;
                                        I2.Visible = false;
                                        I3.Visible = false;
                                    break;
                            }

                        }

                        //Response.Write("<script> var q = document.getelementById('Badge'); q.value = Session['Notify'];</script>");
                    }

                    else
                    {
                        bell.Visible = false;
                        noti.Visible = false;

                    }

                }
                else if (Session["User_Type"].ToString() == "2")
                {

                    college_manager.Style.Add("display", "block");
                    
                    if(Session["Notify"] != null && Session["Notify"].ToString() != "")
                    {
                        Badge.Text = Session["Notify"].ToString();
                        number.InnerText = Session["Notify"].ToString();

                        shake.Attributes.Add("class", "shakebell");

                        using (SqlConnection cn = new SqlConnection(CS))
                        {
                            cn.Open();
                            string query = @"Select Top 3 * from Notification order by N_id desc";

                            SqlCommand cmd = new SqlCommand(query, cn);
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            switch (ds.Tables[0].Rows.Count)
                            {
                                case 1:
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        L1.InnerText = ds.Tables[0].Rows[0]["Message"].ToString();
                                        D1.InnerText = ds.Tables[0].Rows[0]["Date"].ToString();
                                        I2.Visible = false;
                                        I3.Visible = false;
                                    }
                                    break;

                                case 2:
                                    if (ds.Tables[0].Rows.Count > 1)
                                    {
                                        L1.InnerText = ds.Tables[0].Rows[0]["Message"].ToString();
                                        D1.InnerText = ds.Tables[0].Rows[0]["Date"].ToString();
                                        L2.InnerText = ds.Tables[0].Rows[1]["Message"].ToString();
                                        D2.InnerText = ds.Tables[0].Rows[1]["Date"].ToString();
                                        I3.Visible = false;
                                    }
                                    break;

                                case 3:
                                    if (ds.Tables[0].Rows.Count > 2)
                                    {
                                        L1.InnerText = ds.Tables[0].Rows[0]["Message"].ToString();
                                        D1.InnerText = ds.Tables[0].Rows[0]["Date"].ToString();
                                        L2.InnerText = ds.Tables[0].Rows[1]["Message"].ToString();
                                        D2.InnerText = ds.Tables[0].Rows[1]["Date"].ToString();
                                        L3.InnerText = ds.Tables[0].Rows[2]["Message"].ToString();
                                        D3.InnerText = ds.Tables[0].Rows[2]["Date"].ToString();
                                    }
                                    break;

                                case 0:
                                    I1.Visible = false;
                                    I2.Visible = false;
                                    I3.Visible = false;
                                    break;
                            }

                        }

                        //Response.Write("<script> var q = document.getelementById('Badge'); q.value = Session['Notify'];</script>");
                    }

                    else
                    {
                        bell.Visible = false;
                        noti.Visible = false;
                    }

                }
                else
                {
                    observer.Style.Add("display", "block");

                    bell.Visible = false;
                    noti.Visible = false;
                }
            }

            //using (SqlConnection con = new SqlConnection(CS))
            //{
            //    if (Session["U_userid"].ToString() != "")
            //    {
            //        con.Open();
            //        string imgeup = @"select Image from User_Table where U_username = '" + Session["Username"] + "'";
            //        SqlCommand cd1 = new SqlCommand(imgeup, con);
            //        SqlDataReader dere = cd1.ExecuteReader();
            //        SqlDataAdapter ad1 = new SqlDataAdapter(cd1);
            //        DataTable dt2 = new DataTable();
            //        ad1.Fill(dt2);

            //        if (dt2.Rows.Count > 0)
            //        {
            //            dere.Read();
            //            var image = dere["Image"].ToString();
            //            if (image != "")
            //            {
            //                UserImage.ImageUrl = "ImageHandler.ashx?U_userid=" + Session["U_userid"];
            //                Image.ImageUrl = "ImageHandler.ashx?U_userid=" + Session["U_userid"];
            //                UserImg.ImageUrl = "ImageHandler.ashx?U_userid=" + Session["U_userid"];

            //            }
            //            Image.ImageUrl = "/UploadPic/images.png";
            //            UserImage.ImageUrl = "/UploadPic/images.png";
            //            UserImg.ImageUrl = "/UploadPic/images.png";
            //            dere.Close();
            //        }
            //        con.Close();
            //        cd1.Dispose();
            //    }
            //}

            //if (Session["U_userid"].ToString() != "")
            //{
            //    if (Session["Image"].ToString() != "" || Session["Image"].ToString() != null)
            //    {
            //        UserImage.ImageUrl = "ImageHandler.ashx?U_userid=" + Session["U_userid"];

            //        Image.ImageUrl = "ImageHandler.ashx?U_userid=" + Session["U_userid"];

            //        UserImg.ImageUrl = "ImageHandler.ashx?U_userid=" + Session["U_userid"]; 
            //    }
            //    else
            //    {
            //        Image.ImageUrl = "/UploadPic/images.png";
            //        UserImage.ImageUrl = "/UploadPic/images.png";
            //        UserImg.ImageUrl = "/UploadPic/images.png";
            //    }
            //}           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Remove("Username");
            Response.Redirect("login2.aspx");
        }

        //protected void Profile_Click(object sender, EventArgs e)
        //{
        //    Session["U_username"] = 
        //    Response.Redirect("Profile.aspx");
        //}
    }
}