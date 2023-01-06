using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;

namespace GTU_Portal
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection cn = new SqlConnection(CS))
                {
                    string query = @"select * from COLLEGE_MAST";
                    SqlCommand cmd = new SqlCommand(query, cn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    int i = ds.Tables[0].Rows.Count;

                    if (i > 0)
                    {
                        clg.Text = i.ToString();
                    }
                    else
                    {
                        clg.Text = "0";
                    }
                }

                using(SqlConnection c = new SqlConnection(CS))
                {
                    using(SqlCommand cm = new SqlCommand("select * from Notification", c))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cm);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        int i = ds.Tables[0].Rows.Count;

                        if (i > 0)
                        {
                            newevent.Text = i.ToString();
                        }
                        else
                        {
                            newevent.Text = "0";
                        }
                    }
                }

                using (SqlConnection c = new SqlConnection(CS))
                {
                    using (SqlCommand cm = new SqlCommand("select * from Event", c))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cm);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        int i = ds.Tables[0].Rows.Count;

                        if (i > 0)
                        {
                            oldevent.Text = i.ToString();
                        }
                        else
                        {
                            oldevent.Text = "0";
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}