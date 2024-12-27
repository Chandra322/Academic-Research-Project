package com.example.springboot.model;

import jakarta.persistence.*;

@Entity
@Table(name = "user_data") // Updated table name
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id; // Primary key with auto-increment

    @Column(name="registerId",length=10)
    private String registerId;
    

    @Column(name = "fullname", length = 100, nullable = false)
    private String fullName;

    @Column(name = "gender", length = 50, nullable = false)
    private String gender;

    @Column(name = "email", length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "mobilenumber", length = 15, nullable = false, unique = true)
    private String mobileNumber;

    @Column(name = "dateofbirth", length = 10, nullable = false)
    private String dateOfBirth; // Format: dd-MM-yyyy

    @Column(name = "city", length = 50, nullable = false)
    private String city;

    @Column(name = "state", length = 50, nullable = false)
    private String state;

    @Column(name = "district", length = 50, nullable = false)
    private String district;

    @Column(name = "pincode", length = 10, nullable = false)
    private String pincode;

    @Column(name = "country", length = 50, nullable = false)
    private String country;

    @Column(name = "password", length = 100, nullable = false)
    private String password;
    
    @Column(name="verified",nullable=false)
    private boolean verified;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegisterId() {
		return registerId;
	}

	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}

	public boolean isVerified() {
		return verified;
	}

	public void setVerified(boolean verified) {
		this.verified = verified;
	}

   
}
