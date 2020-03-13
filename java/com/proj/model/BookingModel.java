package com.proj.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BookingModel implements Serializable{
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int bookingid;
	private String payoption;
	private int tourid;
	private String email;
	private String name;
	private int peoples;
	private int totalfare;
	private String tourname;
	private String bookingdate;
	
	public BookingModel() {}

	public int getBookingid() {
		return bookingid;
	}

	public void setBookingid(int bookingid) {
		this.bookingid = bookingid;
	}

	public int getTourid() {
		return tourid;
	}

	public void setTourid(int tourid) {
		this.tourid = tourid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPeoples() {
		return peoples;
	}

	public void setPeoples(int peoples) {
		this.peoples = peoples;
	}

	public int getTotalfare() {
		return totalfare;
	}

	public void setTotalfare(int totalfare) {
		this.totalfare = totalfare;
	}

	public String getTourname() {
		return tourname;
	}

	public void setTourname(String tourname) {
		this.tourname = tourname;
	}

	public String getBookingdate() {
		return bookingdate;
	}

	public void setBookingdate(String bookingdate) {
		this.bookingdate = bookingdate;
	}

	public String getPayoption() {
		return payoption;
	}

	public void setPayoption(String payoption) {
		this.payoption = payoption;
	}
	
	

}
