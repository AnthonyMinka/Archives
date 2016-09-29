using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace diskfiller2
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Title = "\\//";
            Console.WriteLine("-\\/ DF 2.0!\n-By DockTownMayor!\n-2013!");
            int L = 32;
            StreamWriter V1 = new StreamWriter("V1.txt");
            StreamWriter V2 = new StreamWriter("V2.txt");
            StreamWriter V3 = new StreamWriter("V3.txt");
            StreamWriter V4 = new StreamWriter("V4.txt");
            StreamWriter V5 = new StreamWriter("V5.txt");
            while (true)
            {
                    V1.WriteLine(Guid.NewGuid().ToString("N").Substring(0, L));
                    V2.WriteLine(Guid.NewGuid().ToString("N").Substring(0, L));
                    V3.WriteLine(Guid.NewGuid().ToString("N").Substring(0, L));
                    V4.WriteLine(Guid.NewGuid().ToString("N").Substring(0, L));
                    V5.WriteLine(Guid.NewGuid().ToString("N").Substring(0, L));
            };
        }
    }
}
