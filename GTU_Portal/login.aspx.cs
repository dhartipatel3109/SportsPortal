using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;

namespace GTU_Portal
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Buttonlogin_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            con.Open();
            string query = "select * from User_Table where U_userid='"+TextBoxuserid.Text+"' and U_password='"+TextBoxpassword.Text+"'";
            SqlCommand sc = new SqlCommand(query, con);
            sc.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sc);
            da.Fill(dt);
            int i = sc.ExecuteNonQuery();
            
            if (dt.Rows.Count > 0)
            {
                Session["U_userid"] = dt.Rows[0]["U_userid"].ToString();
                Session["U_email"] = dt.Rows[0]["U_email"].ToString();
                Session["Username"]=dt.Rows[0]["U_username"].ToString();
                Session["User_Type"] = dt.Rows[0]["U_usertype"].ToString();
                Session["C_id"] = dt.Rows[0]["C_id"].ToString();
                Session["Image"] = dt.Rows[0]["Image"].ToString();

                Response.Redirect("~/Dashboard.aspx");
            }
            else
            {
                Label1.Text = "Incorrect username or password";
              
            }
            con.Close();            
        }
    }
}