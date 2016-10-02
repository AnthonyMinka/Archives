using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Net;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices;

namespace Encryption_test0
{
    class Program
    {
        static void Main(string[] args)
        {
            ShowWindow(GetConsoleWindow(), 0);
            List<string> lista1 = new List<string>();
            string a1 = "";
            String strHostName = string.Empty;
            strHostName = Dns.GetHostName();
            lista1.Add("\nMachine Host Name: " + strHostName.ToString());
            IPHostEntry ipEntry = Dns.GetHostEntry(strHostName);
            IPAddress[] addr = ipEntry.AddressList;
            for (int i = 0; i < addr.Length; i++)
            {
                lista1.Add("IP " + i.ToString() + ":: " + addr[i].ToString());
            }
            NetworkInterface[] adapters = NetworkInterface.GetAllNetworkInterfaces();
            foreach (NetworkInterface adapter in adapters)
            {
                IPInterfaceProperties adapterProperties = adapter.GetIPProperties();
                GatewayIPAddressInformationCollection addresses = adapterProperties.GatewayAddresses;
                if (addresses.Count > 0)
                {
                    lista1.Add("\n" + (adapter.Description).ToString());
                    foreach (GatewayIPAddressInformation address in addresses)
                    {
                        lista1.Add("\nGateway Address : " + (address.Address).ToString());
                    }
                }
            }
            foreach (NetworkInterface ni in NetworkInterface.GetAllNetworkInterfaces())
            {
                if (ni.NetworkInterfaceType == NetworkInterfaceType.Wireless80211 || ni.NetworkInterfaceType == NetworkInterfaceType.Ethernet)
                {
                    foreach (UnicastIPAddressInformation ip in ni.GetIPProperties().UnicastAddresses)
                    {
                        if (ip.Address.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                        {
                            lista1.Add("\n" + (ni.Name).ToString() + ":" + (ip.Address).ToString());
                        }
                    }
                }
            }
            IPGlobalProperties computerProperties = IPGlobalProperties.GetIPGlobalProperties();
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            lista1.Add("\nInterface information for: " + computerProperties.HostName.ToString() + "." + computerProperties.DomainName.ToString());
            if (nics == null || nics.Length < 1)
            {
                lista1.Add("\nNo network interfaces found!");
                return;
            }
            lista1.Add("\nNumber of interfaces : " + nics.Length.ToString());
            foreach (NetworkInterface adapter in nics)
            {
                IPInterfaceProperties properties = adapter.GetIPProperties();
                lista1.Add((adapter.Description).ToString());
                lista1.Add((String.Empty.PadLeft(adapter.Description.Length).ToString() + '='));
                lista1.Add("\nInterface type : " + (adapter.NetworkInterfaceType).ToString());
                lista1.Add("\nPhysical Address(MAC) : " + (adapter.GetPhysicalAddress()).ToString());
                lista1.Add("\nOperational status : " + (adapter.OperationalStatus).ToString());
                string versions = "";
                if (adapter.Supports(NetworkInterfaceComponent.IPv4))
                {
                    versions = "IPv4";
                }
                if (adapter.Supports(NetworkInterfaceComponent.IPv6))
                {
                    if (versions.Length > 0)
                    {
                        versions += " ";
                    }
                    versions += "IPv6";
                }
                lista1.Add("\nIP version : " + versions);
                if (adapter.NetworkInterfaceType == NetworkInterfaceType.Loopback)
                {
                    continue;
                }
                lista1.Add("\nDNS suffix : " + (properties.DnsSuffix).ToString());
                lista1.Add("\nDNS enabled : " + (properties.IsDnsEnabled).ToString());
                lista1.Add("\nDynamically configured DNS : " + (properties.IsDynamicDnsEnabled).ToString());
                lista1.Add("\nReceive Only : " + (adapter.IsReceiveOnly).ToString());
                lista1.Add("\nMulticast : " + (adapter.SupportsMulticast).ToString());
            }
            for (int i = 0; i != lista1.Count; i++)
            {
                a1 = a1 + lista1[i].ToString();
            }
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
            for (int i = 0; i < 99999; i++)
            {
                if (System.IO.File.Exists("Info" + i + "-" + strHostName.ToString() + ".ect") != true)
                {
                    System.IO.File.CreateText("Info" + i + "-" + strHostName.ToString() + ".ect").Close();
                    try
                    {
                        StreamWriter SD = new StreamWriter("Info" + i + "-" + strHostName.ToString() + ".ect");
                        SD.WriteLine(a1);
                        SD.Dispose();
                        SD.Close();
                        break;
                    }
                    catch (IOException)
                    {
                        System.IO.File.CreateText("IOException!").Close();
                        break;
                    }
                }
            }
            Environment.Exit(0);
        }
        [DllImport("kernel32.dll")]
        static extern IntPtr GetConsoleWindow();
        [DllImport("user32.dll")]
        static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    }
}
