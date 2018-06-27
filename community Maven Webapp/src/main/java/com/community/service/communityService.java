package com.community.service;

import com.community.entity.Community;
import com.community.entity.Pager;


public interface communityService {
	public int insert(Community community);
	public int delete(int  id);
	public Pager<Community> getAll(int pageNo,int pageSize,String  type,String name,String college);	
	public Community getByName(String name);	
	public Community getByPhone(Long  phone);	
	public Community getById(int  id);	
	public int update(Community community);
}
