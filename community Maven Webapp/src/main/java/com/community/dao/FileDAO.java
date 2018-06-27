package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.entity.File;

public interface FileDAO {
	public int  insert(File file);
	public int delete(int fileId);
	public List<File> queryAll(@Param("offset") int offset, @Param("pageSize") int pageSize);
	public int count();
}
