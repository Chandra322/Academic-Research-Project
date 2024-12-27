package com.example.springboot.service;


import java.util.List;

import com.example.springboot.model.ClubHead;
import com.example.springboot.model.Event;


public interface ClubHeadService {
	
	public ClubHead checkclubheadlogin(String clubEmail, String password);
	public String AddEvent(Event event);
	public List<Event> getEventsByClubheadId(Long clubheadId);
	 public Event ViewEventByID(long id);
	 public String  deleteByEvent(String event);
}