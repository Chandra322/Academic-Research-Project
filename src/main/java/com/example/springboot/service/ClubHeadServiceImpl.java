package com.example.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.springboot.model.ClubHead;
import com.example.springboot.model.Event;
import com.example.springboot.repository.ClubHeadRepository;
import com.example.springboot.repository.EventRepository;
@Service
public class ClubHeadServiceImpl implements ClubHeadService {
	
	@Autowired
	public ClubHeadRepository clubheadRepository;
	
	@Autowired
	public EventRepository eventRepository;

	@Override
	public ClubHead checkclubheadlogin(String clubEmail, String password) {
		return clubheadRepository.checkclubheadlogin(clubEmail, password);
	
		
	}

	@Override
	public String AddEvent(Event event) {
		eventRepository.save(event);
		return "Event Added Successfully";
	}
	
	public List<Event> getEventsByClubheadId(Long clubheadId) {
	    return eventRepository.findByClubheadId(clubheadId);
	}

	public Event ViewEventByID(long id) {
        return eventRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Event not found with ID: " + id));
    }


	  public String deleteByEvent(String event) {
	        int deletedCount = eventRepository.deleteByEvent(event);
	        if (deletedCount > 0) {
	            return "Event Deleted Successfully";
	        } else {
	            return "Event Not Found";
	        }
	    }
	
}
