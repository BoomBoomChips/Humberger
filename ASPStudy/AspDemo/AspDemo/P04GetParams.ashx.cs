using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 复习网站
{
    /// <summary>
    ///  接收从浏览器传递过来的参数
    /// </summary>
    public class P04GetParams : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //1.0接收当前请求的方式（get,post）
            string method = context.Request.HttpMethod;

            //2.0接收GET请求的参数:Request.QueryString
            //string id = context.Request.QueryString["id"];
            //string name = context.Request.QueryString ["name"];

            //2.0接收POST请求传递过来的参数：
            string id = context.Request.Form["id"];
            string name = context.Request.Form["name"];

            //3.0打印
            context.Response.Write("请求方式为：" + method + "<br/>id=" + id + "<br/>name=" + name);

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