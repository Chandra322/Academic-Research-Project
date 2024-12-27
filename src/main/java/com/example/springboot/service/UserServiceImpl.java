package com.example.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.springboot.model.AddAchievement;
import com.example.springboot.model.Event;
import com.example.springboot.model.RegisterId;
import com.example.springboot.model.User;
import com.example.springboot.model.UserEventRegistration;
import com.example.springboot.repository.AddAchievementRepository;
import com.example.springboot.repository.EventRepository;
import com.example.springboot.repository.RegisterIdRepository;
import com.example.springboot.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
public class UserServiceImpl implements UserService 
{	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RegisterIdRepository registerIdRepository;
	
	@Autowired
	private AddAchievementRepository addAchievementRepository;
	
	@Autowired
	private EventRepository eventRepository;
	

	@Override
	public String Register(User user) {
		userRepository.save(user);
		return "User Register Successfully";
	}

	

	@Override
	public List<RegisterId> getAllRegisterId() {
		return registerIdRepository.findAll();
	}
	@Override
	public User checkLogin(String email, String password) {
			User user= userRepository.checkUserLogin(email, password);
			if(user==null)
				System.out.println("user not found");
			return user;
	}



	@Override
	public String addachievement(AddAchievement addachievement) {
		addAchievementRepository.save(addachievement);
		return "Achievements are added successfully";
	}



	@Override
	public List<AddAchievement> findbyregisterId(String registerId) {
		 return addAchievementRepository.findByRegisterId(registerId);
	}


	
	@Override
	public String updateAchievement(AddAchievement achievement) {
		addAchievementRepository.save(achievement);
		return "Achievemnt updated successfully";
	}




	@Override
	public AddAchievement findById(long id) {
	    return addAchievementRepository.findById(id);
	}



	@Override
	public List<Event> ViewAllEvents() {
	  
		return eventRepository.findAll();
	}
}



	

	


