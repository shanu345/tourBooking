package com.proj.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.model.BookingModel;

@Service
public class BookingServise {
	
	@Autowired
	private BookingRepository bookingrepository;
	
	public BookingModel addBooking(BookingModel bookingmodel) 
	{
		bookingmodel = bookingrepository.save(bookingmodel);
		return bookingmodel;
	}
	
	// FETCH BOOKING DATA FROM DB
	public ArrayList<BookingModel> getAllBookingRecordFromDB()
	{
		ArrayList<BookingModel> allbooking = new ArrayList<BookingModel>();
		bookingrepository.findAll().forEach(allbooking::add);
		
		return allbooking;
	}
	
	//METHOD FOR SEARCH BOOKING USING EMAIL
	public ArrayList<BookingModel> getAlldbSearchByEmail(String email)
	{
		ArrayList<BookingModel> bookingsl = (ArrayList<BookingModel>)bookingrepository.findByEmail(email);
		return bookingsl;
	}
	
	//METHOD FOR SEARCH IN BOOKING DB USING THE TOUR ID 
	public ArrayList<BookingModel> getRecordUsingTourId(int id)
	{
		ArrayList<BookingModel> bookingsontourid = (ArrayList<BookingModel>)bookingrepository.findByTourid(id);
		return bookingsontourid;
	}
	
	//METHOD FOR SEARCH IN BOOKING DB USING THE BOOKING DATE
	public ArrayList<BookingModel> getRecordUsingBookingdate(String bookingdate)
	{
		ArrayList<BookingModel> bookingsonbookingdate = (ArrayList<BookingModel>)bookingrepository.findByBookingdate(bookingdate);
		return bookingsonbookingdate;
	}

	//METHOD FOR DELETE BOOKING RECORDS
	public void deleteBookingRecord(int id) 
	{
		bookingrepository.deleteById(id);
	}
}
