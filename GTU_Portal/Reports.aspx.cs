using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GTU_Portal
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            CollegeDropDownList.Items.Insert(0, new ListItem("--Select College--", "--Select College--"));

            EventDropDownList.Items.Insert(0, new ListItem("--Select Event", "--Select Event--"));

            GameDropDownList.Items.Insert(0, new ListItem("--Select Game--", "--Select Game--"));

            ZoneDropDownList.Items.Insert(0, new ListItem("--Select Zone--", "--Select Zone--"));

            CityDropDownList.Items.Insert(0, new ListItem("--Select City--", "--Select City--"));


        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}