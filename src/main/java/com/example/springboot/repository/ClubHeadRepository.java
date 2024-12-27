package com.example.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.springboot.model.Admin;
import com.example.springboot.model.ClubHead;


@Repository
public interface ClubHeadRepository extends JpaRepository<ClubHead, Long>{

	
	@Query("select a from ClubHead a where a.clubEmail=?1 and a.password=?2")
	public ClubHead checkclubheadlogin(String clubEmail, String password);
	
	
}
