package com.example.springboot.repository;




import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.springboot.model.Event;
import com.example.springboot.model.User;

import jakarta.transaction.Transactional;

@Repository
public interface UserRepository  extends JpaRepository<User, Long>{
	
	@Query("select u from User u where u.email=?1 and u.password=?2")
	public User checkUserLogin(String email, String password);

	@Query("delete from  User u  where u.registerId=?1")
	@Modifying
	@Transactional
	public int  deleteUserByregisterId(String registerId);
	
	long countByVerified(boolean verified);


}
