using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;

namespace 复习网站
{
    /// <summary>
    /// P05GetCss 的摘要说明
    /// </summary>
    public class P05GetCss : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/html";
            //通过一般处理程序查询数据库
            DataTable dt = DbHelperSQL.GetDataTable("select * from GroupInfo ");
            //读取html页面中的所有的内容
            //得到文件的物理路径
            string path = context.Server.MapPath("/P05Css.html");
            string strContent = File.ReadAllText(path);
            //将占位替换成具体的数据
            System.Text.StringBuilder sb = new System.Text.StringBuilder();//==>string
            //字符串拼接
            foreach (DataRow row in dt.Rows)
            {
                sb.Append("<tr>");
                sb.Append("<td>" + row["GroupId"] + "</td>");
                sb.Append("<td>" + row["GroupName"] + "</td>");
                sb.Append("</tr>");
            }
            //替换占位符
            strContent = strContent.Replace("${trs}", sb.ToString());
            //将读取出来的html代码输出
            context.Response.Write(strContent);
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