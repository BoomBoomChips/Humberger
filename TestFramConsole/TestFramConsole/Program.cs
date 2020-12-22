using System;
using TestFramConsole.Md5Tool;

namespace TestFramConsole
{
    class Program
    {
        public static void Main(string[] args)
        {
            //MD5
            Console.WriteLine(MD5Helper.GetMd5("wjn123456"));


            //拼音helper
            //Console.WriteLine(PinYinHelper.GetPinyin("大哥大"));

            ////MutexDemo
            //Thread MutexThradDemo1 = new Thread(new ThreadStart(MutexDemo.Msg)) { Name = "MutexThradDemo1" };
            //Thread MutexThradDemo2 = new Thread(new ThreadStart(MutexDemo.Msg)) { Name = "MutexThradDemo2" };
            //MutexThradDemo1.Start();
            //MutexThradDemo2.Start();
            //Console.WriteLine("");
        }
    }
}
