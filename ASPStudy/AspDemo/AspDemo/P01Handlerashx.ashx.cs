using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 复习网站
{
    /// <summary>
    /// 一般处理程序的本质是一个class，动态页面
    /// </summary>
    public class P01Handlerashx : IHttpHandler
    {
        //相当于程序的入口，main函数很像
        public void ProcessRequest(HttpContext context)//PR方法
        {
            //服务器告诉浏览器输出内容的类型
            context.Response.ContentType = "text/html";
            //服务器向浏览器输出内容
            context.Response.Write("Hello World");
            //问题：向浏览器输出一张美女图片
            context.Response.Write("<img src='0.gif' />");

            //context上下文对象
            /*
             * Repsonse对象(负责处理服务器发送给浏览器的所有的数据)
             *      write方法：
             *      ContentType
             * 
             * Request对象：(负责处理浏览器发送给服务器的所有的数据)
             *      HttpMehotd:接收当前的请求方式
             * 
             * Server对象：（帮助类）
             *      MapPath:得到网站中文件的物理路径
             */
        }

        //这个属性暂时不用理会
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}