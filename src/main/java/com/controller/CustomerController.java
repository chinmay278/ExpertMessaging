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
import com.dao.MailDAO;
import com.dto.Admin;
import com.dto.Customer;
import com.servercon.WebServer;

@Controller
public class CustomerController {

	private ApplicationContext context = 
			new ClassPathXmlApplicationContext("spring.xml");
	private CustomerDAO cd = 
			 (CustomerDAO) context.getBean("custdao");
	
	@RequestMapping(value = "/loginCustomer",
			method = RequestMethod.GET)
	public String loginCustomer(Customer ref, 
			HttpServletRequest request)
	{
		HttpSession hs = null;
		
		if(cd.validateCustomer(ref))
		{
			hs = request.getSession(true);
			hs.setAttribute("userid", ref.getId());
			return "index_customer";
		}
		else
			return "Login_Failure";
	}
	
	@RequestMapping(value = "/forgotcustomer")
	public String forgotCustomer(@RequestParam(name = "custid")
	String custid)
	{
		String genpass = cd.forgotPassword(custid);
		
		if(genpass == null)
			return "Forgot_Failure";
		else
		{
			MailDAO md = (MailDAO)context.getBean("mdao");
			
			String to = custid;
			
			String subject = "Email From ExpertMessaging";
			
			String content = "Your new password is "+genpass;
			
			if(md.sendMail(to, subject, content))
				return "Forgot_Success";
			else
				return "Forgot_Failure";
		}
	}
	
	
	@RequestMapping(value = "/registerCustomer",
			method = RequestMethod.POST)
	public String registerCustomer(Customer cust)
	{
		if(cd.saveCustomer(cust))
		{
			MailDAO md = (MailDAO)context.getBean("mdao");
			
			String to = cust.getId();
			
			String subject = "Verification Email From ExpertMessaging";
			
			String content = "Click on following link to verify yourself with"
					+ " ExpertMessaging.\n"
+ "<a href="+WebServer.MYSERVER
+ "verifycustomer?custid="+cust.getId()+">VERIFY</a>";
			
			if(md.sendMail(to, subject, content))
				return "Register_Success";
			else
				return "Register_Failure";
		}
		else
			return "Register_Failure";
	}
	
	
	@RequestMapping(value = "/verifycustomer")
	public String verifyCustomer(@RequestParam("custid") String 
			custid)
	{
		if(cd.verifyCustomer(custid))
			return "Verify_Success";
		else
			return "Verify_Failure";
	}
	
	
	@RequestMapping(value = "/blockcustomer")
	public String blockCustomer(@RequestParam("custid") 
	String custid)
	{
		if(cd.blockCustomer(custid))
			return "Block_Success";
		else
			return "Block_Failure";
	}
	
	
	@RequestMapping(value = "/removecustomer")
	public String removeCustomer(@RequestParam("custid") 
	String custid)
	{
		if(cd.removeCustomer(custid))
			return "removecustomer_success";
		else
			return "removecustomer_error";
	}
	
	
	@RequestMapping(value = "/getallcustomers")
	public String getAllCustomers(Model m)
	{
		List<Customer> clist = cd.getAllCustomers();
		
		if(clist != null)
		{
			m.addAttribute("allcustomers", clist);
			return "ShowAllCustomers";
		}
		else
			return null;
	}
	
	
	@RequestMapping(value = "/updatecustomer",
			method = RequestMethod.POST)
	public String updateCustomer(Customer ref)
	{
		if(cd.updateCustomer(ref))
			return "UpdateCust_Success";
		else
			return "UpdateCust_Failure";
	}
	
	
}








