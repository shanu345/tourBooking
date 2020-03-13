<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>

<% String uname = (String)session.getAttribute("adminusername");
	if(uname == null)
		response.sendRedirect("adminlogin.jsp");
		%>
		
	<div class="container">
       <jsp:include page="menu.jsp"></jsp:include>
       
     <h3> WELCOME <%= uname %> </h3>
    
	</div>

</body>
</html>