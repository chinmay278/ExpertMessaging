package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.AnswerDAO;
import com.dao.QuestionDAO;
import com.dto.Answer;
import com.dto.Expert;
import com.dto.Question;

@Controller
public class AnswerController {

	private ApplicationContext context = 
			new ClassPathXmlApplicationContext("spring.xml");
	private AnswerDAO ad = 
			 (AnswerDAO) context.getBean("ansdao");
	private QuestionDAO questd = 
			(QuestionDAO) context.getBean("questdao");
	
	@RequestMapping(value = "/addanswer",
			method = RequestMethod.POST)
	public String addAnswer(@RequestParam("ans") String ans, 
			@RequestParam("questionId") String questionId,
			@RequestParam("expertId") String expertId)
	{
		Question quest = new Question();
		quest.setId(Integer.parseInt(questionId));
		
		Expert exp = new Expert();
		exp.setId(expertId);
		
		Answer obj = new Answer();
		obj.setAnsDesc(ans);
		obj.setExp(exp);
		obj.setQuest(quest);
		
		if(ad.addAnswer(obj))
		{
			if(questd.changeQuestionStatus(Integer.parseInt(questionId)))
			return "Answer_Success";
			else
				return "Answer_Failure";	
		}
		else
			return "Answer_Failure";
	}
	
	
	@RequestMapping(value = "/getallanswersforcustomer")
	public String getAllAnswersForCustomer(HttpServletRequest 
			request, Model m)
	{
		HttpSession hs = request.getSession();
		
		String custid = (String) hs.getAttribute("userid");
		
		List<Object[]> lst = ad.getAllAnswersForCustomer(custid);
		
		if(lst != null)
		{
			m.addAttribute("ListOfAnswers", lst);
			return "";
		}
		else
			return "";
	}
	
	
	@RequestMapping(value = "/getallanswersforexpert")
	public String getAllAnswersForExpert(HttpServletRequest 
			request, Model m)
	{
		HttpSession hs = request.getSession();
		
		String expid = (String) hs.getAttribute("userid");
		
		List<Answer> lst = ad.getAllAnswersForExpert(expid);
		
		if(lst != null)
		{
			m.addAttribute("ListOfAnswers", lst);
			return "";
		}
		else
			return "";
	}
}












