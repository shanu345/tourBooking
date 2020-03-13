<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/validation.js"></script>
<title>FOR APPLY BOOKING/USER</title>
</head>
<body>

  <% 
  int seatsleft =Integer.parseInt(request.getParameter("seatsleft"));
  String tourname = (String)request.getParameter("tourname");
  String fare = (String)request.getParameter("fare");
  String id = (String)request.getParameter("id");
  
     String userid = (String)session.getAttribute("userid");
     String username = (String)session.getAttribute("username");
     
     Date date = new Date();
     SimpleDateFormat formatte  = new SimpleDateFormat("dd/MM/yyyy");
     String bookingdate = formatte.format(date);
     

	if (userid == null)
		response.sendRedirect("userlogin.jsp");%>
<div class="container">
 <jsp:include page="menu.jsp"></jsp:include>

 <div class="row">
      <div class="col-md-6 col-sm-8 mx-auto">
           <div class="card">
               <div class="card-body" style="background-color: #eeefff">
                    <div class="mt-2 text-center">
                         <h3 style="color: red;">BOOKING</h3>
                     </div>
               
                     <div class="mt-4 text-left">
                     	<div>
				         <input type="hidden" value="<%= seatsleft %>" id="seat">
				        </div>
                       <form action="userpayment.jsp" method="POST">

				        <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">TOUR ID :</label>
				         <input type="text" value="<%= id %>" name="tourid" class="form-control" readonly="readonly">
				        </div>
				        
				        <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">TOUR NAME :</label>
			             <input type="text" id="name" name="tourname" value="<%= tourname.toUpperCase() %>" class="form-control" readonly="readonly">
			            </div>
			            
			            <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">BOOKING DATE:</label>
				         <input type="text" value="<%= bookingdate %>" name="bookingdate" id="totalfare" class="form-control" readonly="readonly">
				        </div>
    
			            <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">CUSTOMER EMAIL :</label>
			             <input type="text" id="email" name="email" value="<%= userid %>" class="form-control" readonly="readonly">
			            </div>
			
			            <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">CUSTOMER NAME :</label>
			             <input type="text" id="name" name="name" value="<%= username.toUpperCase() %>" class="form-control" readonly="readonly">
			            </div>
			            
			            <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">TOUR FARE (per person):</label>
				         <input type="text" value="<%= fare %>" name="tfare" id="tfare" class="form-control" readonly="readonly">
				        </div>
				        
			            <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">NO OF PEOPLE * :</label>
			             <input type="tel" id="people" name="people" class="form-control" required onblur= "checkpeople()" onfocus= "clearpeople()">
			             <div class="text-danger font-weight-bold" id="peoplerrormessage"></div>
			            </div>
			            <input type="submit" class="btn btn-success btn-block" value="APPLY">


                     </form>
                   </div> <!-- Form tag div -->
              </div> <!-- Card Body End -->
          </div> <!-- Card End -->
       </div> <!-- Col alignment end -->
     </div> <!-- Row End -->
 </div> <!-- Container End -->
    

</body>
</html>