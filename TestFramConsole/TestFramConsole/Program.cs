using System;
using System.Threading;

namespace TestFramConsole
{
    class Program
    {
        public static void Main(string[] args)
        {
            //MutexDemo
            Thread MutexThradDemo1 = new Thread(new ThreadStart(MutexDemo.Msg)) { Name = "MutexThradDemo1" };
            Thread MutexThradDemo2 = new Thread(new ThreadStart(MutexDemo.Msg)) { Name = "MutexThradDemo2" };
            MutexThradDemo1.Start();
            MutexThradDemo2.Start();
            Console.WriteLine("");
        }
    }
}
