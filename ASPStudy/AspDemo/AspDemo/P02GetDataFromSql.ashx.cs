using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace 复习网站
{
    /// <summary>
    /// 从数据库中得到数据
    /// </summary>
    public class P02GetDataFromSql : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //接收浏览器传递过来的参数
            string id = context.Request.QueryString["id"];

            context.Response.ContentType = "text/html";
            //通过一般处理程序查询数据库
            DataTable dt = DbHelperSQL.GetDataTable("select * from GroupInfo where GroupId =  " + id);
            //将数据以表格的形式输出到浏览器上
            context.Response.Write("<table>");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                context.Response.Write("<tr>");
                context.Response.Write("<td>" + dt.Rows[i]["GroupId"] + "</td>");
                context.Response.Write("<td>" + dt.Rows[i]["GroupName"] + "</td>");
                context.Response.Write("</tr>");
            }
            context.Response.Write("</table>");
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