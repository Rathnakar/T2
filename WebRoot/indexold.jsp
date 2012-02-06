<%@ page pageEncoding="ISO-8859-1" contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
  <form action="servlet/SampleServlet" method="post" >
    This is my JSP page.
    <br/> 
    
    <br/>
    
    <select>
      <option  id="default" value="0" name="Select">Select</option>  
    <% if(request.getAttribute("var")!=null)
    {
   ArrayList ad=(ArrayList)request.getAttribute("var");
   //out.print(ad.size());
   if(ad.size()>0)
   {
   Iterator a=ad.iterator();
   while(a.hasNext())
   {
   String string[]=(String[])a.next();
   int i = 0;
   for(i=0;i<string.length;i++) {
              //out.print("<br><b>"+string[i]+"</b></br>"); 
              %>
       
   <option   ><%= string[i] %></option>       
   <%}
   } 
   }
    } %>
    
    </select>
    
   <br/><br/><br/><br/>
    <input type="submit" value="CallServlet"/>
   </form> 
  </body>
</html>
