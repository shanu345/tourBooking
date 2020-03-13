<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
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
<title>SHOW ALL TOUR FOR USER</title>
</head>
<body>
<div class="container">
<jsp:include page="menu.jsp"></jsp:include>
<br><br>
<%String usern = (String)session.getAttribute("userid");
	ArrayList<BookingModel> bmlist = (ArrayList<BookingModel>)session.getAttribute("bmlist");
	if (usern == null)
		response.sendRedirect("userlogin.jsp");
	ArrayList<TourModel> atlist = (ArrayList<TourModel>)session.getAttribute("tlist");
	
	//SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	
	 LocalDate today = LocalDate.now();
     DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/YYYY"); 
    // System.out.println(formatter.format(dt1)); 

	if(atlist.size()>0)
	{
%>


	<form action="searchbytour" method="post">
	<input type="text" name="tourname" placeholder="Enter Place Name" required>
	<input type="submit" value="SEARCH">
	</form>
<br>

	<table class="table table-striped">
		<tr>
			<th>TOUR NAME</th>
			<th>VISITING PLACES</th>
			<th>DURATION</th>
			<th>DESCRIPTION</th>
			<th>AVAILABLE SEATS</th>
			<th>DATE</th>
			<th>FARE</th>
			<th>CLICK</th>
		</tr>
	<% 
		for(TourModel tourmodel : atlist) 
		{
			int leftseats = tourmodel.getCapacity();
			for(BookingModel bmobj : bmlist){
				if(tourmodel.getId()== bmobj.getTourid()){
				leftseats -=bmobj.getPeoples();
				}
			}
			
			 LocalDate fdate = LocalDate.parse(tourmodel.getDate());
			 int gap =fdate.compareTo(today);
			 if(gap>=0){
			
	%>
		<tr>
			<td><%= tourmodel.getTourname().toUpperCase() %></td>
			<td><%= tourmodel.getVisiting_places() %></td>
			<td><%= tourmodel.getDuration() %></td>
			<td><%= tourmodel.getDescription() %></td>
			<td><%= leftseats%>  </td>
			<td><%= tourmodel.getDate() %></td>
			<td><%= tourmodel.getFare() %></td>
			<%if(leftseats>0){ %>			
			<td><a href="applybooking.jsp?id= <%= tourmodel.getId()%>&fare= <%= tourmodel.getFare() %>&tourname=<%= tourmodel.getTourname() %>&seatsleft=<%= leftseats%>">BOOKING</a></td>
			<%} %>
		</tr>
<%
	}
		}
%>
	</table>	
<%
	}
	else
	{
%>

<h4>NO RECORDS </h4>
<table class="table table-striped">
	<tr>
			<th>TOUR NAME</th>
			<th>VISITING PLACES</th>
			<th>DURATION</th>
			<th>DESCRIPTION</th>
			<th>AVAILABLE SEATS</th>
			<th>DATE</th>
			<th>FARE</th>
			<th>CLICK</th>
		</tr>
</table>
 <%
 }
%>
</div>
</body>
</html>