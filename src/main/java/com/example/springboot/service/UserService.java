package com.example.springboot.service;

import java.util.List;

import com.example.springboot.model.AddAchievement;
import com.example.springboot.model.Event;
import com.example.springboot.model.RegisterId;
import com.example.springboot.model.User;
import com.example.springboot.model.UserEventRegistration;


public interface UserService {
	
	public String Register(User user);
	
	public List<RegisterId> getAllRegisterId();
	public User checkLogin(String email, String password);
	public String addachievement(AddAchievement addachievement);
	public String updateAchievement(AddAchievement achievement);
	public List<AddAchievement> findbyregisterId(String registerId);
    public AddAchievement findById(long id);
    public List<Event> ViewAllEvents();
    

    
}
