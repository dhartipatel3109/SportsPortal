using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace GTU_Portal
{
    /// <summary>
    /// Summary description for GalleryPhoto
    /// </summary>
    public class GalleryPhoto : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            try
            {
                string UID = context.Request.QueryString["Gall_id"].ToString();
                string sConn = System.Configuration.ConfigurationManager.ConnectionStrings["DB"].ToString();
                SqlConnection objConn = new SqlConnection(sConn);
                objConn.Open();
                string sTSQL = "select Photo from Gallery where Gall_id= '" + UID + "'";
                SqlCommand objCmd = new SqlCommand(sTSQL, objConn);
                objCmd.CommandType = CommandType.Text;
                objCmd.Parameters.AddWithValue("@uid", UID.ToString());
                object data = objCmd.ExecuteScalar();
                objConn.Close();
                objCmd.Dispose();
                context.Response.BinaryWrite((byte[])data);
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