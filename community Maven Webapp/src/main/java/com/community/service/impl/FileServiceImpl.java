package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.FileDAO;
import com.community.entity.File;
import com.community.entity.Pager;
import com.community.service.FileService;
@Service
public class FileServiceImpl implements FileService {
	@Autowired
	private FileDAO fileDAO;
	@Override
	public int addFile(File file) {
		return fileDAO.insert(file);
	}

	@Override
	public int removeFile(int fileId) {
		return fileDAO.delete(fileId);
	}

	@Override
	public Pager<File> getAllFile(int pageNo, int pageSize) {
		Pager<File> result=null;
		int offset=(pageNo-1)*pageSize;
		List<File> files=fileDAO.queryAll(offset, pageSize);
		int totalRecord=fileDAO.count();
		//获取总页数
		int totalPage = totalRecord / pageSize;
		if(totalRecord % pageSize !=0){
				totalPage++;
			}
		int currentPage=pageNo;
		result=new Pager<File>(pageSize, currentPage, totalRecord, totalPage, files);
		return result;
	}

}
