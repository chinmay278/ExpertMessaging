<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dao.CustomerDAO"%>
<%@page import="com.dto.Customer"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Customer cust = new Customer();
    cust.setId((String)session.getAttribute("userid"));
    
       ApplicationContext context = 
   			new ClassPathXmlApplicationContext("spring.xml");
   	 CustomerDAO cd = 
   			 (CustomerDAO) context.getBean("custdao");
   	 
   	Customer c=cd.getCustomerById(
   			(String)session.getAttribute("userid"));
    
%>
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
					<li><a href="custhome">Home</a>
					</li>
				
					
				</ul>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
				<ul class="top-nav nav-right">
					
					<li class="dropdown"> 
						<a class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-animations="fadeInUp">
							<img class="img-circle resize" alt="" src="<c:url value="/resources/images/authors/13.png"/>">
							<span  style="text-transform: lowercase" class="hidden-xs small-padding">
								<%
                                                                    String name=(String)session.getAttribute("userid");
                                                                    out.print(name);
                                                                    %>
							 <i class="fa fa-caret-down"></i>
							</span>
						</a>
						<ul class="dropdown-menu ">
							
							<li><a href="logoutcust"><i class="icon-lock"></i> Logout</a></li>
						</ul>
					 </li>
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
        
         
          <li>
            <div class="btn-nav"><a href="postquestion" class="btn btn-primary btn-small navbar-btn">Post Question</a>
            </div>
          </li>
        </ul>
      </div>
     
    </div>
  </div>
  
  <div class="main-content-area">

   </div>
    <section id="user-profile" class="user-profile parallex">
      <div class="container">
        
        <div class="row">

          <div class="col-md-12 col-xs-12 col-sm-12">
            <div class="profile-sec ">
              <div class="profile-head">
                <div class="col-md-6 col-xs-12 col-sm-8 no-padding">
                  <div class="profile-avatar">
                    <!--span><img class="img-responsive img-circle" alt="" src="images/authors/author-large.jpg"></span-->
                    <div class="profile-name">
                      <h3>Customer Profile</h3>
                      <i>Expert Messaging System</i>

                    </div>
                  </div>
                </div>
              
              </div>
            </div>
            
          </div>

        </div>
       
      </div>
     
    </section>

 
    <section class="section-padding-80" id="login">
      <div class="container">
        <div class="row">
          <div class="col-sm-4 col-md-3">

            
            </div>

            <div class="col-md-6">

            <div class="box-panel">
      
              <form action="updatecustomer" method="post">
                  
                   <div class="form-group">
                  <label>Password</label>
                  <input type="password" placeholder="Enter your Password" value="<%=c.getPassword()%>" name="password" class="form-control" id="myInput"><br>
                  <input type="checkbox" onclick="myFunction()"> Show Password
<input type="hidden" name="id" value="<%=(String)session.getAttribute("userid")%>"/>
                  </div>
                <div class="form-group">
                  <label>First Name</label>
                  <input type="text" placeholder="Enter your first name" value="<%=c.getFirstName()%>" name="firstName" class="form-control">
                </div>
                   <div class="form-group">
                  <label>Last Name</label>
                  <input type="text" placeholder="Enter your last name" value="<%=c.getLastName()%>" name="lastName" class="form-control">
                </div>
                    <div class="form-group">
                  <label>Mobile Number</label>
                  <input type="text" placeholder="Enter your Mobile Number" value="<%=c.getMobileNumber()%>" name="mobileNumber" class="form-control">
                </div>
                <div>
                    <center><button type="submit" class="btn btn-primary btn-lg">  Update My Profile</button></center>
                </div>
              </form>
                
             

            </div>
          </div>

          <div class="clearfix"></div>
        </div>
      </div>
     
    </section>
 
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
