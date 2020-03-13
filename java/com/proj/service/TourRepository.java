package com.proj.service;



import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.proj.model.TourModel;

public interface TourRepository extends CrudRepository<TourModel, Integer>{
List<TourModel> findByTourname(String tourname);
}
