using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace GTU_Portal
{
    /// <summary>
    /// Summary description for UpdatedValue
    /// </summary>
    public class UpdatedValue : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            try
            {
                string UID = context.Request.QueryString["U_userid"].ToString();
                string sConn = System.Configuration.ConfigurationManager.ConnectionStrings["DB"].ToString();
                SqlConnection objConn = new SqlConnection(sConn);
                objConn.Open();
                string sTSQL = "select * from User_Table";
                SqlCommand objCmd = new SqlCommand(sTSQL, objConn);                
                object data = objCmd.ExecuteScalar();
                objConn.Close();
                objCmd.Dispose();                
            }
            catch (Exception)
            {

                throw;
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}