package com.example.springboot.controller;


import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.springboot.service.AdminService;
import com.example.springboot.model.AddAchievement;
import com.example.springboot.model.Admin;
import com.example.springboot.model.ClubHead;
import com.example.springboot.model.RegisterId;
import com.example.springboot.model.User;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	@GetMapping("/home")
	public   ModelAndView home() 
	{
			 ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			 return mv;
	}
	
	 @GetMapping("adminLogin")
	public  ModelAndView adminlogin() 
	{
			 ModelAndView mv = new ModelAndView();
			  mv.setViewName("adminLogin");
			 return mv;
	}
	 
	 @GetMapping("adminlogout")
		public ModelAndView adminlogout()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/adminLogin");
			return mv;
		}
	 
	 
	 @PostMapping("checkadminlogin")
	//@ResponseBody
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
			ModelAndView mv = new ModelAndView();
			
			String auname = request.getParameter("auname");
			String apwd = request.getParameter("apwd");
			
			Admin admin = adminService.checkadminlogin(auname, apwd);
			if(admin!=null)
			{
				//return "Admin Login Success";
				mv.setViewName("redirect:/adminDashboard");
			}		
			else
			{
				//return admin login fail
				mv.setViewName("adminlogin");
				mv.addObject("message","Login Failed");
			}
			  return mv;
	}
	 @GetMapping("adminDashboard")
	 public ModelAndView adminDashboard() {
		 ModelAndView mv = new ModelAndView("adminDashboard");
		 long achievementCount = adminService.achievementcount();
		    long userCount = adminService.Userscount();
		    long verifiedStudentCount = adminService.getVerifiedStudentCount();
		    long nonVerifiedStudentCount = adminService.getNonVerifiedStudentCount();

		    // Add counts to the model
		    mv.addObject("achievementcount", achievementCount);
		    mv.addObject("Userscount", userCount);
		    mv.addObject("verifiedStudentCount", verifiedStudentCount);
		    mv.addObject("nonVerifiedStudentCount", nonVerifiedStudentCount);
	     return mv;
	 }

	 @GetMapping("viewallusers")
		public ModelAndView viewallusers() {
			ModelAndView mv = new ModelAndView("viewallusers");
			List<User> userList = adminService.ViewAllUsers();
	        mv.addObject("userlist", userList);
	        long usercount = adminService.Userscount();
		     mv.addObject("Userscount", usercount);
			
			return mv;
			
		}
	 @GetMapping("verifyuser")
		public ModelAndView verifyUser(@RequestParam("id")  long id) {
			ModelAndView mv=new ModelAndView();
		    String msg=adminService.verifyUser(id);
		    
		    mv.addObject("msg",msg);
		    mv.setViewName("redirect:/viewallusers");
		    
		    
		    return mv;
		}
	 @GetMapping("delete")
		public String deleteoperation(@RequestParam("registerId") String registerId)
		{
			adminService.deleteUserByregisterId(registerId);
			
			
			return "redirect:/viewallusers";
		}
	 
	 @PostMapping("/insertregisterid")
	 public ModelAndView insertFarmer(HttpServletRequest request) {
	     // Corrected RegisterId retrieval with proper string literal
	     String registerId = (request.getParameter("RegisterId")); 
	     
	     RegisterId register = new RegisterId();
	     register.setRegisterId(registerId); 
	     
	     adminService.RegisterId(register); 
	     
	     // Creating and returning the ModelAndView object
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("insertregisterid"); // Ensure the JSP file matches this name
	     mv.addObject("message", "Register ID registered successfully!");
	     
	     return mv;
	 }
	 
	 @GetMapping("insertregisterid")
		public  ModelAndView insertregisterid() 
		{
				 ModelAndView mv = new ModelAndView();
				  mv.setViewName("insertregisterid");
				
				  return mv;
		}
	 
	 @GetMapping("viewAllAchievements")
	 public ModelAndView viewAllAchievements() {
	     // Get the list of all achievements
	     List<AddAchievement> achievements = adminService.ViewAllAchievements();
	     
	     // Create a ModelAndView object and add the achievements list as an attribute
	     ModelAndView mv = new ModelAndView("viewAllAchievements");
	     mv.addObject("achievements", achievements); 
	     long count = adminService.achievementcount();
			mv.addObject("achievementcount",count);

	     return mv;
	 }
	 @GetMapping("displayachievementimage")
	 public ResponseEntity<byte[]> displayAchievementImage(@RequestParam long id) throws Exception {
	    
	     AddAchievement achievement = adminService.ViewAchievementById(id);

	   
	     if (achievement != null && achievement.getCertificateImage() != null) {
	        
	         Blob certificateImage = achievement.getCertificateImage();
	         
	        
	         byte[] imageBytes = certificateImage.getBytes(1, (int) certificateImage.length());

	        
	         return ResponseEntity.ok()
	                              .contentType(MediaType.IMAGE_JPEG)
	                              .body(imageBytes);
	     } else {
	        
	         return ResponseEntity.notFound().build();
	     }
	 }
	 @GetMapping("/verifyAchievement")
	 public ModelAndView verifyAchievement(@RequestParam("id") long id) {
	     ModelAndView mv = new ModelAndView();
	     String msg = adminService.verifyAchievement(id);
	     
	     mv.addObject("msg", msg);
	     mv.setViewName("redirect:/viewAllAchievements");  // Redirect to the achievements list page
	     
	     return mv;
	 }
	 @GetMapping("/deleteAchievement")
	   public ModelAndView deleteAchievement(@RequestParam("id") Long id) 
	  {
	       ModelAndView mv = new ModelAndView();

	       // Call the service method to delete the achievement
	       String result = adminService.deleteAchievementById(id);

	       // Add the result message to the model
	       mv.addObject("message", result);
	       mv.setViewName("redirect:/viewAllAchievements");  // Redirect to the achievements page after deletion
	       return mv;
	   }
	 @GetMapping("viewregisterids")
		public ModelAndView viewregisterids() {
			ModelAndView mv = new ModelAndView("viewregisterids");
			List<RegisterId> userList = adminService.ViewAllRegisterId();
	        mv.addObject("userlist", userList);
			
			return mv;
			
	}
	 @GetMapping("AddClubdata")
		public ModelAndView AddClubdata()
{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("AddClubdata");
			return mv;
}
	 @PostMapping("/insertclubdata")
	 public ModelAndView insertclubdata(HttpServletRequest request) throws Exception {
	    
	     String clubName = request.getParameter("clubName");
	     String clubCategory = request.getParameter("clubCategory");
	     String clubEmail = request.getParameter("clubEmail");
	     String branch = request.getParameter("branch");
	     String password = request.getParameter("password");

	    
	     ClubHead data = new ClubHead();
	     data.setClubName(clubName);
	     data.setClubCategory(clubCategory);
	     data.setClubEmail(clubEmail);
	     data.setBranch(branch);
	     data.setPassword(password);

	     
	     String msg = adminService.AddClubData(data);

	    
	     sendRegistrationEmail(clubEmail, clubName, clubCategory, branch, password);

	     
	     ModelAndView mv = new ModelAndView("AddClubdata");
	     	
	     return mv;
	 }

	 private void sendRegistrationEmail(String clubEmail, String clubName, String clubCategory, String branch, String password) throws Exception {
		    // Create a MimeMessage for the email
		    MimeMessage mimeMessage = mailSender.createMimeMessage();
		    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

		    // Set email subject and content
		    String subject = "Your Active Hub Club Account Details";
		    String htmlContent =
		        "<h3>Welcome to Active Hub!</h3>" +
		        "<p>Dear <strong>" + clubName + "</strong>,</p>" +
		        "<p>Thank you for registering your club with <strong>Active Hub</strong>. Below are your club account details:</p>" +
		        "<ul>" +
		        "<li><strong>Club Name:</strong> " + clubName + "</li>" +
		        "<li><strong>Club Category:</strong> " + clubCategory + "</li>" +
		        "<li><strong>Branch:</strong> " + branch + "</li>" +
		        "<li><strong>Password:</strong> " + password + "</li>" +
		        "</ul>" +
		        "<p>Please keep this information safe and do not share it with anyone.</p>" +
		        "<p>If you have any questions, feel free to contact us.</p>" +
		        "<p>Thank you,<br>The Active Hub Team</p>";

		    // Set email details
		    helper.setTo(clubEmail);
		    helper.setSubject(subject);
		    helper.setFrom("karimmm0112@gmail.com");
		    helper.setText(htmlContent, true);

		    // Send the email
		    mailSender.send(mimeMessage);
		}
	 
	 @GetMapping("viewaddedclubdata")
		public ModelAndView viewaddedclubdata() {
			ModelAndView mv = new ModelAndView("viewaddedclubdata");
			List<ClubHead> clubList = adminService.ViewAddedClubData();
	        mv.addObject("clublist", clubList);
			
			return mv;
			
	}
	 @GetMapping("/deleteclub")
	   public ModelAndView deleteClub(@RequestParam("id") Long id) 
	  {
	       ModelAndView mv = new ModelAndView();

	       // Call the service method to delete the achievement
	       String result = adminService.deleteclubtById(id);

	       // Add the result message to the model
	       mv.addObject("message", result);
	       mv.setViewName("redirect:/viewaddedclubdata");  // Redirect to the achievements page after deletion
	       return mv;
	   }
	 
	 @GetMapping("/downloadAchievementImage")
	 public ResponseEntity<byte[]> downloadAchievementImage(@RequestParam("id") long id) throws Exception {
	     AddAchievement achievement = adminService.ViewAchievementById(id);

	     if (achievement != null && achievement.getCertificateImage() != null) {
	         Blob certificateImage = achievement.getCertificateImage();
	         byte[] imageBytes = certificateImage.getBytes(1, (int) certificateImage.length());

	         return ResponseEntity.ok()
	             .header("Content-Disposition", "attachment; filename=certificate_" + id + ".jpg")  // Set the file name
	             .contentType(MediaType.IMAGE_JPEG)  // Content type for the image (ensure it's correct)
	             .body(imageBytes);
	     } else {
	         return ResponseEntity.notFound().build();
	     }
	 }



}
