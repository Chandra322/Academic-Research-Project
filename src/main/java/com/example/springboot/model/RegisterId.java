package com.example.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="RegisterId")
public class RegisterId {
	
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "id")
	    private Long id; // Primary key with auto-increment

	    @Column(name="RegisterId")
        private String RegisterId;

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getRegisterId() {
			return RegisterId;
		}

		public void setRegisterId(String registerId) {
			RegisterId = registerId;
		}

		
	    
}
