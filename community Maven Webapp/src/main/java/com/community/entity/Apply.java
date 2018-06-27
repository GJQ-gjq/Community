package com.community.entity;

import java.util.Date;

/**
 * 加入社团申请
 * @author 猩猩
 *
 */
public class Apply {
	private int applyId;
	private String  userId;
	private String clubName;	
	private String reason;
	private Date applyTime;
	private byte check;
	private Community community;
	private User user;
	public int getApplyId() {
		return applyId;
	}
	public void setApplyId(int applyId) {
		this.applyId = applyId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String  getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
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
	public Community getCommunity() {
		return community;
	}
	public void setCommunity(Community community) {
		this.community = community;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Apply [applyId=" + applyId + ", userId=" + userId
				+ ", clubName=" + clubName + ", reason=" + reason
				+ ", applyTime=" + applyTime + ", check=" + check
				+ ", community=" + community + ", user=" + user + "]";
	}
	
}
