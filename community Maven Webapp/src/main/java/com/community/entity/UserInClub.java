package com.community.entity;

import java.util.Date;

public class UserInClub {
	private int id;
	private String  userId;
	private String clubName;
	private Date inTime;
	private User user;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String  getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public Date getInTime() {
		return inTime;
	}
	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "UserInClub [id=" + id + ", userId=" + userId + ", clubName="
				+ clubName + ", inTime=" + inTime + ", user=" + user + "]";
	}
	
	
	
}
