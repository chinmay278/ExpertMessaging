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
	
	<script src="<c:url value="/resources/js/modernizr.js"/>"></script>
	
    <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	
</head>

<body>
	
	<div class="preloader"><span class="preloader-gif"></span>
	</div>
	
	<div class="top-bar">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4">
				<ul class="top-nav nav-left">
					<li><a href="index.jsp">Home</a>
					</li>
				</ul>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
				<ul class="top-nav nav-right">
					<li class="dropdown"> 
						<a class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-animations="fadeInUp">
							<img class="img-circle resize" alt="" src="images/authors/13.png">
                                                        <span style="text-transform: lowercase" class="hidden-xs small-padding">
                                                            <%
                                                                    String name=(String)session.getAttribute("userid");
                                                                    out.print(name);
                                                                    
                                                                    %>
							 <i class="fa fa-caret-down"></i>
                                                        </span>
						
						</a>
						<ul class="dropdown-menu ">
							
							<li><a href="profile_setting"><i class=" icon-gears"></i>Customer Profile Setting</a></li>
		
							<li><a href="logoutcust"><i class="icon-lock"></i> Logout</a>
                                                           
                                                        </li>
						</ul>
					 </li>
				</ul>
			</div>
		</div>
	</div>
</div>
	
	<div class="navbar navbar-default">
		<div class="container">
			<!-- header -->
			<div class="navbar-header">
				<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">	<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
				<a href="index.jsp" class="navbar-brand">
					<img class="img-responsive" alt="" src="<c:url value="/resources/images/logo.png"/>"/>
				</a>
				
			</div>
			
			<div class="navbar-collapse collapse">
				
				<ul class="nav navbar-nav navbar-right">
					
			
					<li>
						<div class="btn-nav"><a href="post-question" class="btn btn-primary btn-small navbar-btn">Post Question</a>
						</div>
					</li>
				</ul>
			</div>
			
		</div>
	</div>
	
	<div class="full-section search-section">
		<div class="search-area container">
			<h3 class="search-title">Have a Question?</h3>
			<p class="search-tag-line">If you have search any question you can write or enter what you are looking for!</p>
			<form autocomplete="off" method="get" class="search-form clearfix" id="search-form" action="showsearchresult">
                            <input type="text" title="* Please enter a search term!" placeholder="Type your search terms here" class="search-term " autocomplete="off" name="search">
				<input type="submit" value="Search" class="search-btn">
			</form>
		</div>
	</div>

	<div class="main-content-area">
            
            <section class="white question-tabs padding-bottom-80" id="latest-post">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    
                                    <ul class="nav panel-tabs">
                                        <li class="active"> <a data-toggle="tab" href="#tab1"><i class="icofont icon-ribbon"></i><span class="hidden-xs">Answered Questions</span></a> 
                                        </li>
                                        <li> <a data-toggle="tab" href="#tab2"><i class="icofont icon-layers"></i><span class="hidden-xs">Unanswered Questions</span></a> 
                                        </li>
                                        <li> <a data-toggle="tab" href="#tab3"><i class="icofont icon-layers"></i><span class="hidden-xs">Incident Raised</span></a> 
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div id="tab1" class="tab-pane active">
                                        
                                        <jsp:include page="/ShowAllAnswersToCustomer.jsp"/>
                                       
                                    </div>
                                    <div id="tab2" class="tab-pane">
                                        
                                        <jsp:include page="/ShowAllQuestionsToCustomer.jsp"/> 
                                    </div>
                                       
                                   <div id="tab3" class="tab-pane">
                                        
                                        <jsp:include page="/404.jsp"/> 
                                    </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
               
			<!-- end container -->
        </section>
 </div>
		
		<section data-stellar-background-ratio="0.1" class="testimonial-bg parallex">
			<div class="container">
				
				<div class="row">
					
					<div class="col-md-8 ">
						<div id="owl-slider" class="happy-client">
							<div class="item"> <i class="fa fa-quote-left"> </i>
								<p>Expert Messaging System is a question and answer site for professional and enthusiasts. It features questions and answers on a wide variety of topics ranging from music , sports , business , art , cookery , health etc. The website serves as a platform for users to ask questions and assigned experts for the topics to answer those questions.</p>
								<div class="client-info-wrap clearfix">
									<div class="client-img">
										<!--img class="img-circle" src="../../../theemon.com/d/designagency/LivePreview/assets/images/client-img-two.jpg" alt="" /-->
									</div>
									<div class="client-info"> <strong>Expert Messaging</strong>
									</div>
								</div>
							</div>
							<div class="item"> <i class="fa fa-quote-left"> </i>
								<p>Expert Messaging System is a question and answer site for professional and enthusiasts. It features questions and answers on a wide variety of topics ranging from music , sports , business , art , cookery , health etc. The website serves as a platform for users to ask questions and assigned experts for the topics to answer those questions.</p>
								<div class="client-info-wrap clearfix">
									<div class="client-img">
										<!--img class="img-circle" src="../../../theemon.com/d/designagency/LivePreview/assets/images/client-img-two.jpg" alt="" /-->
									</div>
									<div class="client-info"> <strong>Expert Messaging</strong> 
									</div>
								</div>
							</div>
						</div>
					</div>
			
					<div class="col-md-4 no-padding">
						<div class="success-stories">
							<div class="main-heading text-center">
								<h2>Admin Detail</h2>
								<hr class="main">
                                                                <p><Strong>Email-</strong>expertmessaging@gmail.com<br><Strong>Contact-</Strong>9123456789</p>
							</div>
						</div>
					</div>
					
					<div class="clearfix"></div>
				</div>
				
			</div>
			
		</section>

	<footer class="footer-area">	
		<div class="footer-copyright">
			<div class="auto-container clearfix">
				<!--Copyright-->
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