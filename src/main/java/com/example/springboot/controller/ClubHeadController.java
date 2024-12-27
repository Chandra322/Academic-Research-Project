package com.example.springboot.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.springboot.model.Admin;
import com.example.springboot.model.ClubHead;
import com.example.springboot.model.Event;
import com.example.springboot.service.ClubHeadService;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClubHeadController {
	
	@Autowired
	private ClubHeadService clubheadService;
	
	 @GetMapping("clubheadlogin")
		public  ModelAndView adminlogin() 
		{
				 ModelAndView mv = new ModelAndView();
				  mv.setViewName("clubheadlogin");
				 return mv;
		}
		 
	 @GetMapping("clubheaddashboard")
		public  ModelAndView clubheaddashboard() 
		{
				 ModelAndView mv = new ModelAndView();
				  mv.setViewName("clubheaddashboard");
				 return mv;
		}
		 
	
	
	 @PostMapping("checkclubheadlogin")
		//@ResponseBody
		public ModelAndView checkclubheadlogin(HttpServletRequest request)
		{
				ModelAndView mv = new ModelAndView();
				
				String clubEmail = request.getParameter("clubEmail");
				String password = request.getParameter("password");
				
				ClubHead club = clubheadService.checkclubheadlogin(clubEmail, password);
				if(club!=null)
				{
					HttpSession session = request.getSession();
			        session.setAttribute("club", club);
					mv.setViewName("redirect:/clubheaddashboard");
				}		
				else
				{
				    
					mv.setViewName("clubheadlogin");
					mv.addObject("message","Login Failed");
				}
				  return mv;
		}
	 @PostMapping("insertevent")
	 public ModelAndView insertevent(HttpServletRequest request, @RequestParam("eventimage") MultipartFile file) throws Exception {
	     String msg = null;
	     ModelAndView mv = new ModelAndView();

	     try {
	         // Retrieve the clubheadId from the session
	         HttpSession session = request.getSession();
	         ClubHead club = (ClubHead) session.getAttribute("club");
	         if (club == null) {
	             msg = "Error: No ClubHead found in session.";
	             mv.setViewName("eventerror");
	             mv.addObject("message", msg);
	             return mv;
	         }

	         // Get the form parameters
	         Long clubheadId = club.getId(); // Get clubheadId from session attribute
	         String event = request.getParameter("event");
	         String category = request.getParameter("category");
	         String description = request.getParameter("description");
	         String time = request.getParameter("time");
	         String date = request.getParameter("date");

	         // Handle file upload
	         byte[] bytes = file.getBytes();
	         Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

	         // Create Event object and set properties
	         Event e = new Event();
	         e.setClubheadId(clubheadId);
	         e.setCategory(category);
	         e.setEvent(event);
	         e.setDescription(description);
	         e.setDate(date);
	         e.setTime(time);
	         e.setImage(blob);

	         // Add event to the system
	         msg = clubheadService.AddEvent(e);
	         mv.setViewName("redirect:/AddEvent");
	         mv.addObject("message", msg); // Pass the message to the redirected page

	     } catch (Exception e) {
	         msg = e.getMessage();
	         mv.setViewName("redirect:/AddEvent");
	         mv.addObject("message", msg);
	     }

	     return mv;
	 }

	 @GetMapping("AddEvent")
	 public ModelAndView AddEvent() {
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("AddEvent");
	     return mv;
	 }
	 @GetMapping("viewclubheadevents")
	 public ModelAndView viewEvents(HttpServletRequest request) {
	     ModelAndView mv = new ModelAndView();
	     String msg = null;

	     try {
	         // Retrieve the ClubHead from the session
	         HttpSession session = request.getSession();
	         ClubHead club = (ClubHead) session.getAttribute("club");

	         if (club == null) {
	             msg = "Error: No ClubHead found in session.";
	             mv.setViewName("eventerror");
	             mv.addObject("message", msg);
	             return mv;
	         }

	         // Get the ClubHead ID
	         Long clubheadId = club.getId();

	         // Fetch events from the service layer
	         List<Event> events = clubheadService.getEventsByClubheadId(clubheadId);

	         // Add events to the ModelAndView
	         mv.addObject("events", events);
	         mv.setViewName("viewclubheadevents");
	     } catch (Exception e) {
	         msg = e.getMessage();
	         mv.setViewName("eventerror");
	         mv.addObject("message", msg);
	     }

	     return mv;
	 }
	 @GetMapping("displayeventimage")
	 public ResponseEntity<byte[]> displayEventImage(@RequestParam long id) {
	     try {
	         // Fetch the event by ID
	         Event event = clubheadService.ViewEventByID(id);

	         if (event == null || event.getImage() == null) {
	             // If the event or image is not found, return 404
	             return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
	         }

	        
	         byte[] imageBytes = event.getImage().getBytes(1, (int) event.getImage().length());

	         
	         String contentType = MediaType.IMAGE_JPEG_VALUE; // Default to JPEG
	         
	         // Return the image bytes with the correct content type
	         return ResponseEntity.ok()
	                 .contentType(MediaType.parseMediaType(contentType))
	                 .body(imageBytes);

	     } catch (Exception e) {
	         // Log the exception and return 500 Internal Server Error
	         e.printStackTrace();
	         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	     }
	 }
	 @GetMapping("/deleteevent")
	 public String deleteEvent(@RequestParam("event") String event) {
	     String result = clubheadService.deleteByEvent(event);
	     System.out.println(result);  // Log or use the result as needed
	     return "redirect:/viewclubheadevents";
	 }

}
