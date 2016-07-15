//feedGen.java

import java.util.Random;
import java.io.*;

public class feedGen {
	public static void main (String args[]) {
		System.out.println("FeedGen Start.");
		
		//Add option to pause the execution for X seconds between prints.
		
		//configuration.config
		
		int feedAmount;
		if (args.length>=1)
			feedAmount = Integer.parseInt(args[0]);
		else
			feedAmount=0;
		
		int dataRow = 4;
		
		char[][] customLists={
			("abcdefghijklmnopqrstuvwxyz").toCharArray(),
			("0123456789").toCharArray(),
			("!@#$%^&*()").toCharArray(),
			("~{}:;.,`?<>").toCharArray(),
			("/ -_|+=").toCharArray()
		};
		
		int[] rowOpt = {
			5 // #option per row
			,1// row#0
			,3
			,4
			,1
			,5
			,2// row#1
			,6
			,4
			,1
			,2
			,3// row#2
			,6
			,4
			,0
			,2
			,1// row#3
			,10
			,4
			,0
			,0
		};
		
		// for #row 
		// charList = X;
		// length = X;
		// charList = X;
		// charIndex = X;
		// length of between row = X;
		

		
		Random generator = new Random();
		
		if (feedAmount>0){
			for (int i = 0; i < feedAmount; i++)
			{
				printFeed(generator,dataRow,customLists,rowOpt);
			}
		}else {
			for (;;)
			{
				printFeed(generator,dataRow,customLists,rowOpt);
			}
		}
	}
	private static void printFeed(Random gen,int row, char[][] charLists, int[] opt){
		int h;
		
		for (int i = 0; i < row; i++)
		{
			for (h = 0; h < opt[1+i*opt[0]+1]; h++)
			{
				System.out.print(charLists[opt[1+i*opt[0]+0]][gen.nextInt(charLists[opt[1+i*opt[0]+0]].length)]);
			}
			for (h = 0; h < opt[1+i*opt[0]+4]; h++)
			{
				System.out.print(charLists[opt[1+i*opt[0]+2]][opt[1+i*opt[0]+3]]);
			}
		}
		System.out.println();
	}
}
