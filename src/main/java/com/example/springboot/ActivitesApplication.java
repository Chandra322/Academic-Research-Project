package com.example.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ActivitesApplication {

	public static void main(String[] args) {
		SpringApplication.run(ActivitesApplication.class, args);
		System.out.println("Activity Running Successfully");
	}

}
