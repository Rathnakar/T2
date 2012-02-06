<%@ page language="java" import="java.util.*,java.io.*,java.nio.*;" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'convert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="" >
   	 This is my JSP page. <br>
   	 
   	 <% String s = "hi"; 
   	 char[] buffer = new char[512];
   	 	out.println(s);
   	 	File f = new File("converted.xml");
   	 	
   	 	File input = new File("../../../jsp/gold.xlsx");
   	 	
   	 	if(input.exists()){
   	 	FileInputStream fis = new FileInputStream("gold.xlsx");
   	 	InputStreamReader isr = new InputStreamReader(fis);
   	 	out.println(isr.read(buffer));
   	 	}
   	 	else
   	 	  out.println(input.exists());
   	 	  
   	 	f.createNewFile();
   	 	if(f.exists()){
   	 	  out.println(true);
   	 	  }
   	 	  else 
   	 	  out.println(false);
   	 
   	 out.print("Sample");
   	 
   	 
   	 
   	 
   	 
   	 
   	 
   	 
   	 
   	 
   	 %>
   	 
    </form>
  </body>
</html>
