package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.UserInClubDAO;
import com.community.entity.Pager;
import com.community.entity.UserInClub;
import com.community.service.UserInClubService;
@Service
public class UserInClubServiceImpl implements UserInClubService {
	@Autowired
	private UserInClubDAO userInClubDAO;
	@Override
	public int add(UserInClub userInClub) {
		return userInClubDAO.insert(userInClub);
	}

	@Override
	public int delete(int id) {
		return userInClubDAO.delete(id);
	}

	@Override
	public Pager<UserInClub> getAllUser(String userName, String clubName,
			int pageNo, int pageSize) {
		Pager<UserInClub> result=null;
		int offset=(pageNo-1)*pageSize;		
		if(userName!=null&&userName!=""){
			List<UserInClub> list=userInClubDAO.queryByClubAndUserName(userName, clubName, offset, pageSize);
			int totalRecord=userInClubDAO.countByUserName(clubName, userName);
			int totalPage = totalRecord / pageSize;
			if(totalRecord % pageSize !=0){
				totalPage++;
			}
			int currentPage=pageNo;
			result=new Pager<UserInClub>(pageSize, currentPage, totalRecord, totalPage, list);
			return result;
		}
		List<UserInClub> list=userInClubDAO.queryByClub(clubName, offset, pageSize);
		int totalRecord=userInClubDAO.countAll(clubName);
		int totalPage = totalRecord / pageSize;
		if(totalRecord % pageSize !=0){
			totalPage++;
		}
		int currentPage=pageNo;
		result=new Pager<UserInClub>(pageSize, currentPage, totalRecord, totalPage, list);		
		return result;
	}

}
