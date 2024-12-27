package com.example.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="club_data")
public class ClubHead {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "id")
	    private Long id; 
	    @Column(name = "clubName", length = 100, nullable = false)
	    private String clubName;
        @Column(name="clubCategory")
	    private String clubCategory;
	    @Column(name = "clubEmail", length = 100, nullable = false, unique = true)
	    private String clubEmail;
        @Column(name="branch")
        private String branch;
        @Column(name = "password", length = 50, nullable = false)
	    private String password;
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getClubName() {
			return clubName;
		}
		public void setClubName(String clubName) {
			this.clubName = clubName;
		}
		public String getClubCategory() {
			return clubCategory;
		}
		public void setClubCategory(String clubCategory) {
			this.clubCategory = clubCategory;
		}
		public String getClubEmail() {
			return clubEmail;
		}
		public void setClubEmail(String clubEmail) {
			this.clubEmail = clubEmail;
		}
		public String getBranch() {
			return branch;
		}
		public void setBranch(String branch) {
			this.branch = branch;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}


}
