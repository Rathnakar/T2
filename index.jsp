<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
 
	 
a:link {color: #660066;  text-decoration: none;}
a:visited {color: #660066; text-decoration: none;}
a:hover {text-decoration: none; color: #ff9900;
font-weight:bold;}
a:active {color: red;text-decoration: none}
</style>
<script>

function validateFileExtension(fld) {
if(!/(\.xls)$/i.test(fld.value)) {
alert("Invalid file type - Select xls File");
fld.form.reset();
fld.focus();
return false;
}
return true;
}
</script>
</head>
<body>
       <h3 align="center"> Excel To Xml </h3>
 <form name="sform" method="post" action="fileUpload.jsp" enctype="multipart/form-data">
 <table width="1080px" >
 <tr><td>&nbsp;</td></tr>
 <tr><td>&nbsp;</td></tr>
 <tr><td>&nbsp;</td></tr>
 <tr align="center">
  <td  width="30%" align="right" class="alt1" style="color:blue"><b>Microsoft Excel File: </b></td>
  <td  width="70%"   align="left" style="padding-left:10px" class="alt1">
  <input type='file'name="attach" id="attach"  onchange="return validateFileExtension(this);">
  
  <input type="submit" value="Convert"></input></td> 
  </tr><tr><td>&nbsp;</td></tr>
 <tr><td>&nbsp;</td></tr>
  <% if(request.getParameter("resp")!= null){
  if(request.getParameter("resp").equals("success")){ %>
     <tr> <td colspan="2" align="center" class="alt1" style="color:green"> 
     <b> XML file uploaded  Successfully. <a href="Excel/converted.xml"   target="_blank">Click Here to view</a> <b> </td> </tr>
  <%}else{ %>
     <tr><td  colspan="2" align="center" class="alt1" style="color:red"> <b> Failed uploading <b> </td> </tr>
  <%}
  } %>
  
  </table>
  </form>
</body>
</html>
