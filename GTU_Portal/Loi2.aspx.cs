using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OpenPDF(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnk = (LinkButton)sender;
            if (lnk != null)
            {
                Response.AddHeader("content-disposition", "attachment; filename=" + lnk.CommandArgument);
                Response.WriteFile(Server.MapPath(lnk.CommandArgument.ToString()));
                Response.End();
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + (ex.Message) + "')</script>");
        }
    }
}