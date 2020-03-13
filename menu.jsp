<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>MENU BAR</title>
</head>
<body>
<br/>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  
    <ul class="navbar-nav">

<%
    String auname = (String)session.getAttribute("adminusername");
    String userid = (String)session.getAttribute("userid");

    if (auname != null && auname.equalsIgnoreCase("ADMIN"))
    {
%>
      <li class="nav-item">
        <a class="nav-link" href="/adminhome">ADMIN HOME</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/addtour">ADD TOUR</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/viewalltour">VIEW ALL TOUR</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adminshowallbooking">VIEW ALL BOOKINGS</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adminlogout">LOGOUT</a>
      </li>
<%
    }
    else if(userid != null)
    {
 %>
        <li class="nav-item">
        <a class="nav-link" href="/userhome">USER HOME</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/showalltour">VIEW ALL TOUR</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/usershowallbooking">BOOKINGS</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/userlogout">LOGOUT</a>
      </li>
 <%   	
    }
    else
    {
%>
       <li class="nav-item">
        <a class="nav-link" href="/">HOME</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/userreg">REGISTRATION</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/userlogin">LOGIN</a>
      </li> 
      <li class="nav-item">
        <a class="nav-link" href="/aboutus">ABOUT US</a>
      </li>    
      <li class="nav-item">
        <a class="nav-link" href="/contactus">CONTACT US</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adminlogin">ADMIN</a>
      </li>    
  <%
    }
  %>    
    </ul>
  </nav>
    
   <br/>


</body>
</html>