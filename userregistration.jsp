<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/validation.js"></script>
<title>Reg page</title>
</head>
<body>
<div class="container">
 <jsp:include page="menu.jsp"></jsp:include>

 <div class="row">
      <div class="col-md-6 col-sm-8 mx-auto">
           <div class="card">
               <div class="card-body" style="background-color: #eeefff">
                    <div class="mt-2 text-center">
                         <h3 style="color: red;">REGISTRATION</h3>
                     </div>
               
                     <div class="mt-4 text-left">
                       <form action="register" method="post">
                       
                         <div class="form-group">
                               <label for="name" class="text-uppercase font-weight-bold text-primary">Name *</label>
                                 <input type="text" class="form-control" id="name" name="name" placeholder="Enter Your Full Name" required="required" onblur="checkname()" onfocus= "clearname()">
                                 <div class="text-danger font-weight-bold" id="nameerrormessage"></div>
                         </div>
						 
						    <div class="form-group">
                                 <label for="email" class="text-uppercase font-weight-bold text-primary">Email</label>
                                 <input type="email" class="form-control" id="email" name="email" placeholder="Enter Your Email" required="required" onblur="checkemail()" onfocus= "clearemail()">
                                 <div class="text-danger font-weight-bold" id="emailerrormessage"></div>
                             </div>
						 
						         <div class="form-group">
                                 <label for="mobileno" class="text-uppercase font-weight-bold text-primary">Mobile No</label>
                                 <input type="tel" class="form-control" id="mobno" name="mobileno" placeholder="Enter Your Mobile No" required="required" onblur="checkmobno()" onfocus= "clearmobno()">
                                 <div class="text-danger font-weight-bold" id="mobnoerrormessage"></div>
                             </div>
                     		 <div class="form-group">
                                 <label for="state" class="text-uppercase font-weight-bold">State *</label>
                                 <select name="state" id="state" onchange="checkstate()">
                                       <option selected value="Default">Select State</option>
                                       <option value="Uttar Pradesh">Uttar Pradesh</option>
                                       <option value="Kerala">Kerala</option>
                                       <option value="Maharashtra">Maharashtra</option>
                                       <option value="Tamil Nadu">Tamil Nadu</option>
                                       <option value="Rajasthan">Rajasthan</option>
                                       <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                       <option value="karnataka">karnataka</option>
                                       <option value="Bihar">Bihar</option>
                                       <option value="Gujarat">Gujarat</option>
                                       <option value="Punjab">Punjab</option>
                                       <option value="Andhra Pradesh">Andhra Pradesh</option>
                                       <option value="Madhya">Madhya</option>
                                       <option value="Goa">Goa</option>
                                       <option value="Haryana">Haryana</option>
                                       <option value="Telangana">Telangana</option>
                                       <option value="Assam">Assam</option>
                                       <option value="West Bengal">West Bengal</option>
                                       <option value="Odisha">Odisha</option>
                                       <option value="Jharkhand">Jharkhand</option>
                                       <option value="Manipur">Manipur</option>
                                       <option value="Chhattisgarh">Chhattisgarh</option>
                                       <option value="Nagaland">Nagaland</option>
                                        <option value="Sikkim">Sikkim</option>
                                       <option value="Uttarakhand">Uttarakhand</option>
                                       <option value="Himachal Pradesh">Himachal Pradesh</option>
                                        <option value="Tripura">Tripura</option>
                                       <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                       <option value="Meghalaya">Meghalaya</option>
                                        <option value="Mizoram">Mizoram</option>
                                 </select>
                                 <div class="text-danger font-weight-bold" id="stateerrormessage"></div>
                             </div>
                              <div class="form-group">
                                 <label for="gender" class="text-uppercase font-weight-bold">Gender</label>
                                 <input type="radio" name="gender" id="male" value="Male" onclick="cleargender()" />
                                      <span id="maledisp">Male</span>
                                 <input type="radio" name="gender" id="female" value="Female" onclick="cleargender()" />
                                      <span id="femaledisp">Female</span>
                                 <div class="text-danger font-weight-bold" id="gendererrormessage"></div>
                             </div>
                                            
                                                  
                           <div class="form-group">
                                  <label for="password" class="text-uppercase font-weight-bold">Password</label>
                                  <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required="required" onblur="checkpassword()" onfocus= "clearpassword()">
                                  <div>1 Digit,1 LowerCase,1 UpperCase. Min 4 - Max 8</div>
                                  <div class="text-danger font-weight-bold" id="passerrormessage"></div>
                             </div>
                                    
                         <input type="submit" class="btn btn-success btn-block" value="LOGIN">
                     </form>
                   </div> <!-- Form tag div -->
              </div> <!-- Card Body End -->
          </div> <!-- Card End -->
       </div> <!-- Col alignment end -->
     </div> <!-- Row End -->
 </div> 
</body>
</html>