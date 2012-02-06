<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="com.servlet.Convertion"%>
  
<%
  
String fileName = "";
long size = 0;
String pu = "/Excel"; 
int physicalid=0;
String success="failure";
File file1=new File(application.getRealPath(pu));
boolean exists1 = file1.exists();
if (!exists1) 
{
  // Creating directory
  (new File(application.getRealPath(pu))).mkdir();
}

Vector vt = new Vector();
Vector vt1 = new Vector();
 
String dpath = pu+"/";
String dirname=request.getRealPath(dpath);
File dir=new File(dirname);

MultipartParser mp = new MultipartParser(request, 2*10*1024*1024); // 10MB
Part part2;

	 while ((part2 = mp.readNextPart()) != null)
		   {
        		String name = part2.getName();
				
				if (part2.isParam())
				{
				 ParamPart paramPart = (ParamPart) part2;
				 
				// if(name.equals("fname")) { fname = paramPart.getStringValue();
				//	 fname=fname.toUpperCase();
				  
				 
				 } 
				 else if (part2.isFile()) 
				 {
				  FilePart filePart = (FilePart) part2;
				   fileName = filePart.getFileName();
 
				   if (fileName != null) 
				   {
					 size = filePart.writeTo(dir);
 					 String st=dir+"\\" +fileName;
 						//String after=st.replace("\\","/");
						//String s=request.getRealPath(dpath);
						//System.out.print(s);
						//File rename=new File(st);
								
				 Convertion convertion=new Convertion();
				 
				 if(convertion.getXmlConvert(st,request.getRealPath(dpath)))
					success="success";
				 else
					success="failure";
				 
		   		   }		
				}
      		}
      	 response.sendRedirect("index.jsp?resp="+success);
      		 
%> 