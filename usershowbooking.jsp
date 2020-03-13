<%@page import="java.time.LocalDate"%>
<%@page import="com.proj.model.TourModel"%>
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
<title>User Show Booking</title>
</head>
<body>
<div class="container">
<jsp:include page="menu.jsp"></jsp:include>
<br>
<%
	String usern = (String)session.getAttribute("userid");
	
	if(usern == null)
		response.sendRedirect("userlogin.jsp");
	ArrayList<TourModel> atlist = (ArrayList<TourModel>)session.getAttribute("tlist");
	LocalDate systemdate = LocalDate.now();
	LocalDate fdate;
	ArrayList<BookingModel> blist = (ArrayList<BookingModel>)session.getAttribute("bookinglist");
	if(blist.size()>0)
	{
%>
	<table class="table table-striped">
	<tr>
		<th>BOOKING ID</th>
		<th>BOOKING DATE</th>
		<th>TOUR NAME</th>
		<th>NAME</th>
		<th>E-MAIL</th>
		<th>NO. OF PERSON</th>
		<th>TOTAL FARE</th>
		<th>PAYMENT</th>
		<th>CLICK</th>
	</tr>
	<%
	for(BookingModel bookingmodel : blist){ 
		for(TourModel tourmodel : atlist){
			if(bookingmodel.getTourid()==tourmodel.getId()){
				fdate = LocalDate.parse(tourmodel.getDate());
				int gap =fdate.compareTo(systemdate);
		
	%>
	<tr>
		<td><%= bookingmodel.getBookingid()%></td>
		<td><%= bookingmodel.getBookingdate() %></td>
		<td><%= bookingmodel.getTourname().toUpperCase()%></td>
		<td><%= bookingmodel.getName().toUpperCase()%></td>
		<td><%= bookingmodel.getEmail()%></td>
		<td><%= bookingmodel.getPeoples()%></td>
		<td><%= bookingmodel.getTotalfare()%></td>
		<td><%= bookingmodel.getPayoption().toUpperCase() %></td>
		<%if(gap>=0){ %>	
		<td><a href="deleteid?id=<%= bookingmodel.getBookingid()%>">CANCEL</a></td>
		<%
		} 
		else{
		%>
		<td><a href="#">FEEDBACK</a></td>
	</tr>
	<%
	}
	}
	}
	}%>
</table>
<%}
	else
	{%>

<h4>NO RECORDS </h4>
<table class="table table-striped">
	<tr>
		<th>BOOKING ID</th>
		<th>BOOKING DATE</th>
		<th>TOUR NAME</th>
		<th>NAME</th>
		<th>E-MAIL</th>
		<th>NO. OF PERSON</th>
		<th>TOTAL FARE</th>
		<th>PAYMENT</th>
		<th>CLICK</th>
	</tr>
</table>
 <%
 }
%>


</div>
</body>
</html>