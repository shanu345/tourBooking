
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.proj.model.BookingModel"%>
<%@page import="com.proj.model.TourModel"%>
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
<title>SHOW ALL TOUR</title>
</head>
<body>
<div class="container">
<jsp:include page="menu.jsp"></jsp:include>
<br>
 <%String uname = (String)session.getAttribute("adminusername");
	ArrayList<BookingModel> bmodellist = (ArrayList<BookingModel>)session.getAttribute("allbookinglist");
	if (uname == null)
		response.sendRedirect("adminlogin.jsp");
	
	 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/YYYY");
	 String conver;
	 LocalDate date;

	ArrayList<TourModel> alist = (ArrayList<TourModel>)session.getAttribute("alltourlist");
	if(alist.size()>0)
	{ 
%>

<br>

	<table class="table table-striped">
		<tr>
			<th>TOUR ID</th>
			<th>TOUR NAME</th>
			<th>VISITING PLACES</th>
			<th>DURATION</th>
			<th>DESCRIPTION</th>
			<th>TOTAL SEATS</th>
			<th>SEATS BOOKED</th>
			<th>DATE</th>
			<th>FARE</th>
			<th>DELETE</th>
		</tr>
	<% for(TourModel tourmodel : alist) {
		int bookedseats=0;
		for(BookingModel bookmodel : bmodellist){
			if(tourmodel.getId()== bookmodel.getTourid()){
			bookedseats+=bookmodel.getPeoples();
			}
		}
		date = LocalDate.parse(tourmodel.getDate());
		 conver = formatter.format(date);
		%>
		<tr>
			<td><%= tourmodel.getId() %></td>
			<td><%= tourmodel.getTourname().toUpperCase() %></td>
			<td><%= tourmodel.getVisiting_places() %></td>
			<td><%= tourmodel.getDuration() %></td>
			<td><%= tourmodel.getDescription() %></td>
			<td><%= tourmodel.getCapacity() %></td>
			<td><%= bookedseats %></td>
			<td><%= conver %></td>
			<td><%= tourmodel.getFare() %></td>

			<td><a href="/deletetour?id=<%= tourmodel.getId()%>">DELETE</a></td>

		</tr>
	<%
	}
	%>
	</table>	
<%
	}
	else
	{
%>

 <h1 style="color: red;">NO RECORDS FOUND</h1>
 <table class="table table-striped">
		<tr>
			<th>TOUR ID</th>
			<th>TOUR NAME</th>
			<th>VISITING PLACES</th>
			<th>DURATION</th>
			<th>DESCRIPTION</th>
			<th>TOTAL SEATS</th>
			<th>SEATS BOOKED</th>
			<th>DATE</th>
			<th>FARE</th>
		</tr>
</table>
 <%
 }
%>
</div>
</body>
</html>