package com.community.entity;

public class Video {
	private int vId;
	private String vUrl;
	public int getvId() {
		return vId;
	}
	public void setvId(int vId) {
		this.vId = vId;
	}
	public String getvUrl() {
		return vUrl;
	}
	public void setvUrl(String vUrl) {
		this.vUrl = vUrl;
	}
	@Override
	public String toString() {
		return "Vedio [vId=" + vId + ", vUrl=" + vUrl + "]";
	}
	
}
