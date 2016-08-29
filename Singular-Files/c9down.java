import java.util.*;
import java.io.*;

public class c9down {
	
	public static void main (String args[]) {
	  String path = "/home/Downloads/"; // Path in the vm.
	  String constantnum = "263201"; // User id.
	  String host = "vfs-gce-usw-27-3"; // Host of the vm. Changes when it shuts down
	  String sessionTokshit = "9CatjR2KeA6wFd3W"; // Session token.
		String path1 = "https://"+host+".c9.io/vfs/"+constantnum+"/"+sessionTokshit+path; // First part of the downlaod path.
		String path2 = "?download&isfile=1"; // (second download path part 2)Maybe we can download a folder directly? Thats would make shit quicker
		int tot = 31; // Amout of files, cant go over 676 right now.
		int coun[] = new int[3];
		coun[0]=0;
		coun[1]=0;
		coun[2]=0;// That moment when your lazy...
		Runtime rt = Runtime.getRuntime(); // Shit caller.
		String alph = "abcdefghijklmnopqrstuvwxyz"; // Alphabet!!!
		for (int i = 0; i < tot; i++) // Main loop
		{
			if (coun[0] >= alph.length()){ // Counter checker
				coun[0]=0;
				coun[1]++;
			}
			
			System.out.println(""+path1 + "x"+alph.charAt(coun[1])+alph.charAt(coun[0]) + path2);
			try{
			// Lazyness coding, only allows up to 676 files to be downloaded from a regular split file output.
				Process proc = rt.exec(String.format("wget -q --random-wait -O "+ "x"+alph.charAt(coun[1])+alph.charAt(coun[0]) +" -nv "+path1 + "x"+alph.charAt(coun[1])+alph.charAt(coun[0]) + path2));
				proc.waitFor(); // Can be taken off to start multiple threads(download quicker, but must make sure they stay active and dont shutdown when the app stops)!!
			}
			catch (Exception e){
					System.out.println("ERROR: "+e); // We never know, might be an error.
			}
			
			coun[0]++;
		}
		// The end, yes this waas a sad love story.
	}
}

