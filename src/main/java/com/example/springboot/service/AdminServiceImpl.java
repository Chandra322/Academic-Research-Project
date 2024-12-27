package com.example.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.springboot.model.AddAchievement;
import com.example.springboot.model.Admin;
import com.example.springboot.model.ClubHead;
import com.example.springboot.model.User;
import com.example.springboot.repository.AddAchievementRepository;
import com.example.springboot.repository.AdminRepository;
import com.example.springboot.repository.ClubHeadRepository;
import com.example.springboot.repository.RegisterIdRepository;
import com.example.springboot.repository.UserRepository;
import com.example.springboot.model.RegisterId;

@Service
public  class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RegisterIdRepository registeridrepository;
	
	@Autowired
	private AddAchievementRepository addAchievementRepository;
	
	@Autowired
	private ClubHeadRepository clubheadRepository;

	@Override
	public Admin checkadminlogin(String uname, String pwd) {
		return adminRepository.checkadminlogin(uname, pwd);
	
	}
	@Override
	public List<User> ViewAllUsers() {
		
		return userRepository.findAll();
	}
	@Override
	public String RegisterId(RegisterId registerId) {
		registeridrepository.save(registerId);
		return "Register Id succesffuly";
	}
	@Override
	public List<AddAchievement> ViewAllAchievements() {
		 return  addAchievementRepository.findAll();

	}
	
	@Override
	 public String verifyAchievement(long id) {
	    Optional<AddAchievement> achievementOpt = Optional.of(addAchievementRepository.findById(id));
	    
	    if (achievementOpt.isPresent()) {
	        AddAchievement achievement = achievementOpt.get();
	        
	        achievement.setStatus(true); // or appropriate status change
	       addAchievementRepository.save(achievement);
	    } else {
	            System.out.println("ACHIVEMENT NOT FOUND");
	    }
		return null;
	}
	@Override
	public AddAchievement ViewAchievementById(long id) {
		  return addAchievementRepository.findById(id);  
	
	}
	@Override
	public String verifyUser(long id) {
		Optional<User> optionalUser = userRepository.findById(id);

	    if (optionalUser.isPresent()) {
	        User user = optionalUser.get();
	        user.setVerified(true);
	        userRepository.save(user);
	        
	        return "User verified successfully";
	    } else {
	        return "User not found. Please try again.";
	    }
	}
	  @Override
	     public String deleteAchievementById(Long id) 
	     {
	    	    Optional<AddAchievement> achievementOpt = addAchievementRepository.findById(id);

	            // If the achievement is found, delete it
	            if (achievementOpt.isPresent()) {
	            	addAchievementRepository.deleteById(id);  // Delete the achievement from the database
	                return "Achievement Deleted Successfully";
	            } else {
	                return "Achievement Not Found";
	            }
	     }
	  @Override
		public String  deleteUserByregisterId(String registerId) {
				
				userRepository.deleteUserByregisterId(registerId);
				return "User Deleted Successfully";
			}
	@Override
	public List<RegisterId> ViewAllRegisterId() {
		return registeridrepository.findAll();
	}
	@Override
	public long achievementcount() {
	    long count = addAchievementRepository.count();
	    System.out.println("Achievement Count: " + count); // Debug log
	    return count;
	}
	@Override
	public long Userscount() {
		
		 long count = userRepository.count();
		    System.out.println("User Count: " + count); // Debug log
		    return count;
		}
	
	
	public long getVerifiedStudentCount() {
	    return userRepository.countByVerified(true); 
	}

	public long getNonVerifiedStudentCount() {
	    return userRepository.countByVerified(false); 
	}
	@Override
	public String AddClubData(ClubHead club) {
		clubheadRepository.save(club);
		return "club data Added Successfully";
		
	}
	@Override
	public List<ClubHead> ViewAddedClubData() {
		return clubheadRepository.findAll();
	}
	@Override
	public String deleteclubtById(Long id) {
		
		 {
	    	    Optional<ClubHead> club = clubheadRepository.findById(id);

	          
	            if (club.isPresent()) {
	            	clubheadRepository.deleteById(id);  // Delete the achievement from the database
	                return "Club Data Deleted Successfully";
	            } else {
	                return "club  Not Found";
	            }
	     }
	}
}