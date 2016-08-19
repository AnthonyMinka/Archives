package excel;

import javax.swing.JOptionPane;
import javax.swing.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class mainC {
	public static void main(String[] args) {
		try {
			// General hash map for the data in the original file.
			Map<String, Object[]> excelOriginal = new HashMap<String, Object[]>();
			// Buffers for the files that are created and loaded.
			File excel = new File(JOptionPane.showInputDialog(new JFrame("Formating Input Window"), "Please enter the path to the file desired."));
			FileInputStream fis = new FileInputStream(excel);
			FileOutputStream os;
			// Global branch variable to guide the decisions of the program considering the determined branch file.
			String branch = "";
			// General excel data variables.
			XSSFWorkbook book = null;
			HSSFWorkbook bookold = null;
			XSSFSheet sheet = null;
			HSSFSheet sheetold = null;
			Iterator<Row> itr;
			// Temporary variables for the counters.
			int a = 1;
			int b = 0;
			int rownum = 0;
			int maxrows;
			// Variable to fix off by one error from the planisware excel document.
			boolean planisbug = false;
			// Rows temporary variables.
			Row row;
			Row row2;
			// Temporary objects acting has buffers.
			Object[] tmp;
			Object[] finalRow;
			
			// Analysis of the given file in order to determine the type of this file.
			if (excel.getName().contains(".xlsx")){
				book = new XSSFWorkbook(fis);
				sheet = book.getSheetAt(0);
				itr = sheet.iterator();
				if (sheet.getRow(0) != null)
					maxrows = sheet.getRow(0).getLastCellNum();
				else
					maxrows = sheet.getRow(1).getLastCellNum();
			}else{
				bookold = new HSSFWorkbook(fis);
				sheetold = bookold.getSheetAt(0);
				itr = sheetold.iterator();
				maxrows = sheetold.getRow(0).getLastCellNum();
			}
			tmp = new Object[maxrows];
			finalRow = new Object[6];
			
			// Analysis of the given file in order to determine the branch of this file.
			if (excel.getName().contains(".xlsx")){
				if (book.getSheetName(0).contains("Gemini")){
					branch = "GEMINI";
				}else if (excel.getName().contains("PLW") || book.getSheetName(0).contains("Sheet")){
					branch = "Planisware";
				}else if (book.getSheetName(0).contains("EBS R11")){
					branch = "Oracle R11";
				}else if (book.getSheetName(0).contains("EBS R12")){
					branch = "Oracle R12";
				}
			}else{
				if (bookold.getSheetName(0).contains("Gemini")){
					branch = "GEMINI";
				}else if (excel.getName().contains("PLW") || bookold.getSheetName(0).contains("Sheet")){
					branch = "Planisware";
				}else if (bookold.getSheetName(0).contains("EBS R11")){
					branch = "Oracle R11";
				}else if (bookold.getSheetName(0).contains("EBS R12")){
					branch = "Oracle R12";
				}
			}
			
			// Adds the initial header for the excel file.
			excelOriginal.put(Integer.toString(0), new Object[] {"username", "name", "manager", "responsability", "branch", "status"});
			
			// Skips the header row.
			if (itr.hasNext())
				row = itr.next();
			
			// Reads the original file and formats the data accordingly to it.
			while (itr.hasNext()) {
				row = itr.next();
				b = 0;
				Iterator<Cell> cellIterator = row.cellIterator();
				tmp = new Object[maxrows];
				finalRow = new Object[finalRow.length];
				
				// Extracting the cells of the current row.
				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();
					if (b == maxrows)
						b = 0;
					if (cell.getCellType() == Cell.CELL_TYPE_STRING){
						tmp[b] = cell.getStringCellValue();
					}else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
						tmp[b] = "";
					}else if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN){
						tmp[b] = "";
					}else if (cell.getCellType() == Cell.CELL_TYPE_BLANK){
						tmp[b] = "";
					}else if (cell.getCellType() == Cell.CELL_TYPE_ERROR){
						tmp[b] = "";
					}else if (cell.getCellType() == Cell.CELL_TYPE_FORMULA)
						tmp[b] = "";
					b++;
				}
				
				if (branch == "GEMINI"){ // Gemini data formating.
					finalRow[0] = tmp[3];
					finalRow[1] = "" + tmp[2] + " " + tmp[1];
					
					finalRow[2] = tmp[13];
					try{
						if (tmp[13].toString().indexOf(", ") != -1)
							finalRow[2] = tmp[13].toString().substring(tmp[13].toString().indexOf(", ")+2) + " " + tmp[13].toString().substring(0, tmp[13].toString().indexOf(", "));
						else
							tmp[13] = "";
					}catch (Exception e){
						finalRow[2] = "";
					}
					
					finalRow[3] = "" + tmp[0] + " : " + tmp[4];
				}else if (branch.contains("Oracle")){ // Oracle data formating.
					finalRow[0] = tmp[1];
					if (tmp[0] != null && tmp[0].toString().contains("Miss "))
						tmp[0] = tmp[0].toString().replace("Miss ", "");
					if (tmp[0] != null && tmp[0].toString().contains("("))
						tmp[0] = tmp[0].toString().substring(0, tmp[0].toString().indexOf("(")) + tmp[0].toString().substring(tmp[0].toString().indexOf(")")+1, tmp[0].toString().length());
					if (tmp[0] != null && tmp[0].toString().contains(", "))
						if (tmp[0].toString().contains("Mrs. ")){
							finalRow[1] = tmp[0].toString().substring(tmp[0].toString().indexOf(", Mrs. ")+7) + " " + tmp[0].toString().substring(0, tmp[0].toString().indexOf(", Mrs. "));
						}else if (tmp[0].toString().contains("Mr. ")){
							finalRow[1] = tmp[0].toString().substring(tmp[0].toString().indexOf(", Mr. ")+6) + " " + tmp[0].toString().substring(0, tmp[0].toString().indexOf(", Mr. "));
						}else{
							finalRow[1] = tmp[0].toString().substring(tmp[0].toString().indexOf(", ")+2) + " " + tmp[0].toString().substring(0, tmp[0].toString().indexOf(", "));
						}
					else{
						finalRow[0] = tmp[1];
						finalRow[1] = null;
						finalRow[2] = null;
					}
					finalRow[3] = tmp[4];
				}else if (branch.contains("Planisware")){ // Planisware data formating.
					finalRow[0] = tmp[0];
					finalRow[1] = tmp[1];
					finalRow[2] = null;
					finalRow[3] = tmp[13];
				}
				
				// Transforms the data(username, first/lastname and manager name) to lowercase to make futur steps easier.
				if (finalRow[0] != null)
					finalRow[0] = finalRow[0].toString().toLowerCase();
				if (finalRow[1] != null)
					finalRow[1] = finalRow[1].toString().toLowerCase();
				if (finalRow[2] != null)
					finalRow[2] = finalRow[2].toString().toLowerCase();
				
				// Assigns the third party logins to RH Person(assigny taking care of the third party logins)
				if (finalRow[0] != null && !finalRow[0].equals("@BLANK@") && finalRow[0].toString().contains("@"))
					finalRow[2] = "RH Person";
				
				// Static data assignation.
				finalRow[4] = branch;
				finalRow[5] = "waiting";
				
				// Excluding @BLANK@ account aka the system account which can't be used.
				if (tmp[0] != null && tmp[0].equals("@BLANK@")){
					planisbug = true;
				}
				
				// Appending formated data to the general hash map for later use.
				if ((tmp[0] != null && !tmp[0].equals("@BLANK@")) || tmp[0] == null || planisbug == true){
					excelOriginal.put(Integer.toString(a), finalRow);
					a++;
				}
			}
			
			// Transferring the formated data to the final buffer which will be saved on the disk.
			for (int i = 0; i<a;i++) {
				if (book != null)
					row2 = sheet.createRow(rownum);
				else
					row2 = sheetold.createRow(rownum);
				
				rownum++;
				Object[] objArr = excelOriginal.get(Integer.toString(i));
				int cellnum = 0;
				
				for (Object obj : objArr) {
					Cell cell = row2.createCell(cellnum++);
					if (obj instanceof String)
						cell.setCellValue((String) obj);
					else if (obj instanceof Date)
						cell.setCellValue((Date) obj);
					else if (obj instanceof Boolean)
						cell.setCellValue((Boolean) obj);
					else if (obj instanceof Double)
						cell.setCellValue((Double) obj);
				}
			}
			
			// Writing formated data to disk and closing all buffers.
			os = new FileOutputStream(excel.getName().substring(0, excel.getName().lastIndexOf(".")) + "_Formated" + excel.getName().substring(excel.getName().lastIndexOf(".")));
			if (book != null)
				book.write(os);
			else
				bookold.write(os);
			os.close();
			if (book != null)
				book.close();
			else
				bookold.close();
			fis.close();
			
			// Printing successful exit message.
			System.out.println("Finished.");
			
		} catch (FileNotFoundException fe) { // Catching file not found error.
			System.out.println("Operation incomplete, cause: File Not Found Using Provided Path.");
		} catch (IOException ie) { // Catching I/O error.
			System.out.println("Operation incomplete, cause: I/O Exception. Tip: did you open the file using an other program?");
		} catch (Exception e) { // Catching all non previously caught errors.
			e.printStackTrace();
			System.out.println("Operation incomplete, cause: Exception(s) aka Error(s).");
		}
		return 0;
	}
}
