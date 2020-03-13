<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>USER DASHBOARD</title>
</head>
<body>
<%
    String uname = (String)session.getAttribute("username");
    uname = uname.toUpperCase();
    if(uname == null)
    	response.sendRedirect("userlogin.jsp");
%>
<div class="container">
   <jsp:include page="menu.jsp"></jsp:include>
   
   <h1> WELCOME <%= uname %> </h1>

</div>
</body>
</html>