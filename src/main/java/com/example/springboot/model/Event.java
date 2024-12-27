package com.example.springboot.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "event_data")
public class Event
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name="event_id")
  private int id;
  @Column(name="clubhead_id")
  private Long clubheadId;
  @Column(name="event_name",length = 100)
  private String event;
  @Column(name="event_category",nullable = false,length = 100)
  private String category;
  @Column(name="event_desc",nullable = false,length = 500)
  private String description;
  @Column(name="event_time",length = 100,nullable=false)
  private String time;
  @Column(name="event_date",length = 100)
  private String date;
 
  @Column(name="event_image",nullable = false)
  private Blob image;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public Long getClubheadId() {
	return clubheadId;
}
public void setClubheadId(Long clubheadId) {
	this.clubheadId = clubheadId;
}
public String getEvent() {
	return event;
}
public void setEvent(String event) {
	this.event = event;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public Blob getImage() {
	return image;
}
public void setImage(Blob image) {
	this.image = image;
}
  
  
  
}