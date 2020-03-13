package com.proj.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.proj.model.UserModel;

@Service
public class UserService {
	
	@Autowired
	private UserReposittory userrepositoryobj;
	
	// METHOD FOR ADD USER DETAILS TO DATABASE
		public UserModel addUserDetails(UserModel umobj) 
		{
			umobj = userrepositoryobj.save(umobj);
			return umobj;
		}
		
		//METHOD FOR SEARCH EMAIL FOR LOGIN THE USER
		public UserModel searchUserByEmail(String email)
		{
			//System.out.println("INSIDE searchStudentByEmail METHOD in SERVICE CLASS");
			UserModel umobj = userrepositoryobj.findByEmail(email);
			return umobj; 
		}
		
		
	/*	//METHOD FOR DELETE USER
		public void deleteUserRecord(String email) 
		{
			userrepositoryobj.deleteById(email);
		}	*/

}
