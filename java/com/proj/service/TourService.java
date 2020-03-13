package com.proj.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.model.TourModel;


@Service
public class TourService {

	@Autowired
	private TourRepository tourrepoobj;
	
	//ADD TOUR DATA IN DB
	public TourModel addTourDetails(TourModel tourmodel) 
	{
		tourmodel = tourrepoobj.save(tourmodel);
		return tourmodel;
	}
	
	// FETCH TOUR DATA FROM DB
	public ArrayList<TourModel> getAllTourRecordFromDB()
	{
		ArrayList<TourModel> alltourdetails = new ArrayList<TourModel>();
		tourrepoobj.findAll().forEach(alltourdetails::add);
		return alltourdetails;
	}
	
	// DELETE TOUR DATA FROM DB
	public void deleteTourRecord(int id) 
	{
		//System.out.println("INSIDE deleteStudentRecord METHOD in SERVICE CLASS");
		tourrepoobj.deleteById(id);
	}
	
	//METHOD FOR SEARCH TOUR USING TOUR NAME
	public ArrayList<TourModel> searchTourBytourname(String tourname)
	{
		ArrayList<TourModel> atourlist = (ArrayList<TourModel>) tourrepoobj.findByTourname(tourname.toLowerCase());
		return atourlist;
	}
	
	//METHOD FOR SEARCH TOUR USING TOUR ID
	public TourModel getTourRecordFromDB(int id) 
	{
		TourModel tm_model = tourrepoobj.findById(id).orElse(new TourModel());
		return tm_model;
	}
}
