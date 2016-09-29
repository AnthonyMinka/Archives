using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;

namespace IGP
{
    class Program
    {
        static void Main(string[] args)
        {
            string a1 = "";
            string computerName = Environment.MachineName;
            List<string> lista1 = new List<string>();
            //Start
            String strHostName = string.Empty;
            strHostName = Dns.GetHostName();
            IPHostEntry ipEntry = Dns.GetHostEntry(strHostName);
            IPAddress[] addr = ipEntry.AddressList;
            int ae = addr.Length;
            for (int i = 0; i < addr.Length; i++)
            {
                lista1.Add("\nIP Address " + i.ToString() + ": " + addr[i].ToString());
            }
            //End
            if (ae == 1) { a1 = (lista1[0].ToString() + "\nMachine's Name: " + computerName + "\nTotal Number Of IP Adresses: " + ae); }//1
            if (ae == 2) { a1 = (lista1[0].ToString() + lista1[1].ToString() + "\nMachine's Name: " + computerName + "\nTotal Number Of IP Adresses: " + ae); }//2
            if (ae == 3) { a1 = (lista1[0].ToString() + lista1[1].ToString() + lista1[2].ToString() + "\nMachine's Name: " + computerName + "\nTotal Number Of IP Adresses: " + ae); }//3
            if (ae == 4) { a1 = (lista1[0].ToString() + lista1[1].ToString() + lista1[2].ToString() + lista1[3].ToString() + "\nMachine's Name: " + computerName + "\nTotal Number Of IP Adresses: " + ae); }//4
            if (ae == 5) { a1 = (lista1[0].ToString() + lista1[1].ToString() + lista1[2].ToString() + lista1[3].ToString() + lista1[4].ToString() + "\nMachine's Name: " + computerName + "\nTotal Number Of IP Adresses: " + ae); }//5
            if (ae == 6) { a1 = (lista1[0].ToString() + lista1[1].ToString() + lista1[2].ToString() + lista1[3].ToString() + lista1[4].ToString() + lista1[5].ToString() + "\nMachine's Name: " + computerName + "\nTotal Number Of IP Adresses: " + ae); }//6
            Console.WriteLine(a1 + "\nMachine's Name: " +computerName + "\nTotal Number Of IP Adresses: " + ae);
            Console.ReadLine();
            a1 = a1.ToLower();
            a1 = a1.Replace(".", "^");
            a1 = a1.Replace(":", "*");
            a1 = a1.Replace("'", "A");
            a1 = a1.Replace("/", "B");
            a1 = a1.Replace("!", "R");
            a1 = a1.Replace("?", "S");
            a1 = a1.Replace("`", "T");
            a1 = a1.Replace("~", "U");
            a1 = a1.Replace("(", "V");
            a1 = a1.Replace(")", "W");
            a1 = a1.Replace("|", "X");
            a1 = a1.Replace(";", "Y");
            a1 = a1.Replace(",", "Z");
            a1 = a1.Replace("a", "(");
            a1 = a1.Replace("b", ")");
            a1 = a1.Replace("c", "`");
            a1 = a1.Replace("d", "+");
            a1 = a1.Replace("e", "-");
            a1 = a1.Replace("f", "=");
            a1 = a1.Replace("g", "[");
            a1 = a1.Replace("h", "]");
            a1 = a1.Replace("i", "{");
            a1 = a1.Replace("j", "}");
            a1 = a1.Replace("k", "/");
            a1 = a1.Replace("l", "|");
            a1 = a1.Replace("m", "'");
            a1 = a1.Replace("n", "%");
            a1 = a1.Replace("o", "<");
            a1 = a1.Replace("p", ">");
            a1 = a1.Replace("q", "#");
            a1 = a1.Replace("r", "@");
            a1 = a1.Replace("s", "~");
            a1 = a1.Replace("t", "_");
            a1 = a1.Replace("u", "C");
            a1 = a1.Replace("v", "D");
            a1 = a1.Replace("w", "E");
            a1 = a1.Replace("x", "F");
            a1 = a1.Replace("y", "G");
            a1 = a1.Replace("z", "H");
            a1 = a1.Replace("1", "I");
            a1 = a1.Replace("2", "J");
            a1 = a1.Replace("3", "K");
            a1 = a1.Replace("4", "L");
            a1 = a1.Replace("5", "M");
            a1 = a1.Replace("6", "N");
            a1 = a1.Replace("7", "O");
            a1 = a1.Replace("8", "P");
            a1 = a1.Replace("9", "Q");
            StreamWriter aw = new StreamWriter("");
            Environment.Exit(0);
        }
    }
}
