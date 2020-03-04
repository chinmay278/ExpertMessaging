<%@page import="java.sql.Timestamp"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dto.Answer"%>
<%@page import="com.dao.AnswerDAO"%>
<%@page import="com.dto.Question"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.Expert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <h2><b> Answers Posted By You</b></h2>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Question Title</th>
                        <th>Question Description</th>
                        <th>Your Answer</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                	ApplicationContext context = 
                	new ClassPathXmlApplicationContext("spring.xml");
                    
QuestionDAO dao = (QuestionDAO)context.getBean("questdao");

AnswerDAO ado = (AnswerDAO)context.getBean("ansdao");
                            
List<Object[]> anslist = ado.getAllQuestionsAndAnswersByExpert(
                                    (String)session.getAttribute("userid"));

                            if(anslist != null)
                            {
                            for (Object[] arr : anslist) {
                            	Answer ans = (Answer)arr[0];
                            	/*
                            	ans.setId((Integer)arr[0]);
                            	ans.setAnsDesc((String)arr[1]);
                            	ans.setPostedDate((Timestamp)arr[2]);
                            	ans.setQuest((Question)arr[3]);
                            	ans.setExp((Expert)arr[4]);
                            	*/
                           // Question qs = ans.getQuest();
                            	Question qs = (Question) arr[1];
                    %>
                    <tr>

                        <td><%=qs.getQuestionTitle()%></td>

                        <td><%=qs.getQuestionDesc()%></td>
                        <% if(ans != null) { %>
                        <td><%=ans.getAnsDesc()%> <br> <%=ans.getPostedDate()%> </td>
                        <%} %>
                    </tr>
                <%}}%>

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
