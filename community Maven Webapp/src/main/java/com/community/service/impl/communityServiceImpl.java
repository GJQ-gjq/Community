package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.CommunityDAO;
import com.community.entity.Community;
import com.community.entity.Pager;
import com.community.service.communityService;
@Service
public class communityServiceImpl implements communityService {
	@Autowired
	private CommunityDAO communityDAO;
	@Override
	public int insert(Community community) {
		return communityDAO.insert(community);
	}

	@Override
	public int delete(int id) {
		return communityDAO.delete(id);
	}

	@Override
	public Pager<Community> getAll(int pageNo,int pageSize,String type, String name, String college) {
		Pager<Community> result=null;
		int offset=(pageNo-1)*pageSize;
		if(type!=null&&type!=""){
			List<Community> communities=communityDAO.queryWithType(type, offset, pageSize);
			int totalRecord=communityDAO.countType(type);
			int totalPage = totalRecord / pageSize;
			if(totalRecord % pageSize !=0){
				totalPage++;
			}
			int currentPage=pageNo;
			result=new Pager<Community>(pageSize, currentPage, totalRecord, totalPage, communities);
			return result;
		}else if(name!=null&&name!=""){
			List<Community> communities=communityDAO.queryWithName(name, offset, pageSize);
			int totalRecord=communityDAO.countName(name);
			int totalPage = totalRecord / pageSize;
			if(totalRecord % pageSize !=0){
				totalPage++;
			}
			int currentPage=pageNo;
			result=new Pager<Community>(pageSize, currentPage, totalRecord, totalPage, communities);
			return result;
		}else if(college!=null&&college!=""){
			List<Community> communities=communityDAO.queryWithCollege(college, offset, pageSize);
			int totalRecord=communityDAO.countCollege(college);
			int totalPage = totalRecord / pageSize;
			if(totalRecord % pageSize !=0){
				totalPage++;
			}		
			int currentPage=pageNo;
			result=new Pager<Community>(pageSize, currentPage, totalRecord, totalPage, communities);
			return result;
		}
		
		
		List<Community> communities=communityDAO.queryAll(offset, pageSize);
		int totalRecord=communityDAO.countAll();
		int totalPage = totalRecord / pageSize;
		if(totalRecord % pageSize !=0){
			totalPage++;
		}
		int currentPage=pageNo;
		result=new Pager<Community>(pageSize, currentPage, totalRecord, totalPage, communities);
		return result;
	}
	

	@Override
	public Community getById(int id) {
		return communityDAO.queryWithId(id);
	}

	@Override
	public int update(Community community) {
		return communityDAO.update(community);
	}

	@Override
	public Community getByName(String name) {
		return communityDAO.querySingleWithName(name);
	}

	@Override
	public Community getByPhone(Long  phone) {
		return communityDAO.querySingleWithPhone(phone);
	}

}
