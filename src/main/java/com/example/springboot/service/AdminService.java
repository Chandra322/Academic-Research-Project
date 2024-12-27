package com.example.springboot.service;

import java.util.List;

import com.example.springboot.model.AddAchievement;
import com.example.springboot.model.Admin;
import com.example.springboot.model.ClubHead;
import com.example.springboot.model.User;
import com.example.springboot.model.RegisterId;


public interface AdminService {
	
	public Admin checkadminlogin(String uname, String pwd);
	public List<User> ViewAllUsers();
	public String  deleteUserByregisterId(String registerId);
  	public String RegisterId(RegisterId registerId);
	 public String verifyUser(long id);
	 public List<AddAchievement> ViewAllAchievements();
	 public AddAchievement ViewAchievementById(long id);
	 public String verifyAchievement(long id);
	 public String deleteAchievementById(Long id);
	
	 public List<RegisterId> ViewAllRegisterId();
	 public long achievementcount();
	 public long Userscount();
	 public long getVerifiedStudentCount();
	 public long getNonVerifiedStudentCount();
	 
	 //CLub and Events
	 public String AddClubData(ClubHead club);
	 public List<ClubHead> ViewAddedClubData();
	 public String deleteclubtById(Long id);
}
