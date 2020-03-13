package com.proj.service;

import org.springframework.data.repository.CrudRepository;

import com.proj.model.UserModel;

public interface UserReposittory extends CrudRepository<UserModel, String> {
	
	UserModel findByEmail(String email);

}
