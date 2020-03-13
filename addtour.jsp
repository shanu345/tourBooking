<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String uname = (String)session.getAttribute("adminusername");
	if(uname == null)
		response.sendRedirect("adminlogin.jsp");
		%>
	<div class="container">
<jsp:include page="menu.jsp"></jsp:include>

<div class="row">
      <div class="col-md-6 col-sm-8 mx-auto">
           <div class="card">
               <div class="card-body" style="background-color: #eeefff">
                    <div class="mt-2 text-center">
                         <h3 style="color: red;">ADD TOUR</h3>
                         <h3 style="color: brown;">${msg}</h3>
                     </div>
                       <div class="mt-4 text-left">
                       	<form action="adminaddtour" method="post">
                       	
                       	  <div class="form-group">
                             <label class="text-uppercase font-weight-bold text-primary">Tour Name *</label>
                             <input type="text" name="tourname" placeholder="ENTER TOUR NAME" class="form-control" required>
                         </div>
                         
                         <div class="form-group">
                             <label class="text-uppercase font-weight-bold text-primary">Visiting Places *</label>
                           	 <input type="text" name="visiting_places" placeholder=" ENTER NAME OF VISITING PLACES" class="form-control" required>
                         </div>
                         
                         <div class="form-group">
                             <label class="text-uppercase font-weight-bold text-primary">Days *</label>
                            <input type="text" name="duration" placeholder="How Many DAY OR NIGHT" class="form-control" required>
                         </div>
                         
                         <div class="form-group">
                             <label class="text-uppercase font-weight-bold text-primary">Description *</label>
                             <input type="text" name="description" placeholder="SOMETHING ABOUT THAT PLACE" class="form-control" required>
                         </div>
                         
                         <div class="form-group">
                             <label class="text-uppercase font-weight-bold text-primary">Date *</label>
                             <input type="date" name="date" placeholder="dd/mm/yyyy" class="form-control" required>
                         </div>
                         
                         <div class="form-group">
                             <label class="text-uppercase font-weight-bold text-primary">Capacity *</label>
                             <input type="text" name="capacity" placeholder="Maximum Number of People Can Book" class="form-control" required>
                         </div>
                         
                         <div class="form-group">
                             <label class="text-uppercase font-weight-bold text-primary">Fare *</label>
                             <input type="tel" name="fare" placeholder="Enter Fare" class="form-control" required>
                         </div>
							
							<input type="submit" class="btn btn-success btn-block" value="ADD">

                     </form>
                   </div> <!-- Form tag div -->
              </div> <!-- Card Body End -->
          </div> <!-- Card End -->
       </div> <!-- Col alignment end -->
     </div> <!-- Row End -->
 </div> <!-- Container End -->
</body>
</html>