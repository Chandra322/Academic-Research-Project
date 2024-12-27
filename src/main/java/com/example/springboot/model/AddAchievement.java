package com.example.springboot.model;

import jakarta.persistence.*;

import java.sql.Blob;


@Entity
@Table(name = "achievement")
public class AddAchievement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="registerId",length=10)
    private String registerId;
    @Column(name = "title", nullable = false)
    private String title;
    @Column(name = "description", nullable = false)
    private String description;
    @Column(name = "achievede_date", nullable = false)
    private String achievedDate;
    @Column(name = "cash_prize")
    private String cashPrize;
    @Column(name = "category", nullable = false)
    private String category;
   @Column(name = "added_by", nullable = false)
    private String addedBy; // Possible values: "user" or "admin"
    @Column(name = "certificate_image")
    private Blob certificateImage;
    @Column(name = "achievements_link")
    private String achievementsLink;
    @Column(nullable = false)
    private boolean status;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAchievedDate() {
		return achievedDate;
	}
	public void setAchievedDate(String achievedDate) {
		this.achievedDate = achievedDate;
	}
	public String getCashPrize() {
		return cashPrize;
	}
	public void setCashPrize(String cashPrize) {
		this.cashPrize = cashPrize;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAddedBy() {
		return addedBy;
	}
	public void setAddedBy(String addedBy) {
		this.addedBy = addedBy;
	}
	public Blob getCertificateImage() {
		return certificateImage;
	}
	public void setCertificateImage(Blob certificateImage) {
		this.certificateImage = certificateImage;
	}
	public String getAchievementsLink() {
		return achievementsLink;
	}
	public void setAchievementsLink(String achievementsLink) {
		this.achievementsLink = achievementsLink;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getRegisterId() {
		return registerId;
	}
	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}
	
 }