using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data.Sql;
using System.Data;
using System.Configuration;

namespace GTU_Portal
{
    public partial class WebForm15 : System.Web.UI.Page
    {

        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection c = new SqlConnection(CS))
            {
                c.Open();
                string query = @"Select Top 7 * from Game_Circular order by G_id desc";

                SqlCommand cmd = new SqlCommand(query, c);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                switch (ds.Tables[0].Rows.Count)
                {
                    case 1:
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            G1.InnerText = ds.Tables[0].Rows[0]["File_Name"].ToString();
                            A1.Attributes.Add("name", ds.Tables[0].Rows[0]["Uploded_File"].ToString());
                        }
                        break;

                    case 2:
                        if (ds.Tables[0].Rows.Count > 1)
                        {
                            G1.InnerText = ds.Tables[0].Rows[0]["File_Name"].ToString();
                            G2.InnerText = ds.Tables[0].Rows[1]["File_Name"].ToString();
                            A1.Attributes.Add("name", ds.Tables[0].Rows[0]["Uploded_File"].ToString());
                            A2.Attributes.Add("name", ds.Tables[0].Rows[1]["Uploded_File"].ToString());
                        }
                        break;

                    case 3:
                        if (ds.Tables[0].Rows.Count > 2)
                        {
                            G1.InnerText = ds.Tables[0].Rows[0]["File_Name"].ToString();
                            G2.InnerText = ds.Tables[0].Rows[1]["File_Name"].ToString();
                            G3.InnerText = ds.Tables[0].Rows[2]["File_Name"].ToString();
                            A1.Attributes.Add("name", ds.Tables[0].Rows[0]["Uploded_File"].ToString());
                            A2.Attributes.Add("name", ds.Tables[0].Rows[1]["Uploded_File"].ToString());
                            A3.Attributes.Add("name", ds.Tables[0].Rows[2]["Uploded_File"].ToString());
                        }
                        break;

                    case 4:
                        if (ds.Tables[0].Rows.Count > 3)
                        {
                            G1.InnerText = ds.Tables[0].Rows[0]["File_Name"].ToString();
                            G2.InnerText = ds.Tables[0].Rows[1]["File_Name"].ToString();
                            G3.InnerText = ds.Tables[0].Rows[2]["File_Name"].ToString();
                            G4.InnerText = ds.Tables[0].Rows[3]["File_Name"].ToString();
                            A1.Attributes.Add("name", ds.Tables[0].Rows[0]["Uploded_File"].ToString());
                            A2.Attributes.Add("name", ds.Tables[0].Rows[1]["Uploded_File"].ToString());
                            A3.Attributes.Add("name", ds.Tables[0].Rows[2]["Uploded_File"].ToString());
                            A4.Attributes.Add("name", ds.Tables[0].Rows[3]["Uploded_File"].ToString());
                        }
                        break;

                    case 5:
                        if (ds.Tables[0].Rows.Count > 4)
                        {
                            G1.InnerText = ds.Tables[0].Rows[0]["File_Name"].ToString();
                            G2.InnerText = ds.Tables[0].Rows[1]["File_Name"].ToString();
                            G3.InnerText = ds.Tables[0].Rows[2]["File_Name"].ToString();
                            G4.InnerText = ds.Tables[0].Rows[3]["File_Name"].ToString();
                            G5.InnerText = ds.Tables[0].Rows[4]["File_Name"].ToString();
                            A1.Attributes.Add("name", ds.Tables[0].Rows[0]["Uploded_File"].ToString());
                            A2.Attributes.Add("name", ds.Tables[0].Rows[1]["Uploded_File"].ToString());
                            A3.Attributes.Add("name", ds.Tables[0].Rows[2]["Uploded_File"].ToString());
                            A4.Attributes.Add("name", ds.Tables[0].Rows[3]["Uploded_File"].ToString());
                            A5.Attributes.Add("name", ds.Tables[0].Rows[4]["Uploded_File"].ToString());
                        }
                        break;

                    case 6:
                        if (ds.Tables[0].Rows.Count > 5)
                        {
                            G1.InnerText = ds.Tables[0].Rows[0]["File_Name"].ToString();
                            G2.InnerText = ds.Tables[0].Rows[1]["File_Name"].ToString();
                            G3.InnerText = ds.Tables[0].Rows[2]["File_Name"].ToString();
                            G4.InnerText = ds.Tables[0].Rows[3]["File_Name"].ToString();
                            G5.InnerText = ds.Tables[0].Rows[4]["File_Name"].ToString();
                            G6.InnerText = ds.Tables[0].Rows[5]["File_Name"].ToString();
                            A1.Attributes.Add("name", ds.Tables[0].Rows[0]["Uploded_File"].ToString());
                            A2.Attributes.Add("name", ds.Tables[0].Rows[1]["Uploded_File"].ToString());
                            A3.Attributes.Add("name", ds.Tables[0].Rows[2]["Uploded_File"].ToString());
                            A4.Attributes.Add("name", ds.Tables[0].Rows[3]["Uploded_File"].ToString());
                            A5.Attributes.Add("name", ds.Tables[0].Rows[4]["Uploded_File"].ToString());
                            A6.Attributes.Add("name", ds.Tables[0].Rows[5]["Uploded_File"].ToString());
                        }
                        break;

                    case 7:
                        if (ds.Tables[0].Rows.Count > 6)
                        {
                            G1.InnerText = ds.Tables[0].Rows[0]["File_Name"].ToString();
                            G2.InnerText = ds.Tables[0].Rows[1]["File_Name"].ToString();
                            G3.InnerText = ds.Tables[0].Rows[2]["File_Name"].ToString();
                            G4.InnerText = ds.Tables[0].Rows[3]["File_Name"].ToString();
                            G5.InnerText = ds.Tables[0].Rows[4]["File_Name"].ToString();
                            G6.InnerText = ds.Tables[0].Rows[5]["File_Name"].ToString();
                            G7.InnerText = ds.Tables[0].Rows[6]["File_Name"].ToString();
                            A1.Attributes.Add("name", ds.Tables[0].Rows[0]["Uploded_File"].ToString());
                            A2.Attributes.Add("name", ds.Tables[0].Rows[1]["Uploded_File"].ToString());
                            A3.Attributes.Add("name", ds.Tables[0].Rows[2]["Uploded_File"].ToString());
                            A4.Attributes.Add("name", ds.Tables[0].Rows[3]["Uploded_File"].ToString());
                            A5.Attributes.Add("name", ds.Tables[0].Rows[4]["Uploded_File"].ToString());
                            A6.Attributes.Add("name", ds.Tables[0].Rows[5]["Uploded_File"].ToString());
                            A7.Attributes.Add("name", ds.Tables[0].Rows[6]["Uploded_File"].ToString());
                        }
                        break;

                    case 0:
                        panel2.Visible = false;
                        break;
                }

            }
        }
    }
}