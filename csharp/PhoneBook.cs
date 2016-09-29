using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Reflection;

namespace PhoneBook
{
    class Program
    {
        static void Main(string[] args)
        {
            string E = "ERROR: ";
            string EANE = "Argument Null Exception!";
            string EFN = "File Not Found Exception!";
            string EIO = "I/O Exception!\nUse the IOE command to learn more on this error and how to stop it.";
            string EA = "Acces Violation Exception!\nYou might not have acces to the file.";
            string EAOOR = "Argument Out Of Range Exception!";
            string na = Environment.UserName; try
            {
                if (System.IO.Directory.Exists("C:\\Users\\" + na + "\\Desktop"))
                {
                    if (System.IO.File.Exists("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.ct"))
                    {
                        System.IO.File.Copy("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.ct", "C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.bct", true);
                    }
                    else
                    {
                        System.IO.Directory.CreateDirectory("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book");
                        System.IO.File.CreateText("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.ct").Close();
                        System.IO.File.CreateText("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.bct").Close();
                    }
                }
            }
            catch (FileNotFoundException) { Console.WriteLine(E+EFN); }
            catch (AccessViolationException) { Console.WriteLine(E+EA); }
            catch (IOException) { Console.WriteLine(E+EIO); }
            catch (ArgumentNullException) { Console.WriteLine(E+EANE); }
            catch (ArgumentOutOfRangeException) { Console.WriteLine(E+EAOOR); }
            Console.Title = "Phone Book V2.2";
            string IOE = "The reason why this error can happend is because you are trying to use the I/O Process for two application or more at the same time.\nOr the 'file,directory' has been deleted";
            string mh = ("Available commands:\nPhone Book: Copyright and Credits plus version.\nremove: It will remove all the files that have been created by this application INCLUDING the phone numbers.\nIOE: Explaines the I/O Execption.\nUpdate: It is to restore the old data from an other version of this application to this one.\nRestore: It will restore the old data formated.\nWrite: To add one new phone numbers.\nRead: To see the saved data.\nExit: To exit the application.\nFormat: To empty the saved data.\nHelp: To print the help text.");
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Phone book started!");
            Console.ResetColor();
            Console.WriteLine(mh);
            string n = "";
            string h = "";
            string pn = "";
            string d = "Done!";
            while (true)
            {
                string input = Console.ReadLine().ToLower();
                if (input == "exit")
                    break;
                else if (input == "help")
                    Console.WriteLine(mh);
                else if (input == "phone book")
                    Console.WriteLine("V 2.2\nCopyright:Phone book is a free redistributable program.\nCredits:\nDock Production\nWebsite:www.perdu.com\nDockTownMayor - Programming and image design");
                else if (input == "ioe")
                    Console.WriteLine(IOE);
                else if (input == "remove")
                {
                    System.IO.File.Delete("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.ct");
                    System.IO.File.Delete("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.bct");
                    System.IO.Directory.Delete("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book");
                    Console.WriteLine(d + "\nReady to be removed!");
                }
                else if (input == "update")
                {
                    string a = "";
                    Console.WriteLine("Please write te full path to the files.\nEX: C:\\User\\John\\Roaming\\Phone Book'.");
                    a = Console.ReadLine(); try
                    {
                        System.IO.File.Copy(a + "\\edf.ct", "C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.ct", true);
                        System.IO.File.Copy(a + "\\edf.ct", "C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.bct", true);
                        Console.WriteLine(d);
                    }
                    catch (FileNotFoundException) { Console.WriteLine(E + EFN); }
                    catch (AccessViolationException) { Console.WriteLine(E + EA); }
                    catch (IOException) { Console.WriteLine(E + EIO); }
                    catch (ArgumentNullException) { Console.WriteLine(E + EANE); }
                    catch (ArgumentOutOfRangeException) { Console.WriteLine(E + EAOOR); }
                }
                else if (input == "restore")
                {
                    try
                    {
                        System.IO.File.Copy("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.bct", "C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.ct", true);
                        Console.WriteLine(d);
                    }
                    catch (FileNotFoundException) { Console.WriteLine(E + EFN); }
                    catch (AccessViolationException) { Console.WriteLine(E + EA); }
                    catch (IOException) { Console.WriteLine(E + EIO); }
                    catch (ArgumentNullException) { Console.WriteLine(E + EANE); }
                    catch (ArgumentOutOfRangeException) { Console.WriteLine(E + EAOOR); }
                }
                else if (input == "write")
                {
                    try
                    {
                        StreamWriter w = new StreamWriter("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.ct", true);
                        StreamWriter bw = new StreamWriter("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.bct", true);
                        Console.WriteLine("Enter the name of the person.");
                        n = Console.ReadLine();
                        Console.WriteLine("Enter if its {0}'s Mobile, Home, ect... phone number.", n);
                        h = Console.ReadLine();
                        Console.WriteLine("Enter {0}'s {1} phone number.", n, h);
                        pn = Console.ReadLine();
                        w.Write("\n{0} {1}'s phone number is: {2}", n, h, pn);
                        bw.Write("\n{0} {1}'s phone number is: {2}", n, h, pn);
                        Console.WriteLine(d);
                        w.Flush();
                        bw.Flush();
                        w.Dispose();
                        bw.Dispose();
                        w.Close();
                        bw.Close();
                    }
                    catch (FileNotFoundException) { Console.WriteLine(E + EFN); }
                    catch (AccessViolationException) { Console.WriteLine(E + EA); }
                    catch (IOException) { Console.WriteLine(E + EIO); }
                    catch (ArgumentNullException) { Console.WriteLine(E + EANE); }
                    catch (ArgumentOutOfRangeException) { Console.WriteLine(E + EAOOR); }
                }
                else if (input == "format")
                {
                    try
                    {
                        StreamWriter f = new StreamWriter("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.ct");
                        f.WriteLine("Data formated! Please use 'Restore' to restore the old data.");
                        Console.WriteLine(d);
                        f.Flush();
                        f.Dispose();
                        f.Close();
                    }
                    catch (FileNotFoundException) { Console.WriteLine(E + EFN); }
                    catch (AccessViolationException) { Console.WriteLine(E + EA); }
                    catch (IOException) { Console.WriteLine(E + EIO); }
                    catch (ArgumentNullException) { Console.WriteLine(E + EANE); }
                    catch (ArgumentOutOfRangeException) { Console.WriteLine(E + EAOOR); }
                }
                else if (input == "read")
                {
                    try
                    {
                        StreamReader r = new StreamReader("C:\\Users\\" + na + "\\AppData\\Roaming\\Phone Book\\edf.ct");
                        string line = "";
                        while (line != null)
                        {
                            line = r.ReadLine();
                            if (line != null)
                                Console.WriteLine(line);
                        }
                        Console.WriteLine(d);
                        r.Dispose();
                        r.Close();
                    }
                    catch (FileNotFoundException) { Console.WriteLine(E + EFN); }
                    catch (AccessViolationException) { Console.WriteLine(E + EA); }
                    catch (IOException) { Console.WriteLine(E + EIO); }
                    catch (ArgumentNullException) { Console.WriteLine(E + EANE); }
                    catch (ArgumentOutOfRangeException) { Console.WriteLine(E + EAOOR); }
                }
                else Console.WriteLine("'{0}' is not a command. Please refer to 'help' for all the commands.", input);
            } Environment.Exit(0);
        }
    }
}
