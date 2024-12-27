package com.example.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.springboot.model.Event;
import com.example.springboot.model.RegisterId;
import com.example.springboot.model.User;

@Repository
public interface RegisterIdRepository extends JpaRepository<RegisterId, Long> 
{


}
