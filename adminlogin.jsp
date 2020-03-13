<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>ADMIN LOGIN</title>
</head>
<body>
<div class="container">
 <jsp:include page="menu.jsp"></jsp:include>

 <div class="row">
      <div class="col-md-6 col-sm-8 mx-auto">
           <div class="card">
               <div class="card-body" style="background-color: #eeefff">
                    <div class="mt-2 text-center">
                         <h3 style="color: red;">ADMIN LOGIN</h3>
                         <h3 style="color: brown;">${errormsg}</h3>
                     </div>
               
                     <div class="mt-4 text-left">
                       <form action="adminlogincheck" method="post">
                       
                         <div class="form-group">
                             <label for="admin_id" class="text-uppercase font-weight-bold text-primary">Admin Id *</label>
                             <input type="text" name="admin_id" class="form-control" placeholder="Enter ADMIN Id" required >
                         </div>
                                            
                                                  
                         <div class="form-group">
                              <label for="password" class="text-uppercase font-weight-bold text-primary">Password *</label>
                              <input type="password" name="password" class="form-control" placeholder="Enter Password" required>
                         </div>
                                    
                         <input type="submit" class="btn btn-success btn-block" value="LOGIN">
                     </form>
                   </div> <!-- Form tag div -->
              </div> <!-- Card Body End -->
          </div> <!-- Card End -->
       </div> <!-- Col alignment end -->
     </div> <!-- Row End -->
 </div> <!-- Container End -->


</body>
</html>