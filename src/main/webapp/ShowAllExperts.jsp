<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dao.QuestionSubCategoryDAO"%>
<%@page import="com.dao.QuestionCategoryDAO"%>
<%@page import="com.dao.ExpertDAO"%>
<%@page import="com.dto.Expert"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2> Registered <b>Experts List</b></h2>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Category</th>
                        <th>Sub-Category</th>
                       <th>Blocked </th>
                        <th>Change</th>
                    </tr>
                </thead>
                <tbody>
                    <% try {
                    	
                    	 ApplicationContext context = 
new ClassPathXmlApplicationContext("spring.xml");
                                 
                    	 ExpertDAO dao = (ExpertDAO)
												context.getBean("expdao");
                            
QuestionCategoryDAO qcdo = (QuestionCategoryDAO)
context.getBean("qcatdao");

QuestionSubCategoryDAO qscdo = (QuestionSubCategoryDAO)
context.getBean("qsubcatdao");
                            
                            List<Expert> lst = dao.getAllExperts();

                            for (Expert s : lst) {

                    %>

                    <tr>

                        <td><%=s.getId()%></td>

                        <td><%=qcdo.getQuestionCategoryNameByID(s.getCatid().getId())%></td>
                        <td><%=qscdo.getQuestionSubCategoryName(s.getSubcatid().getId())%></td>
                        <td><%=s.isBlocked()%></td>
                        <td><%  if (!s.isBlocked()){%>
                            <a href="blockexpert?expertid=<%=s.getId()%>" class="delete"  data-toggle="modal" onsubmit="myclick()"><img title="BLOCK" style="height: 30px; width: 30px;"  src="<c:url value="/resources/images/33.png"/>"></a>
                        </td>
                        <%}%>
                    </tr>
<!--                <script>
                    function myclick()
                    {
                        swal({
                            title: "Are you sure?",
                            text: "Your will not be able to recover this imaginary file!",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonClass: "btn-danger",
                            confirmButtonText: "Yes, delete it!",
                            closeOnConfirm: false
                        },
                                function () {
                                    swal("Deleted!", "Your imaginary file has been deleted.", "success");
                                });

                    }
                </script>-->
                <%
                        }
                    } catch (Exception e) {

                    }
                %>




                </tbody>
            </table>
            <div class="clearfix">
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item active"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item "><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    </body>
</html>
