package com.example.springboot.repository;



import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.springboot.model.Event;

import jakarta.transaction.Transactional;

@Repository

public interface EventRepository extends JpaRepository<Event, Integer>{
	  List<Event> findByClubheadId(Long clubheadId);
	  Optional<Event> findById(Long id);
	  

		@Query("delete from  Event e  where e.event=?1")
		@Modifying
		@Transactional
		public int  deleteByEvent(String event);


	
	
}
