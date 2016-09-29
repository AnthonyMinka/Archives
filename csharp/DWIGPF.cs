using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Diagnostics;

namespace DWIGPF
{
    class Program
    {
        static int Main(string[] args)
        {
            //Process.Start("LauncherD.exe");
            Console.WriteLine("Creating File...");
            {
                if (System.IO.File.Exists("D-Info0.ect"))//Info0.ect
                {
                    Console.WriteLine("File Already created!");
                }
                else
                {
                    System.IO.File.CreateText("D-Info0.ect").Close();
                    Console.WriteLine("File created!");
                }
            }
            Console.Title = "DWIGPF"; //Decryting.Wireless.Information.Gathering.Program.File!
            Console.WriteLine("Put The 'Info0.ect' Beside The Application.\nThen Press Enter To Start Decrypting.");
            Console.ReadLine();
            Console.WriteLine("Decrypting...");
            {
                List<string> lista1 = new List<string>();
                StreamReader DWIGPF = new StreamReader("Info0.ect");
                string line = "";
                string a1 = "";
                while (line != null)
                {
                    line = DWIGPF.ReadLine();
                    if (line != null)
                    {
                        lista1.Add(line);
                        //Console.WriteLine(line);
                    }
                }
                //Console.ReadLine();

                a1 = lista1[0].ToString();
                int b = 1;
                int c = lista1.Count;
                while (b-1 != c)
                {
                    a1 = a1 + lista1[b-1].ToString();
                    b++;
                }

                a1 = a1.Replace("*", ":");//0
                a1 = a1.Replace("^", ".");//-0
                a1 = a1.Replace("I", "1");//1
                a1 = a1.Replace("J", "2");//2
                a1 = a1.Replace("K", "3");//3
                a1 = a1.Replace("L", "4");//4
                a1 = a1.Replace("M", "5");//5!!!
                a1 = a1.Replace("N", "6");//5
                a1 = a1.Replace("O", "7");//6
                a1 = a1.Replace("P", "8");//7
                a1 = a1.Replace("Q", "9");//8
                a1 = a1.Replace("H", "z");//9
                a1 = a1.Replace("G", "y");//10
                a1 = a1.Replace("F", "x");//11
                a1 = a1.Replace("E", "w");//12
                a1 = a1.Replace("D", "v");//13
                a1 = a1.Replace("C", "u");//14
                a1 = a1.Replace("_", "t");//15
                a1 = a1.Replace("~", "s");//16
                a1 = a1.Replace("@", "r");//17
                a1 = a1.Replace("#", "q");//18
                a1 = a1.Replace(">", "p");//19
                a1 = a1.Replace("<", "o");//20
                a1 = a1.Replace("%", "n");//21
                a1 = a1.Replace("'", "m");//22
                a1 = a1.Replace("|", "l");//23
                a1 = a1.Replace("/", "k");//24
                a1 = a1.Replace("}", "j");//25
                a1 = a1.Replace("{", "i");//26
                a1 = a1.Replace("]", "h");//27
                a1 = a1.Replace("[", "g");//28
                a1 = a1.Replace("=", "f");//29
                a1 = a1.Replace("-", "e");//30
                a1 = a1.Replace("+", "d");//31
                a1 = a1.Replace("`", "c");//32
                a1 = a1.Replace(")", "b");//33
                a1 = a1.Replace("(", "a");//34
                a1 = a1.Replace("A", "'");//35
                a1 = a1.Replace("B", "/");//36
                a1 = a1.Replace("R", "!");//37
                a1 = a1.Replace("S", "?");//38
                a1 = a1.Replace("T", "`");//39
                a1 = a1.Replace("U", "~");//40
                a1 = a1.Replace("V", "(");//41
                a1 = a1.Replace("W", ")");//42
                a1 = a1.Replace("X", "|");//43
                a1 = a1.Replace("Y", ";");//44
                a1 = a1.Replace("Z", ",");//45
                a1.ToLower();
                Console.WriteLine(a1);
                Console.WriteLine(lista1.Count);
                {
                    StreamWriter asdf = new StreamWriter("D-Info0.ect");
                    asdf.WriteLine(a1);
                    asdf.Flush();
                    asdf.Dispose();
                    asdf.Close();
                }
                Console.WriteLine("Done!\nExiting DWIGPF!");
                Console.ReadLine();
                return 0;
            }
        }
    }
}
