using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            //
            string axis = "-1.00,0.00,0.00";
            double o1;//和x轴的夹角
            double o2;//和XY面的夹角
            string[] str = axis.Split(',');

            int[] aa = new int[] { 1, 2, 3 };
            //θ为artan(y/x)
            var aaa = TwoSum(aa, 4);
            foreach (var item in aaa)
            {
                Console.WriteLine(item);
            }

        }
        private string getAngle(string[] str, out double o1, out double o2)
        {
            //θ1=artan(y/x); 
            //θ2=artan(z/x * cos(artan(y/x)));
            string ori = "";
            o1 = 0;
            o2 = 0;
            //先处理和X的夹角
            double x = Convert.ToDouble(str[0]);
            double y = Convert.ToDouble(str[1]);
            double z = Convert.ToDouble(str[2]);
            if (x == 0)
            {
                //x==0
                //y>0
                if (y > 0)
                {
                    o1 = 90;
                    if (z == 0)
                    {   //x==0
                        //y>0
                        //Z==0
                        ori = "Z IS N";
                        o2 = 0;
                    }
                    else //x==0
                    {
                        //x==0
                        //y>0 
                        //Z!=0
                        o2 = Math.Atan(z / y) / Math.PI * 180;
                        ori = "Z IS N " + o2 + " U";
                    }
                }
                if (y == 0)
                {
                    //x==0
                    //y==0
                    if (z > 0)
                    {//不变，在z轴上
                        o2 = 90;
                        ori = "Z IS U";
                    }//Z不能为0
                    if (z < 0)
                    {
                        o2 = 90;
                        ori = "Z IS D";
                    }
                }
                if (y < 0)
                {
                    o1 = -90;
                    //X==0
                    //Y<0
                    //Z==0
                    if (z == 0)
                    {
                        ori = "Z IS S";
                        o2 = 0;
                    }
                    else //x==0
                    {
                        //x==0
                        //y<0
                        //Z!=0
                        o2 = Math.Atan(z / y) / Math.PI * 180;
                        ori = "Z IS S " + o2 + " U";
                    }
                }
            }
            if (x != 0)
            {
                if (y == 0)
                {//x!=0
                 //y==0
                    if (z == 0)
                    {
                        o2 = 0;
                        if (x > 0)
                        {
                            o1 = 0;
                            ori = "Z IS E";
                        }
                        if (x < 0)
                        {
                            o1 = 180;
                            ori = "Z IS W";
                        }
                    }
                    if (z != 0)
                    {
                        //x!=0
                        //y==0
                        //y为0肯定在X和Z的平面
                        o1 = 0;
                        o2 = Math.Atan(z / x) / Math.PI * 180;
                        //有趣的地方，注意一下
                        ori = "U IS E " + o2 + " U";
                    }
                }
                //x!=0
                //y!=0
                if (y != 0)
                {
                    o1 = Math.Atan(y / x) / Math.PI * 180;
                    if (z == 0)
                    {
                        o2 = 0;
                        //这个偏角真的是有趣啊，我先转下来，然后给角度
                        ori = "Z IS E " + o1 + " N";//走的通
                    }
                    if (z != 0)
                    {
                        //三个都不为0
                    }
                }
            }

            return ori;
        }


        /**
         * 给定一个整数数组 nums 和一个目标值 target，
         * 请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
            你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
         */

        public static int[] TwoSum(int[] nums, int target)
        {
            for (int i = 0; i < nums.Length; i++)
            {
                for (int k = 0; k < nums.Length; k++)
                {
                    if (nums[i]+nums[k]==target)
                    {
                        return new int[] { nums[i], nums[k] };
                    }
                }
            }
            return null;
        }
        
    }
}
