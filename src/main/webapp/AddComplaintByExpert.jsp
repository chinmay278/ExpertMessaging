<%@page import="com.dao.ReportedIncidentsByExpertsDAO"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="com.dto.ReportedIncidentsByExperts"%>
<%
 /*
    String expertid = (String) session.getAttribute("expertid");
        
    int questionid = Integer.parseInt(request.getParameter("questionid"));
    
    String incDesc = request.getParameter("incDesc");
    
    ReportedIncidentsByExperts obj = new ReportedIncidentsByExperts();
    obj.setExpertID(expertid);
    obj.setIncDesc(incDesc);
    obj.setQuestionID(questionid);
    obj.setCustomerID(new QuestionDAO().getCustomerByQuestion(questionid));
    
    ReportedIncidentsByExpertsDAO edao = new ReportedIncidentsByExpertsDAO();
    
    boolean b = edao.addIncidentByExperts(obj);
    
    if(b)
    out.print("success");
    else
    out.print("error");
    
    */
    
%>