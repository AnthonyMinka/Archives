import java.util.*;
import java.io.*;

public class c9down {
	
	public static void main (String args[]) {
		String path1 = "https://vfs-gce-usw-78-1.c9.io/vfs/3624928/9uskQPoaOYvgJeOi/home/Downloads/";
		String path2 = "?download&isfile=1";
		int tot = 23;
		int coun[] = new int[3];
		coun[0]=0;
		coun[1]=0;
		coun[2]=0;
		Runtime rt = Runtime.getRuntime();
		String alph = "abcdefghijklmnopqrstuvwxyz";
		for (int i = 0; i < tot; i++)
		{
			if (coun[0] >= alph.length()){
				coun[0]=0;
				coun[1]++;
			}
			
			//System.out.println(""+path1 + "x"+alph.charAt(coun[1])+alph.charAt(coun[0]) + path2);
			System.out.printf("\rCompletion: %d%%", (i*100)/tot);
			try{
				Process proc = rt.exec(String.format("wget -q --random-wait -O "+ "x"+alph.charAt(coun[1])+alph.charAt(coun[0]) +" -nv "+path1 + "x"+alph.charAt(coun[1])+alph.charAt(coun[0]) + path2));
				proc.waitFor(); // Can be taken off to start multiple threads!!
				
			}
			catch (Exception e){
					System.out.println("ERROR: "+e);
			}
			
			coun[0]++;
		}
		try{
			Process proc = rt.exec(String.format("spd-say 'Your download from cloud 9 has finished.'"));
			proc.waitFor();
			proc = rt.exec(String.format("cat x* >> c9file")); // Better hope you got no files that start with x
			proc.waitFor();
			Thread.sleep(5000);
		}catch(Exception e){
			System.out.println("ERROR: "+e);
		}
		System.out.printf("\rDownload Completed.");
	}
}

