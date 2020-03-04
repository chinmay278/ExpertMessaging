<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dto.QuestionCategory"%>
<%@page import="java.util.List" %>
<%@page import="com.dao.QuestionCategoryDAO"%>
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
 
 
  
  <link href="<c:url value="/resources/css/select2.min.css"/>" rel="stylesheet" />
  <link rel="stylesheet" href="<c:url value="/resources/css/jquery.tagsinput.min.css"/>"/>

  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
  <script src="js/modernizr.js"></script>
  
  
  <script type="text/javascript">
            $(document).ready(function(){

// detect change of dropdown
	$("#qcat").change(function(){

// get id of selected team
		var catid=$(this).find(':selected').val();

                // set json url
		var json_url="getsubcategoryjson?catid="+catid;

                $("#subcat").empty();
		
                // get json data
		jQuery.getJSON(json_url, function(data){

			// put new dropdown values to players dropdown
			jQuery.each(data, function(key, val){
				console.log(val[0]);
                                
                                for(var i = 0 ; i < val.length ; i++)
                                {    
                                var obj = val[i];
                                console.log(obj.id);
                                console.log(obj.subCategoryName);
        $("#subcat").append("<option value='" + obj.id + "'>" + obj.subCategoryName + "</option>")
                                }
				});
		});
                
            });        
});
        </script>
        
        
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
							<span style="text-transform: lowercase" class="hidden-xs small-padding">
                                                            <%
                                                                    String name=(String)session.getAttribute("userid");
                                                                    out.print(name);
                                                                    
                                                                    %>
							 <i class="fa fa-caret-down"></i>
                                                        </span>
						</a>
						<ul class="dropdown-menu ">
							
							<li><a href="profile-setting"><i class=" icon-gears"></i> Profile Setting</a></li>
							
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
            <div class="btn-nav"><a href="post-question" class="btn btn-primary btn-small navbar-btn">Post Question</a>
            </div>
          </li>
        </ul>
      </div>
     
    </div>
  </div>
 
  <div class="main-content-area">

   </div>
    <section class="section-padding-80 white" id="post-question">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-8 ">

            <div class="box-panel">

              <h2>Post Your Question</h2>
              <hr>
              <!-- form login -->
              <form class="margin-top-40" action="addquestion">
                <div class="form-group">
                  <label>Question Title</label>
                  <input type="text" placeholder="Question Title" class="form-control" name="questionTitle" required>
                </div>
                <div class="form-group">
                  <label>Question Category</label>
                  <select required="required" id="qcat" class="questions-category form-control" name="categoryID">
                      <option value="0">Select Category</option>
                      <%
ApplicationContext context = 
new ClassPathXmlApplicationContext("spring.xml");
                      
QuestionCategoryDAO qd = (QuestionCategoryDAO)
context.getBean("qcatdao");

List<QuestionCategory> lst = qd.getAllQuestionCategories();
                            
                            if(lst != null)
                            {
                                for(QuestionCategory obj : lst)
                                {
                      %>    
                      <option value="<%=obj.getId()%>"><%=obj.getCategoryName()%></option>
                      <%
                                }
                            }
                      %>    
                  </select>
                </div>
                <div class="form-group">
                  <label>Question Sub Category</label>
                  <select class="questions-category form-control" name="subCategoryID" id="subcat">
                    <option value="0">All Sub Categories</option>
                  </select>
                </div>  
                <div class="form-group">
                  <label>Question Description</label>
                  <textarea cols="12" rows="8" placeholder="Post Your Question Details Here....." id="message" name="questionDesc" class="form-control" required="required"></textarea>
                </div>
                <div class="form-group">
                  <label>PRIVATE</label>
                  <input type="radio" value="private" name="visibility"/>
                  <label>PUBLIC</label>
                  <input type="radio" value="public" name="visibility"/>
                </div>  
                <button class="btn btn-primary pull-right">Publish Your Question</button>

              </form>
            

            </div>
          </div>

          
          <div class="col-sm-12 col-xs-12 col-md-4">

            

          </div>
          
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
 
 
  
  <script src="js/select2.min.js"></script>
  <script type="text/javascript" src="js/jquery.tagsinput.min.js"></script>
  <script type="text/javascript">
    $(".questions-category").select2({
      placeholder: "Select Post Category",
      allowClear: true,
      maximumSelectionLength: 3
    });
    $('#tags').tagsInput({
      width: 'auto'
    });
  </script>
</body>



</html>
