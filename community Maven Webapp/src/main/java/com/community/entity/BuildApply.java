package com.community.entity;

import java.util.Date;

public class BuildApply {
	private int cId;
	private  String name;
	private String type;
	private String college;
	private String  userId;
	private long applyPhone;
	private String introduce;
	private Date applyTime;
	private byte check;
	private User user;
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getApplyPhone() {
		return applyPhone;
	}
	public void setApplyPhone(long applyPhone) {
		this.applyPhone = applyPhone;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public byte getCheck() {
		return check;
	}
	public void setCheck(byte check) {
		this.check = check;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "BuildApply [cId=" + cId + ", name=" + name + ", type=" + type
				+ ", college=" + college + ", userId=" + userId
				+ ", applyPhone=" + applyPhone + ", introduce=" + introduce
				+ ", applyTime=" + applyTime + ", check=" + check + ", user="
				+ user + "]";
	}
	
	
	
}
