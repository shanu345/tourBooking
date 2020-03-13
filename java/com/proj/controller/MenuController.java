package com.proj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {
	
	@RequestMapping("/")
	public String openHomePage() {
		return "home.jsp";
	}
	
	@RequestMapping("/aboutus")
	public String openAboutUsPage() {
		return "aboutus.jsp";
	}
	
	@RequestMapping("/contactus")
	public String openContactUsPage() {
		return "contactus.jsp";
	}
	
	@RequestMapping("/userreg")
	public String openRegPage() {
		return "userregistration.jsp";
	}
	
	@RequestMapping("/userlogin")
	public String openUserLoginPage() {
		return "userlogin.jsp";
	}
	
	@RequestMapping("/adminlogin")
	public String openAdminLoginPage() {
		return "adminlogin.jsp";
	}
	
	@RequestMapping("/adminhome")
	public String openAdminAfterLoginPage() {
		return "adminafterlogin.jsp";
	}
	
	@RequestMapping("/userhome")
	public String openUserAfterLoginPage()
	{
		return "userafterlogin.jsp";
	}	
	
	@RequestMapping("/addtour")
	public String openAddTourPage() 
	{
		return "addtour.jsp";
	} 

}
