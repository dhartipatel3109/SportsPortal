using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GTU_Portal
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindheaderfooter();
        }
        public void bindheaderfooter()
        {
            //qry = "select * from headerfooter order by id desc";
            //cs.DataBind(qry);
            //GridView6.DataSource = cs.ds;
            //GridView6.DataBind();
        }
        protected void GridView6_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ccc = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName == "edit")
            {
                Session["ID"] = ccc;
                //qry = "select * from headerfooter where id='" + ccc + "'";
                //cs.DataBind(qry);
                //if (cs.ds.Tables[0].Rows.Count > 0)
                //{
                //    btnadd_headerfooter.Visible = false;
                //    btnedit_headerfooter.Visible = true;
                //    Image1.ImageUrl = cs.ds.Tables[0].Rows[0]["header"].ToString();
                //    Image2.ImageUrl = cs.ds.Tables[0].Rows[0]["footer"].ToString();
                //    bindheaderfooter();
                //}
            }
            if (e.CommandName == "delete")
            {


            }
           
        }
        protected void GridView6_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            bindheaderfooter();
        }
        protected void GridView6_RowEditing(object sender, GridViewEditEventArgs e)
        {
            bindheaderfooter();
        }
    }
}