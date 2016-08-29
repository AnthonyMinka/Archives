import java.util.*;
import java.io.*;

public class robloxRAPChecker {
	
	public static int constant1 = 17;
	public static int constant2 = 31;
	public static int constant3 = 7;
	public static int constant4 = 31;
	public static int constant5 = 0;
	
	public static void main (String args[]) {
		
		if (args.length<5){
			System.out.println("Usage: [file.txt] [1/Passwords 0/No Passwords] [1/Ignore On Error 0/Continue On Error] [1/Display Errors 0/Hide Errors] [Minimum RAP] [Character Seperating Username & Passwords]\nCredits: ro-lt");
			return;
		}
		
		// Args ex: Accs.txt 1 1 0 66
		String accountList = args[0]; // List of accounts.
		int listContainPasswords = Integer.parseInt(args[1]); // 1 = Contains passwords.
		int ignoreOnError = Integer.parseInt(args[2]); // 1 = Ignore account if an error occurs.
		int displayErrors = Integer.parseInt(args[3]); // 1 = Display errors.
		int displayAboveRAP = Integer.parseInt(args[4]); // Minimum RAP to display.
		String seperatingCharacterAccounts;
		if (listContainPasswords == 1)
			seperatingCharacterAccounts = args[5]; // Character seperating the usernames & passwords.
		else
			seperatingCharacterAccounts = ":";
		try{
			String store[] = new String[2];
			String tmp;
			BufferedReader ac = new BufferedReader(new FileReader(accountList));
			while((tmp=ac.readLine()) != null){
				if (listContainPasswords == 1)
					store=tmp.split(seperatingCharacterAccounts);
				else
					store[0]=tmp;
				accountCheck(seperatingCharacterAccounts, displayAboveRAP, store[0], ignoreOnError, displayErrors);
			}
			ac.close();
		}
		catch (Exception e){
			if (displayErrors == 1)
				System.out.println("ERROR 0: "+e);
		}
	}
	
	private static void accountCheck(String seperatingCharacterAccounts, int displayAboveRAP, String user, int ignoreOnError, int displayErrors){
		Runtime rt = Runtime.getRuntime();
		try{
			Process proc = rt.exec(String.format("wget -q --random-wait -nv http://rbx.trade/s/"+user+"/ajax"));
			proc.waitFor();
		}
		catch (Exception e){
			if (displayErrors == 1)
				System.out.println("ERROR 1: "+e);
		}try{
			String tmp[] = new String[constant4];
			BufferedReader br = new BufferedReader(new FileReader("ajax"));
			tmp=br.readLine().split(">");
			if (displayAboveRAP <= Integer.parseInt(tmp[constant1].split("<")[constant5].substring(constant3,tmp[constant1].split("<")[constant5].length())))
				System.out.println(tmp[constant1].split("<")[constant5]+seperatingCharacterAccounts+user);
			br.close();
		}catch (Exception e){
			if (displayErrors == 1)
				System.out.println("ERROR 2: "+e);
		}try{
			Process proc = rt.exec("rm ajax");
			proc.waitFor();
		}
		catch (Exception e){
			if (displayErrors == 1)
				System.out.println("ERROR 3: "+e);
			if (ignoreOnError == 1)
				return;
		}
	}
}
