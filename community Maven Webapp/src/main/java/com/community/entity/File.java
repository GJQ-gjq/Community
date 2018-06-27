package com.community.entity;

import java.util.Date;

public class File {
	private int fileId;
	private String fileName;
	private Date uploadTime;
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	@Override
	public String toString() {
		return "File [fileId=" + fileId + ", fileName=" + fileName
				+ ", uploadTime=" + uploadTime + "]";
	}
	
}
