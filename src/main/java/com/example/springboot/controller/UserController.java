package com.example.springboot.controller;

import java.util.ArrayList;
import java.util.List;

import java.sql.Blob;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.springboot.model.AddAchievement;
import com.example.springboot.model.Event;
import com.example.springboot.model.RegisterId;
import com.example.springboot.model.User;
import com.example.springboot.model.UserEventRegistration;
import com.example.springboot.service.AdminService;
import com.example.springboot.service.ClubHeadService;
import com.example.springboot.service.UserService;


import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ClubHeadService clubheadService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("studentLoginRegister")
	public  ModelAndView studentLoginRegister() 
	{
			 ModelAndView mv = new ModelAndView();
			  mv.setViewName("studentLoginRegister");
			 return mv;
	}
	 @GetMapping("userlogout")
		public ModelAndView  userlogout()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/studentLoginRegister");
			return mv;
		}
	 
	 @GetMapping("usersessionexpiry") 
	  public ModelAndView empsessionexpiry() 
	  { 
	   ModelAndView mv = new ModelAndView(); 
	   mv.setViewName("usersessionexpiry"); 
	   return mv;
	  }

	@PostMapping("/insertuser")
	public ModelAndView insertuser(HttpServletRequest request) throws Exception {
	    // Retrieve user data from the form
		
		 String registerId = request.getParameter("registerId");
	    String fullName = request.getParameter("fullname");
	    String gender = request.getParameter("gender");
	    String dateOfBirth = request.getParameter("dateofbirth");
	    String email = request.getParameter("email");
	    String mobileNumber = request.getParameter("mobilenumber");
	    String city = request.getParameter("city");
	    String state = request.getParameter("state");
	    String district = request.getParameter("district");
	    String pincode = request.getParameter("pincode");
	    String country = request.getParameter("country");
	    String password = request.getParameter("password");
	    
	    // Create a new User object and set its attributes
	    System.out.println(registerId);
	    User user = new User();
	   user.setRegisterId(registerId);
	    user.setFullName(fullName);
	    user.setGender(gender);
	    user.setDateOfBirth(dateOfBirth);
	    user.setEmail(email);
	    user.setMobileNumber(mobileNumber);
	    user.setCity(city);
	    user.setState(state);
	    user.setDistrict(district);
	    user.setPincode(pincode);
	    user.setCountry(country);
	    user.setPassword(password);

	 	List<RegisterId> regiterIds=userService.getAllRegisterId();
	    List<String> ids=new ArrayList<String>();
	    for(RegisterId r:regiterIds) {
	    	ids.add(r.getRegisterId());
	    }
	    if(ids.contains(registerId)) {
	    	System.out.println("register id found");
	    	user.setVerified(true);
	    }
	    else {
	    	user.setVerified(false);
	    }
	    userService.Register(user);

	   
	    sendRegistrationEmail(email, fullName);

	  
	    ModelAndView mv = new ModelAndView();
	   
	    mv.setViewName("redirect:/studentLoginRegister"); // This is the view to be rendered after registration
	    mv.addObject("message", "Registration successful! A confirmation email has been sent to your address.");
	    return mv;
	}

	
	private void sendRegistrationEmail(String email, String fullName) throws Exception {
	    // Create a MimeMessage for the email
	    MimeMessage mimeMessage = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

	  
	    String subject = "Welcome to Active Hub!";
	    String htmlContent = 
	        "<h3>Welcome to Active Hub!</h3>" +
	        "<p>Dear <strong>" + fullName + "</strong>,</p>" +
	        "<p>Thank you for registering with <strong>Active Hub</strong>. We're excited to have you on board!</p>" +
	        "<p>If you have any questions or need assistance, feel free to reach out to us.</p>" +
	        "<p>Thank you,<br>The Active Hub Team</p>";

	    // Set email details
	    helper.setTo(email);
	    helper.setSubject(subject);
	    helper.setFrom("karimmm0112@gmail.com");
	    helper.setText(htmlContent, true);

	    // Send the email
	    mailSender.send(mimeMessage);
	}
	
	@PostMapping("/checkuserlogin")
	public ModelAndView checkUserLogin(HttpServletRequest request) {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    ModelAndView mv = new ModelAndView();

	    System.out.println(email + " " + password);

	    User user = userService.checkLogin(email, password);

	     if (user == null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("error", "Check your credentials");
	        System.out.println("Details not found");
	        mv.setViewName("redirect:/studentLoginRegister"); 
	    } else if (!user.isVerified()) {
	        mv.addObject("msg", "Your account is not verified. Kindly contact Admin (in Contact page)");
	        mv.setViewName("ErrorPage");
	        System.out.println(user.toString()+"");
	    } else {
	        HttpSession session = request.getSession();
	        session.setAttribute("user", user);
	        mv.setViewName("redirect:/userDashboard");
	        System.out.println(user.toString());
	    }
	    return mv;
	}
	 @GetMapping("userDashboard")
		public  ModelAndView adminDashboard() 
		{
				 ModelAndView mv = new ModelAndView();
				  mv.setViewName("userDashboard");
				 return mv;
		}
	 @GetMapping("userprofile")
		public ModelAndView empprofile()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("userprofile");
			return mv;
		}

	 
	  @PostMapping("/insertachivements")
	    public ModelAndView insertachievements(HttpServletRequest request, 
	                                           @RequestParam("certificateImage") MultipartFile file) {
	        ModelAndView mv = new ModelAndView();
	        String msg;

	        try {
	            // Retrieve `userId` from the form
	            String registerId = request.getParameter("registerId");
	            String title = request.getParameter("title");
	            String description = request.getParameter("description");
	            String achievedDate = request.getParameter("achievedDate");
	            String cashPrize = request.getParameter("cashPrize");
	            String category = request.getParameter("category");
	            String addedBy = request.getParameter("addedBy");
	            String achievementsLink = request.getParameter("achievementsLink");
	           

	            byte[] bytes = file.getBytes();
	            Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

	            AddAchievement ach = new AddAchievement();
	            ach.setRegisterId(registerId);
	            ach.setTitle(title);
	            ach.setDescription(description);
	            ach.setAchievedDate(achievedDate);
	            ach.setCashPrize(cashPrize);
	            ach.setCategory(category);
	            ach.setAddedBy(addedBy);
	            ach.setAchievementsLink(achievementsLink);
	            ach.setCertificateImage(blob);

	            // Save details via service
	            msg = userService.addachievement(ach);
	            mv.setViewName("redirect:/uploadachievement");
	        } catch (Exception e) {
	            msg = e.getMessage();
	            mv.setViewName("index");
	            mv.addObject("message", msg);
	        }

	        return mv;
	    }
	  @GetMapping("uploadachievement")
		public  ModelAndView  uploadachievement() 
		{
				 ModelAndView mv = new ModelAndView();
				  mv.setViewName("uploadachievement");
				 return mv;
		}
	  
	  @GetMapping("/achivementregisterid")
	  public ModelAndView achivementByUserId(HttpServletRequest request) {
	      ModelAndView mv = new ModelAndView("achivementregisterid");

	      // Retrieve the current user from the session
	      HttpSession httpSession = request.getSession();
	      User user = (User) httpSession.getAttribute("user");

	      if (user != null) {
	          String registerId = user.getRegisterId();

	          // Fetch achievements using the service
	          List<AddAchievement> achievements = userService.findbyregisterId(registerId);

	          if (!achievements.isEmpty()) {
	              mv.addObject("achievements", achievements);
	          } else {
	              mv.addObject("message", "No achievements found for the user.");
	          }
	      } else {
	          mv.addObject("message", "User not logged in or session expired.");
	          mv.setViewName("error"); // Redirect to an error page or login page if needed
	      }

	      return mv;
	  }

	  @GetMapping("/displayAchivementImage")
	  public ResponseEntity<byte[]> displayAchivementImage(@RequestParam String registerId, @RequestParam int achievementIndex) {

	      // Fetch achievements using the registerId
	      List<AddAchievement> achievements = userService.findbyregisterId(registerId);

	      if (achievements.isEmpty() || achievementIndex >= achievements.size()) {
	          return ResponseEntity.notFound().build();
	      }

	      // Retrieve the specific achievement by index
	      AddAchievement achievement = achievements.get(achievementIndex);
	      Blob certificateImageBlob = achievement.getCertificateImage();

	      if (certificateImageBlob == null) {
	          return ResponseEntity.notFound().build();
	      }

	      try {
	          // Convert Blob to byte array
	          byte[] imageBytes = certificateImageBlob.getBytes(1, (int) certificateImageBlob.length());

	          // Return the image as a response
	          return ResponseEntity.ok()
	                  .contentType(MediaType.IMAGE_JPEG) // Adjust content type as necessary
	                  .body(imageBytes);

	      } catch (Exception e) {
	          e.printStackTrace();
	          return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	      }
	  }
	  @PostMapping("/updateachievement")
	  public ModelAndView updateAchievement(HttpServletRequest request, 
	                                        @RequestParam(value = "certificateImage", required = false) MultipartFile file) {
	      ModelAndView mv = new ModelAndView();
	      String msg;

	      try {
	          Long id = Long.parseLong(request.getParameter("achievementid")); 
	          String registerId = request.getParameter("registerId");
	          String title = request.getParameter("title");
	          String description = request.getParameter("description");
	          String achievedDate = request.getParameter("achievedDate");
	          String cashPrize = request.getParameter("cashPrize");
	          String category = request.getParameter("category");
	          String addedBy = request.getParameter("addedBy");
	          String achievementsLink = request.getParameter("achievementsLink");

	          Blob certificateImage = null;
	          if (file != null && !file.isEmpty()) {
	              byte[] bytes = file.getBytes();
	              try {
	                  certificateImage = new javax.sql.rowset.serial.SerialBlob(bytes);
	              } catch (SQLException e) {
	                  throw new RuntimeException("Failed to process certificate image", e);
	              }
	          }

	          AddAchievement achievement = new AddAchievement();
	          achievement.setId(id); 
	          achievement.setRegisterId(registerId);
	          achievement.setTitle(title);
	          achievement.setDescription(description);
	          achievement.setAchievedDate(achievedDate);
	          achievement.setCashPrize(cashPrize);
	          achievement.setCategory(category);
	          achievement.setAddedBy(addedBy);
	          achievement.setAchievementsLink(achievementsLink);

	          if (certificateImage != null) {
	              achievement.setCertificateImage(certificateImage);
	          }

	          msg = userService.updateAchievement(achievement);

	          AddAchievement updatedAchievement = userService.findById(id);

	          mv.setViewName("redirect:/achivementregisterid");
	          mv.addObject("achievement", updatedAchievement); 
	      } catch (Exception e) {
	          msg = e.getMessage();
	          mv.setViewName("redirect:/achivementregisterid");
	          mv.addObject("message", msg);
	      }

	      return mv;
	  }

	  @GetMapping("/updateachievement")
	  public ModelAndView getUpdateAchievementForm(@RequestParam("id") long id) {
	      ModelAndView mv = new ModelAndView();
	      String msg;
	      try {
	          AddAchievement achievement = userService.findById(id);
	          if (achievement != null) {
	              mv.setViewName("updateachievement"); 
	              mv.addObject("achievement", achievement); 
	          } else {
	              msg = "Achievement not found!";
	              mv.setViewName("error");
	              mv.addObject("message", msg);
	          }
	      } catch (Exception e) {
	          msg = "Error: " + e.getMessage();
	          mv.setViewName("error");
	          mv.addObject("message", msg);
	      }

	      return mv;
	  }

	  @GetMapping("/displayAchivementImages")
	  public ResponseEntity<byte[]> displayAchivementImages(@RequestParam String registerId, @RequestParam long id) {
	      // Fetch the achievement using the provided ID
	      AddAchievement achievement = userService.findById(id);

	      if (achievement == null || achievement.getCertificateImage() == null) {
	          return ResponseEntity.notFound().build();
	      }

	      try {
	          // Convert Blob to byte array
	          Blob certificateImageBlob = achievement.getCertificateImage();
	          byte[] imageBytes = certificateImageBlob.getBytes(1, (int) certificateImageBlob.length());

	          // Return the image as a response
	          return ResponseEntity.ok()
	                  .contentType(MediaType.IMAGE_JPEG) // Adjust content type as necessary
	                  .body(imageBytes);

	      } catch (Exception e) {
	          e.printStackTrace();
	          return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	      }
	  }
	  
	  @GetMapping("viewallevents")
	  public ModelAndView viewallevents() {
	      List<Event> eventlist = userService.ViewAllEvents();
	      eventlist.forEach(event -> System.out.println("Event: " + event));

	      ModelAndView mv = new ModelAndView("viewallevents");
	      mv.addObject("eventlist", eventlist);

	      return mv;
	  }
	  @GetMapping("displayeventimages")
	  public ResponseEntity<byte[]> displayprodimagedemos(@RequestParam long id) throws Exception
	  {
	    Event event = clubheadService.ViewEventByID(id);
	    byte [] imageBytes = null;
	    imageBytes = event.getImage().getBytes(1,(int) event.getImage().length());

	    return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	    
	  // Response Body, HTTP Status Code, Headers
	  }
	  
	  
}