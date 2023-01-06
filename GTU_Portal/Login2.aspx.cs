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
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //UsertypeDropDownList.Items.Insert(0, new ListItem("--Select Type--", "--Select Type--"));
        }

        protected void Buttonlogin_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            con.Open();
            string query = "select * from User_Table where U_userid= @0 and U_password= @1 and U_usertype=@2";
            SqlCommand sc = new SqlCommand(query, con);
            sc.Parameters.AddWithValue("@0",TextBoxuserid.Text);
            sc.Parameters.AddWithValue("@1", TextBoxpassword.Text);
            sc.Parameters.AddWithValue("@2", UsertypeDropDownList.SelectedValue);
            sc.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sc);
            da.Fill(dt);
            int i = sc.ExecuteNonQuery();

            if (dt.Rows.Count > 0)
            {
                if (Session["Image"] != null)
                {
                    Session["Image"] = dt.Rows[0]["Image"].ToString();

                }

                Session["U_userid"] = dt.Rows[0]["U_userid"].ToString();
                Session["U_email"] = dt.Rows[0]["U_email"].ToString();
                Session["Username"] = dt.Rows[0]["U_username"].ToString();
                Session["User_Type"] = dt.Rows[0]["U_usertype"].ToString();
                Session["C_id"] = dt.Rows[0]["C_id"].ToString();
                Response.Redirect("~/Dashboard.aspx");
            }
            else
            {
                Label1.Text = "Incorrect username or password or Usertype";

            }
            con.Close();
        }
    }
}