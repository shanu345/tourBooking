package com.proj.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.model.BookingModel;
import com.proj.model.TourModel;
import com.proj.model.UserModel;
import com.proj.service.BookingServise;
import com.proj.service.TourService;
import com.proj.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userserviceobj;
	@Autowired
	private TourService tourservice;
	@Autowired
	private BookingServise bookingservice;
	
	// FOR ADDING USER TO DATABASE
		@RequestMapping(method=RequestMethod.POST,value="/register")
		public ModelAndView addUser(UserModel usermodelobj) 
		{
			//System.out.println("INSIDE OF ADDUSER METHOD OF CONTROLLER CLASS");
			usermodelobj = userserviceobj.addUserDetails(usermodelobj);
			
			ModelAndView mv = new ModelAndView();
			//mv.addObject("regsucessmsg", "THANKS FOR REGISTRATION NOW LOGIN");
			mv.setViewName("userlogin.jsp");
			return mv;
		}
		
		// MATCH EMAIL AND PASSWORD FOR USER LOGIN
		@RequestMapping(method=RequestMethod.POST,value="/searchuserbyemail")
		public ModelAndView getUserByEmail(@RequestParam String email,String password,HttpSession session) 
		{
			//System.out.println("INSIDE getUserByEmail Method IN CONTROLLER CLASS "+email);
			UserModel founduser = userserviceobj.searchUserByEmail(email);
			System.out.println(founduser.getEmail());
			System.out.println(founduser.getPassword());
			ModelAndView mv = new ModelAndView();
			
			if( email.equals(founduser.getEmail()) && password.equals(founduser.getPassword()) )
			{
				session.setAttribute("userid", email);
				session.setAttribute("username", founduser.getName());
				mv.setViewName("userafterlogin.jsp");	
			}
			else
			{
				mv.addObject("msg", "INVALID Email ID OR Password");
				mv.setViewName("userlogin.jsp");
			}
			
			return mv;
		}
		
	/*	//FOR DELETE PARTICULAR USER
		@RequestMapping("/deleteuser")
		public ModelAndView deleteStudent(@RequestParam String email)
		{
			//System.out.println("INSIDE deleteUser Method IN CONTROLLER CLASS");
			
			userserviceobj.deleteUserRecord(email);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("m1", "RECORD DELETED");
			mv.setViewName("adminsearchuser.jsp");
			return mv;
		}
		*/
		
		//FOR GET ALL RECORD FROM TOUR DB
		@RequestMapping("/showalltour")
		public String openAdminViewAlltour(HttpSession session)
		{	
			ArrayList<TourModel> tourlist = tourservice.getAllTourRecordFromDB();
			ArrayList<BookingModel> bookingalist = bookingservice.getAllBookingRecordFromDB();
			session.setAttribute("bmlist", bookingalist);
			session.setAttribute("tlist", tourlist);
			System.out.println(tourlist.size());
			return "usershowalltour.jsp";
		}
		
		//FOR SEARCH TOUR 
		@RequestMapping(method=RequestMethod.POST,value="/searchbytour")
		public String searchTours(@RequestParam String tourname,HttpSession session) 
		{
			ArrayList<TourModel> findtour = tourservice.searchTourBytourname(tourname);
			session.setAttribute("tlist", findtour);
			return "usershowalltour.jsp";
		}
		
		//FOR BOOKING TOUR
		@RequestMapping(value="/tour",method=RequestMethod.POST)
		public String addBookings(BookingModel bookmodel,HttpSession session) 
		{
			TourModel tourm = tourservice.getTourRecordFromDB(bookmodel.getTourid());
			int total = (tourm.getFare())*(bookmodel.getPeoples());
			bookmodel.setTotalfare(total);
			
			bookmodel = bookingservice.addBooking(bookmodel);
			
			String useremail = (String)session.getAttribute("userid");
			ArrayList<BookingModel> booklist = bookingservice.getAlldbSearchByEmail(useremail);
			session.setAttribute("bookinglist", booklist);
			return "usershowbooking.jsp";
		}
		
		
		//FOR GET ALL RECORD FROM BOOKING DB
		@RequestMapping("/usershowallbooking")
		public String userViewAllbooking(HttpSession session)
		{
			String useremail = (String)session.getAttribute("userid");
			ArrayList<BookingModel> booklist = bookingservice.getAlldbSearchByEmail(useremail);
			ArrayList<TourModel> tourmodellist = tourservice.getAllTourRecordFromDB();
			session.setAttribute("tlist", tourmodellist);
			session.setAttribute("bookinglist", booklist);
			System.out.println(booklist.size());
			return "usershowbooking.jsp";
		}
		
		//FOR DELETE BOOKING FROM DB
		@RequestMapping("/deleteid")
		public String userBookingDelete(@RequestParam int id,HttpSession session)
		{
			bookingservice.deleteBookingRecord(id);
			String useremail = (String)session.getAttribute("userid");
			ArrayList<BookingModel> booklist = bookingservice.getAlldbSearchByEmail(useremail);
			session.setAttribute("bookinglist", booklist);
			
			return "usershowbooking.jsp";
		}

		
		//FOR LOGOUT USER
		@RequestMapping("/userlogout")
		public String logout(HttpSession session) 
		{
			session.removeAttribute("username");
			session.removeAttribute("userid");
			session.invalidate();
			
			return "home.jsp";
		}
		
}
