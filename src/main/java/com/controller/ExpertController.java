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

import com.dao.AdminDAO;
import com.dao.CustomerDAO;
import com.dao.ExpertDAO;
import com.dao.MailDAO;
import com.dto.Admin;
import com.dto.Customer;
import com.dto.Expert;
import com.dto.QuestionCategory;
import com.dto.QuestionSubCategory;
import com.servercon.WebServer;

@Controller
public class ExpertController {

	private ApplicationContext context = 
			new ClassPathXmlApplicationContext("spring.xml");
	private ExpertDAO ed = 
			 (ExpertDAO) context.getBean("expdao");
	
	@RequestMapping(value = "/loginExpert",
			method = RequestMethod.POST)
	public String loginExpert(Expert ref, 
			HttpServletRequest request)
	{
		HttpSession hs = null;
		
		if(ed.validateExpert(ref))
		{
			hs = request.getSession(true);
			hs.setAttribute("userid", ref.getId());
			return "index_expert";
		}
		else
			return "Login_Failure";
	}
	
	@RequestMapping(value = "/forgotexpert")
	public String forgotExpert(@RequestParam(name = "expertid")
	String expertid)
	{
		String genpass = ed.forgotPassword(expertid);
		
		if(genpass == null)
			return "Forgot_Failure";
		else
		{
			MailDAO md = (MailDAO)context.getBean("mdao");
			
			String to = expertid;
			
			String subject = "Email From ExpertMessaging";
			
			String content = "Your new password is "+genpass;
			
			if(md.sendMail(to, subject, content))
				return "Forgot_Success";
			else
				return "Forgot_Failure";
		}
	}
	
	
	@RequestMapping(value = "/regExp")
	public String regExp()
	{
		return "registerexpert";
	}
	
	
	@RequestMapping(value = "/registerExpert")
	public String registerExpert(@RequestParam("id") 
	String id, @RequestParam("categoryID") String catid,
	@RequestParam("subCategoryID") String subcatid)
	{
		
		QuestionCategory qcat = new QuestionCategory();
		qcat.setId(Integer.parseInt(catid));
		
		QuestionSubCategory qsubcat = new QuestionSubCategory();
		qsubcat.setId(Integer.parseInt(subcatid));
		
		Expert exp = new Expert();
		exp.setId(id);
		exp.setBlocked(false);
		exp.setCatid(qcat);
		exp.setSubcatid(qsubcat);
		
		String pass = ed.saveExpert(exp);
		
		if(!pass.equals(""))
		{
			MailDAO md = (MailDAO)context.getBean("mdao");
			
			String to = exp.getId();
			
			String subject = "Registration Email From ExpertMessaging";
			
			String content = "You have been registered with "
					+ " ExpertMessaging.\n"
+ "<b>Your Login_ID is :  "+exp.getId()+"</b><br>"
		+ "<b>Your Password is : "+pass+"</b>";
			
			if(md.sendMail(to, subject, content))
				return "regexpert_success";
			else
				return "regexpert_error";
		}
		else
			return "regexpert_error";
	}
	
	
	@RequestMapping(value = "/blockexpert")
	public String blockExpert(@RequestParam("expertid") 
	String expertid)
	{
		if(ed.blockExpert(expertid))
			return "Block_Success";
		else
			return "Block_Error";
	}
	
	
	@RequestMapping(value = "/removeexpert")
	public String removeExpert(@RequestParam("expertid") 
	String expertid)
	{
		if(ed.removeExpert(expertid))
			return "removeexpert_success";
		else
			return "removeexpert_error";
	}
	
	
	@RequestMapping(value = "/getallexperts")
	public String getAllExperts(Model m)
	{
		List<Expert> elist = ed.getAllExperts();
		
		if(elist != null)
		{
			m.addAttribute("allexperts", elist);
			return "ShowAllExperts";
		}
		else
			return null;
	}
	
	
	@RequestMapping(value = "/changeexpertpassword",
			method = RequestMethod.POST)
	public String changePassword(@RequestParam("expertid")
	String expid , 
	@RequestParam("newpass") String newpass,
	@RequestParam("oldpass") String oldpass)
	{
		
		if(ed.changePassword(expid, oldpass, newpass))
			return "UpdateExp_Success";
		else
			return "UpdateExp_Failure";
	}
}








