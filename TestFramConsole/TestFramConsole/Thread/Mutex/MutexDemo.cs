using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace TestFramConsole
{
    public class MutexDemo
    {
        public static Mutex Mutex = new Mutex();
        public static void Msg() 
        {
            try
            {
                if (Mutex.WaitOne())
                {
                    Console.WriteLine(Thread.CurrentThread.Name + " Mutex,线程开始执行：" + DateTime.Now);
                    Thread.Sleep(1000);
                    Console.WriteLine(Thread.CurrentThread.Name + " Mutex,线程结束执行：" + DateTime.Now);
                }
            }
            catch (Exception)
            {

            }
            finally {
                Mutex.ReleaseMutex();
            }
        }
    }
}
