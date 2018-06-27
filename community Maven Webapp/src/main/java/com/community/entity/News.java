package com.community.entity;

import java.util.Date;

public class News {
	private int newsId;
	private String title;
	private String writer;
	private String content;
	private String type;
	private Date creatTime;
	private int cId;
	private Community community;
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public Community getCommunity() {
		return community;
	}
	public void setCommunity(Community community) {
		this.community = community;
	}
	@Override
	public String toString() {
		return "News [newsId=" + newsId + ", title=" + title + ", writer="
				+ writer + ", content=" + content + ", type=" + type
				+ ", creatTime=" + creatTime + ", cId=" + cId + ", community="
				+ community + "]";
	}
	
}
