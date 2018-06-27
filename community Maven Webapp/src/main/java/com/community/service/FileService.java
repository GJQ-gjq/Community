package com.community.service;

import com.community.entity.File;
import com.community.entity.Pager;

public interface FileService {
	public int addFile(File file);
	public int removeFile(int fileId);
	public Pager<File> getAllFile(int pageNo,int pageSize);
}
