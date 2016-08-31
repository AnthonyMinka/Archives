import java.util.*;
import java.io.*;

// Used to win at a geo party using a bank of words

public class jeo {
	
	public static void main (String args[]) {
		System.out.println("Calculating probabilities:");
		String[] words = {"aligator","person","man","men","cat","pop","bad","dad"}; // Too lazy to make then load from a text file
		String letters = "ab"; // Letters of the mystery word that are known.
		// Add letters in order!! And the amount thats inside of the mystery word.
		int length = 3; // Mystery word length
		int possibilityCounter = 0;
		int localCount = 0;
		int minimumRate = 1; // Minimum rate for the words to be shown.
		int[][] matrix = new int[0][0];
		for (int i = 0; i < words.length; i++)
		{
			if (words[i].length() == length){
				localCount = 0;
				for (int j = 0; j < letters.length(); j++)
				{
					if (words[i].contains(letters.charAt(j)+"")){//Cheat, bad coding
						
						possibilityCounter++;
						localCount++;
						//break;
					}
				}
				if (localCount!=0)
					matrix = addMatrix(matrix, localCount, i);
			}
		}
		localCount = 0;
		if (possibilityCounter == 0)
			System.out.println("No Possibilities Found!");
		else{
			for (int i = 0; i < matrix.length; i++)
			{
				if (minimumRate <= matrix[i][0]){
					System.out.println(matrix[i][0]+ " : " +words[matrix[i][1]]);
					localCount++;
				}
			}
			if (localCount == 0)
				System.out.println("No Filtered Possibilities Found!");
			else
				System.out.println("Filtered Possibilities:" + localCount);
			System.out.println("Total Possibilities: "+possibilityCounter);
		}
	}
	
	public static int[][] addMatrix(int[][] matrix, int rate, int word){
		int[][] newMatrix = new int[matrix.length+1][2];
		
		for (int i = 0; i < matrix.length; i++)
		{
			for (int j = 0; j < matrix[i].length; j++)
			{
				newMatrix[i][j]=matrix[i][j];
			}
			
		}
		newMatrix[matrix.length][0] = rate;
		newMatrix[matrix.length][1] = word;
		
		return newMatrix;
	}
}
