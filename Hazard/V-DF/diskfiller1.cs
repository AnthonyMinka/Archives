using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace diskfiller1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Title = "\\//";
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Lets test this beautiful \\//!");
            StreamWriter V1 = new StreamWriter("V1.txt");  //  Name of the file for the test6.
            StreamWriter V2 = new StreamWriter("V2.txt");
            StreamWriter V3 = new StreamWriter("V3.txt");
            StreamWriter V4 = new StreamWriter("V4.txt");
            StreamWriter V5 = new StreamWriter("V5.txt");
            int t6 = 0;
            while (true)
            {
                t6++;
                {
                    int yourRandomStringLength = 32; //  maximum lenght: 32.
                    V1.WriteLine(Guid.NewGuid().ToString("N").Substring(0, yourRandomStringLength));  //  Write a random line of text.
                    V2.WriteLine(Guid.NewGuid().ToString("N").Substring(0, yourRandomStringLength));
                    V3.WriteLine(Guid.NewGuid().ToString("N").Substring(0, yourRandomStringLength));
                    V4.WriteLine(Guid.NewGuid().ToString("N").Substring(0, yourRandomStringLength));
                    V5.WriteLine(Guid.NewGuid().ToString("N").Substring(0, yourRandomStringLength));
                    if (t6 > 999999999)
                    {
                        t6 = 0;
                        return;
                    }
                }
            }
        }
    }
}
