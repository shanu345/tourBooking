package com.proj.service;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.proj.model.BookingModel;

public interface BookingRepository extends CrudRepository<BookingModel, Integer> {
List<BookingModel> findByEmail(String email);
List<BookingModel> findByTourid(int tourid);
List<BookingModel> findByBookingdate(String bookingdate);
}
