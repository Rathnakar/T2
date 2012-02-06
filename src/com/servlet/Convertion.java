package com.servlet;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.lang.StringUtils;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.w3c.dom.Element;
import org.w3c.dom.Document;
import org.w3c.dom.Attr;



public class Convertion {
	
	DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
	DocumentBuilder docBuilder ;

	// root elements
	Document doc; 
	Element rootElement; 
	
	 
	// price elements
	Element price; 
	
	
	 
	
	public boolean getXmlConvert(String excelfileName,String realpath){
		
		Convertion con = new Convertion();
		con.createXML();
		 
		HSSFRow row;
	    String s="";
			 	
	 	File input = new File(excelfileName);
	 	try{
	 	if(input.exists()){
	 	FileInputStream fis = new FileInputStream(excelfileName);
	 	POIFSFileSystem fs = new POIFSFileSystem(fis);
	 	
	 	HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheet("Sheet1");
        System.out.println("Rows: "+sheet.getPhysicalNumberOfRows());
        for(int i=1; i<sheet.getPhysicalNumberOfRows(); i++){
        	if(i==1)
        	  	s="<GoldPrice per=''\"gram''\" date=''\"2011-03-28 06:32:17''\">";
           row = sheet.getRow(i);
           if(row != null && row.getPhysicalNumberOfCells() == 3)
              con.addXmlRow(row);
          }
                 
	 	}
	 	
	 	  }catch(FileNotFoundException e){
	 	  	}catch(IOException ee){
	 	  		}
	 	  
	 	return con.transformToXML(realpath);
	 	 
	}
	
	public void createXML(){
		try{
			docBuilder = docFactory.newDocumentBuilder();
			doc = docBuilder.newDocument();
	     	rootElement = doc.createElement("GoldPrice");
			
			Attr per = doc.createAttribute("per");
			per.setValue("gram");
			rootElement.setAttributeNode(per);
			
			price = doc.createElement("Price");
			doc.appendChild(rootElement);
			//rootElement.appendChild(staff);
		}catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		  } 
	}
		
	private synchronized void addXmlRow(HSSFRow row){
		HSSFRow rows = row;
		price = doc.createElement("Price");
		//System.out.println(rows.getPhysicalNumberOfCells());
		//HSSFCell cells = rows.getCell(0);
		if(StringUtils.isNotEmpty(rows.getCell(0).getStringCellValue().trim())){
			
		ArrayList<HSSFCell> cells = new ArrayList<HSSFCell>();
		Iterator iter = rows.iterator();
		while(iter.hasNext()){
			cells.add((HSSFCell)iter.next());
		}
		System.out.println("third cell "+cells.get(2).getCellType());
		// set attribute to Price element
		Attr attr = doc.createAttribute("currencyname");
		attr.setValue(cells.get(0).getStringCellValue());
		price.setAttributeNode(attr);
		
		// set attribute to Price element
		Attr attr1 = doc.createAttribute("currencycode");
		attr1.setValue(cells.get(1).getStringCellValue());
		price.setAttributeNode(attr1);
		
		// set attribute to Price element
		Attr val = doc.createAttribute("value");
		if(cells.get(2).getCellType() == 0)
		   val.setValue(Double.valueOf(cells.get(2).getNumericCellValue()).toString());
		else
			val.setValue(cells.get(2).getStringCellValue());
		price.setAttributeNode(val);
		
		
		rootElement.appendChild(price);
		}
		// staff.setAttribute("id", "1");

		// nickname elements
		//Element nickname = doc.createElement("currencycode");
		//nickname.appendChild(doc.createTextNode("mkyong"));
		//staff.appendChild(nickname);
	    }
	
	private boolean transformToXML(String realpath){
		 
		  try {
			// write the content into xml file
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
			File f = new File(realpath+ "/converted.xml");
			if(!f.exists()){
				try {
					f.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			StreamResult result = new StreamResult(f);

			transformer.transform(source, result);
  
			System.out.println("File saved!");
			return true;

		  } catch (TransformerException tfe) {
			tfe.printStackTrace();
			return false;
		  }
		  
		} 
			
}
