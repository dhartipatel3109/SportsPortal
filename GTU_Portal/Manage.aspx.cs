using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace GTU_Portal
{
    public partial class Manage : System.Web.UI.Page
    {
        string eventValue = null;
        string eventName = null;

        string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Application["Event"] != null)
                {
                    eventValue = Application["Event"].ToString();
                }
                string query = @"select Event_name from Event where Event_id = '" + eventValue + "'";
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            eventName = reader.GetString(0);
                        }
                    }
                    else
                    {
                        Console.WriteLine("No rows found.");
                    }
                }
                EventNameTextBox.Text = eventName;

            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }

            //for (int i = 0; i < EventForCheckBoxList.Items.Count; i++)
            //{
            //    if (EventForCheckBoxList.Items[i].Selected)
            //    {
            //        chechBoxSelected = EventForCheckBoxList.Items[i].Text;
            //    }
            //}

            //string query2 = @"insert into Event_Game_Detail (Event_id, Game_id, Gender, Game_startDate, Game_endDate)";
            //string checkBoxSelected = "";
            //foreach (GridViewRow row in GridView1.Rows)
            //{
            //    CheckBox chk = ((CheckBox)row.FindControl("EventForCheckBoxList"));
            //    if (chk.Checked)
            //    {
            //        //checkBoxSelected += chk.Value;
            //        //query2+= " values ('"+eventValue+"'";
            //    }
            //}
        }

        protected void CollegeButton_Click(object sender, EventArgs e)
        {
            try
            {
                string one, two, threesss = "", txtdate;

                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    one = ((TextBox)GridView1.Rows[i].FindControl("Label1")).Text.Trim().ToString();
                    two = ((TextBox)GridView1.Rows[i].FindControl("Label2")).Text.Trim().ToString();
                    txtdate = ((TextBox)GridView1.Rows[i].FindControl("txtdate")).Text.Trim();
                    CheckBoxList cb = (CheckBoxList)GridView1.Rows[i].FindControl("EventForCheckBoxList");
                    foreach (ListItem item in cb.Items)
                    {
                        // CheckBoxList cbl = (CheckBoxList)GridView1.Rows[i].FindControl("EventForCheckBoxList");
                        //for (int m = 0; m < cb.Items.Count; m++)
                        //{
                        if (item.Selected)
                        {
                            threesss = item.Text;
                            string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
                            using (SqlConnection conn = new SqlConnection(CS))
                            {
                                string q2 = @"insert into Event_Game_Detail(Event_id,Game_id,Gender,Game_startDate) values ('" + eventValue + "','" + one + "','" + threesss.ToString() + "','" + txtdate + "');";

                                SqlCommand cmd2 = new SqlCommand(q2, conn);
                                conn.Open();
                                int rows = cmd2.ExecuteNonQuery();
                                Label3.Text = rows + " recorded inserted";
                            }
                        }
                        //}
                    }

                }
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
                throw;
            }
        }

    }
}