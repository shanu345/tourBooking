<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	String peoples = (String)request.getParameter("people");
  String tourname = (String)request.getParameter("tourname");
  String totalfare = (String)request.getParameter("tfare");
  String tourid = (String)request.getParameter("tourid");
  String date = (String)request.getParameter("bookingdate");
  
     String userid = (String)session.getAttribute("userid");
     String username = (String)session.getAttribute("username");
     
     

	if (userid == null)
		response.sendRedirect("userlogin.jsp");%>
<div class="container">
 <jsp:include page="menu.jsp"></jsp:include>

 <div class="row">
      <div class="col-md-6 col-sm-8 mx-auto">
           <div class="card">
               <div class="card-body" style="background-color: #eeefff">
                    <div class="mt-2 text-center">
                         <h3 style="color: red;">Payment</h3>
                     </div>
               
                     <div class="mt-4 text-left">

						<form action="tour" method="POST">

				        <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">TOUR ID :</label>
				         <input type="text" value="<%= tourid %>" name="tourid" class="form-control" readonly="readonly">
				        </div>
				        
				        <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">TOUR NAME :</label>
			             <input type="text" id="name" name="tourname" value="<%= tourname.toUpperCase() %>" class="form-control" readonly="readonly">
			            </div>
			            
			            <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">BOOKING DATE:</label>
				         <input type="text" value="<%= date %>" name="bookingdate" id="totalfare" class="form-control" readonly="readonly">
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
				         <input type="text" value="<%= totalfare %>" name="totalfare" id="totalfare" class="form-control" readonly="readonly">
				        </div>
				        
			            <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">NO OF PEOPLE * :</label>
			             <input type="text" id="peoples" name="peoples" class="form-control" readonly="readonly" value="<%=peoples%>">
			             <div class="text-danger font-weight-bold" id="peoplerrormessage"></div>
			            </div>
			            
			            <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">NO OF PEOPLE * :</label>
			            <select name="payoption">
			            	<option value="Default">Select...</option>
			            	<option value="Card">Card</option>
			            	<option value="Net Banking">Net Banking</option>
			            </select>
			            </div>
			            <input type="submit" class="btn btn-success btn-block" value="CONFIRM">
			            
			            </form>
			      </div> <!-- Form tag div -->
              </div> <!-- Card Body End -->
          </div> <!-- Card End -->
       </div> <!-- Col alignment end -->
     </div> <!-- Row End -->
 </div> <!-- Container End -->

</body>
</html>