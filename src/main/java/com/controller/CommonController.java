package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommonController {

	@RequestMapping(value = "/login_form")
	public String loginForm()
	{
		return "login_form";
	}
	
	@RequestMapping(value = "/register")
	public String register()
	{
		return "register";
	}
	
	
	@RequestMapping(value = "/contact")
	public String contact()
	{
		return "contact";
	}

	

	@RequestMapping(value="/profile_setting")
	public String profileSetting()
	{
		return "profile_setting";
	}
	
	
	@RequestMapping(value = "/logoutcust")
	public String logoutCust()
	{
		return "logout"; 
	}
	
	
	@RequestMapping(value="/expert-profile-setting")
	public String expertProfileSetting()
	{
		return "profile_setting_expert";
	}
	
	
	@RequestMapping(value = "/showsearchresult")
	public String search(@RequestParam("search") String searchTerm,
			Model m)
	{
		m.addAttribute("searchterm", searchTerm);
		return "ShowSearchResult";
	}
	
	@RequestMapping(value = "/custhome")
	public String custHome()
	{
		return "index_customer";
	}
	
	@RequestMapping(value="/adhome")
	public String adHome()
	{
		return "index_admin";
	}
	
}





