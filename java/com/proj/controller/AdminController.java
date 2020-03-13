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
import com.proj.service.BookingServise;
import com.proj.service.TourService;


@Controller
public class AdminController {
	
	@Autowired
	private TourService tourserviceobj;
	@Autowired
	private BookingServise bookingservice;
	
	
	//FOR ADMIN LOGIN
	@RequestMapping(value="/adminlogincheck", method=RequestMethod.POST)
	public ModelAndView AdminLoginCheck(@RequestParam String admin_id,String password,HttpSession session) 
	{
		ModelAndView mv = new ModelAndView();
		if(admin_id.equals("admin") && password.equals("admin")) 
		{
			session.setAttribute("adminusername", "ADMIN");
			mv.addObject("errormsg", "VALID ADMIN");
			mv.setViewName("adminafterlogin.jsp");
		}
		else
		{
			mv.addObject("errormsg", "INVALID UID OR PASSWORD");
			mv.setViewName("adminlogin.jsp");
		}
		
		return mv;
	}

		//FOR ADD TOUR
	@RequestMapping(method=RequestMethod.POST,value="/adminaddtour")
	public String AddTour(TourModel tourmobj, HttpSession session)
	{
		tourmobj = tourserviceobj.addTourDetails(tourmobj);	//ADDING TOUR BY PASSING OBJECT
		ArrayList<TourModel> tourlist = tourserviceobj.getAllTourRecordFromDB();//AFTER ADDING FETCHING ALL DETAILS FROM DB
		ArrayList<BookingModel> bookinglist = bookingservice.getAllBookingRecordFromDB();
		session.setAttribute("allbookinglist", bookinglist);
		session.setAttribute("alltourlist", tourlist);//SET VALUES FOR JSP PAGE

		return "showalltour.jsp";
	}
	
	//FOR GET ALL RECORD FROM TOUR DB
	@RequestMapping("/viewalltour")
	public String openAdminViewAllUser(HttpSession session)
	{
		ArrayList<TourModel> tourlist = tourserviceobj.getAllTourRecordFromDB();
		ArrayList<BookingModel> bookinglist = bookingservice.getAllBookingRecordFromDB();
		session.setAttribute("allbookinglist", bookinglist);
		session.setAttribute("alltourlist", tourlist);
		System.out.println(tourlist.size());
		return "showalltour.jsp";
	}
	
	//FOR DELETE ANY TOUR FROM DB
	@RequestMapping("/deletetour")
	public ModelAndView deletetour(@RequestParam int id,HttpSession session)
	{
		//System.out.println("INSIDE deletetour Method IN CONTROLLER CLASS");
		
		tourserviceobj.deleteTourRecord(id);
		ArrayList<TourModel> tourlist = tourserviceobj.getAllTourRecordFromDB();
		session.setAttribute("alltourlist", tourlist);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "RECORD DELETED");
		mv.setViewName("showalltour.jsp");
		return mv;
	}

	//FOR GET ALL RECORD FROM BOOKING DB
	@RequestMapping("/adminshowallbooking")
	public String openAdminViewAllbooking(HttpSession session)
	{
		ArrayList<BookingModel> booklist = bookingservice.getAllBookingRecordFromDB();
		session.setAttribute("bookinglist", booklist);
		System.out.println(booklist.size());
		return "adminshowbooking.jsp";
	}
	
	//METHOD FOR SEARCH RECORD FROM BOOKING DB USING TOUR ID
	@RequestMapping(value="/searchbytourid",method=RequestMethod.POST)
	public String searchAllUsingTourid(@RequestParam int tourid,HttpSession session) 
	{
		ArrayList<BookingModel> bookinglist = bookingservice.getRecordUsingTourId(tourid);
		session.setAttribute("bookinglist", bookinglist);
		return "adminshowbooking.jsp";
	}
	
	//METHOD FOR SEARCH RECORD FROM BOOKING DB
	@RequestMapping(value="/searchbybookingdate",method=RequestMethod.POST)
	public String searchAllUsingBookingDate(@RequestParam String date,HttpSession session) 
	{
		ArrayList<BookingModel> bmlist = bookingservice.getRecordUsingBookingdate(date);
		session.setAttribute("bookinglist", bmlist);
		return "adminshowbooking.jsp";
	}
	
	// FOR ADMIN LOGOUT
	@RequestMapping("/adminlogout")
	public  String Logout(HttpSession session) 
	{
		session.removeAttribute("adminusername");
		session.invalidate();
		
		return "home.jsp";
	}
}
