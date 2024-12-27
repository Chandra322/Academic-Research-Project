package com.example.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name ="admin_data")
public class Admin {
	
	
	@Id
	@Column(name="admin_username",length=50)
	private String username;
	@Column(name="admin_password",length=50)
	private String password;

	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		password = password;
	}

}
