<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html>
<html lang="en">



<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="ScriptsBundle">
	<title>Expert messaging</title>
	
	<link rel="icon" href="<c:url value="/resources/images/favicon.ico"/>" type="image/x-icon" />
	
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
	
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
	
	<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.css"/>">
	
	<link rel="stylesheet" href="<c:url value="/resources/css/et-line-fonts.css"/>">
	
	<link href="../../../fonts.googleapis.com/cssd7e8.css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic|Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/owl.carousel.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/owl.style.css"/>">
	
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/styles/shCoreDefault.css" />"/>
   
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/animate.min.css" />"/>
   
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap-dropdownhover.min.css" />"/>
 
 
 
 
  <script src="js/modernizr.js"></script>
  
</head>

<body>
 
  <div class="preloader"><span class="preloader-gif"></span>
  </div>
  
  <div class="top-bar">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4">
				<ul class="top-nav nav-left">
					<li><a href="/index.jsp">Home</a>
					</li>
					
<!-- 					<li><a href="contact">Contact Us</a> -->
<!-- 					</li> -->
				</ul>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
				<ul class="top-nav nav-right">
					
				</ul>
			</div>
		</div>
	</div>
</div>
  
  <div class="navbar navbar-default">
    <div class="container">
      
      <div class="navbar-header">
        <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        
        <a href="/index.jsp" class="navbar-brand"><img class="img-responsive" alt="" src="images/logo.png">
        </a>
        
      </div>
     
      <div class="navbar-collapse collapse">
        
        <ul class="nav navbar-nav navbar-right">
         
        </ul>
      </div>
      
    </div>
  </div>
 
  <div class="main-content-area">

  
    <section class="page-title">
      <div class="container">
        <div class="row">
          <div class="col-md-7 col-sm-7 co-xs-12 text-right">
              <h1>Customer Registration</h1>
          </div>
          </div>
          </div>
            
    </section>
</div>
   
    <section class="section-padding-80 white" id="register">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3">

            <div class="box-panel">

             
              <form action="registerCustomer" method="post">
                  
                <div class="form-group">
                  <!--label>Id</label-->
                  <label>Email</label>
                  <input type="email" placeholder="Enter your email" name="id" class="form-control" required>
                </div>
                <div class="form-group">
                  <label>Password</label>
                  <input type="password" placeholder="Enter your password" name="password" class="form-control" required id="myInput"><br>
                 <input type="checkbox" onclick="myFunction()"> Show Password
                  </div>
                <div class="form-group">
                  <label>First Name</label>
                  <input type="text" placeholder="Enter your firstName" name="firstName" class="form-control" required>
                </div>
                <div class="form-group">
                  <label>Last Name</label>
                  <input type="text" placeholder="Enter your lastName" name="lastName" class="form-control" required>
                </div>
                <div class="form-group">
                  <label>Mobile Number</label>
                  <input type="text" placeholder="ENter your Mobile Number" name="mobileNumber" class="form-control" required>
                </div>
                <div class="form-group">
                  <div class="row">

                    <div class="col-xs-12 text-right">
                      <a href="login_form.jsp">Already Register Sign In</a>
                    </div>
                  </div>
                </div>

                <button class="btn btn-primary btn-lg btn-block">Create Account</button>

             
                  </form>
           

            </div>
          </div>

<script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
            
          <div class="clearfix"></div>
        </div>
      </div>
  
    </section>
  <footer class="footer-area">
    <div class="footer-copyright">
      <div class="auto-container clearfix">
     
        <div class="copyright text-center">Copyright 2019 &copy; Theme Created By <a>Group 7 CSA 4th year SVVV </a> All Rights Reserved</div>
      </div>
    </div>
  </footer>


	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	
	<script src="<c:url value="/resources/js/jquery.smoothscroll.js"/>"></script>
	
	<script type="text/javascript" src="<c:url value="/resources/js/easing.js"/>"></script>
	
	<script src="<c:url value="/resources/js/jquery.countTo.js"/>"></script>
	
	<script src="<c:url value="/resources/js/jquery.waypoints.js"/>"></script>
	
	<script src="<c:url value="/resources/js/jquery.appear.min.js"/>"></script>
	
	<script src="<c:url value="/resources/js/carousel.min.js"/>"></script>
	
	<script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
	
	<script src="<c:url value="/resources/js/bootstrap-dropdownhover.min.js"/>"></script>
	
	<script type="text/javascript" src="<c:url value="/resources/scripts/shCore.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/scripts/shBrushPhp.js"/>"></script>
	
	<script src="<c:url value="/resources/js/custom.js"/>"></script>
</body>



</html>
