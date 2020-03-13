<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>USER LOGIN</title>
</head>
<body>
<div class="container">
 <jsp:include page="menu.jsp"></jsp:include>

 <div class="row">
      <div class="col-md-6 col-sm-8 mx-auto">
           <div class="card">
               <div class="card-body" style="background-color: #eeefff">
                    <div class="mt-2 text-center">
                         <h3 style="color: red;">LOGIN</h3>
                         <h3 style="color: brown;">${msg}</h3>
                     </div>
               
                     <div class="mt-4 text-left">
                       <form action="searchuserbyemail" method="post">
                       
                         <div class="form-group">
                             <label for="email" class="text-uppercase font-weight-bold text-primary">E-mail Id *</label>
                             <input type="text" name="email" class="form-control" placeholder="Enter E-mail Id" required >
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