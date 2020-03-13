<%@page import="com.proj.model.BookingModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Show Bookings</title>
</head>
<body>
<div class="container">
<jsp:include page="menu.jsp"></jsp:include><br><br>
<br><br>
	<form action="searchbytourid" method="post">
	<label>Tour Id :</label>
	<input type="tel" name="tourid" placeholder="Enter Tour Id" required>
	<input type="submit" value="SEARCH">
	</form>
OR
<br>
	<form action="searchbybookingdate" method="post">
	<label>Booking Date :</label>
	<input type="text" name="date" placeholder="Enter Booking Date(02/03/2020)" required>
	<input type="submit" value="SEARCH">
	</form>
<br>

<%
	String admin = (String)session.getAttribute("adminusername");
	
	if(admin == null)
		response.sendRedirect("adminlogin.jsp");
	
	ArrayList<BookingModel> blist = (ArrayList<BookingModel>)session.getAttribute("bookinglist");
	if(blist.size()>0)
	{
%>



<table class="table table-striped">
	<tr>
		<th>BOOKING ID</th>
		<th>BOOKING DATE</th>
		<th>TOUR ID</th>
		<th>TOUR NAME</th>
		<th>NAME</th>
		<th>E-MAIL</th>
		<th>NO. OF PERSON</th>
		<th>TOTAL FARE</th>
		<th>PAY MODE</th>
	</tr>
	<%for(BookingModel bookingmodel : blist){ %>
	<tr>
		<td><%= bookingmodel.getBookingid()%></td>
		<td><%= bookingmodel.getBookingdate() %></td>
		<td><%= bookingmodel.getTourid()%></td>
		<td><%= bookingmodel.getTourname().toUpperCase() %></td>
		<td><%= bookingmodel.getName().toUpperCase()%></td>
		<td><%= bookingmodel.getEmail()%></td>
		<td><%= bookingmodel.getPeoples()%></td>
		<td><%= bookingmodel.getTotalfare()%></td>
		<td><%= bookingmodel.getPayoption().toUpperCase() %></td>
	</tr>
	<%}%>
</table>
<%}
	else
	{%>
<h3 style="brown: red;">NO RECORDS FOUND</h3>
<table class="table table-striped">
	<tr>
		<th>BOOKING ID</th>
		<th>BOOKING DATE</th>
		<th>TOUR ID</th>
		<th>TOUR NAME</th>
		<th>NAME</th>
		<th>E-MAIL</th>
		<th>NO. OF PERSON</th>
		<th>TOTAL FARE</th>
		<th>PAY MODE</th>
	</tr>
</table>
 <%
 }
%>


</div>
</body>
</html>