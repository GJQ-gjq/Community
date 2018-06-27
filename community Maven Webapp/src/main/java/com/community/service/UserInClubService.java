package com.community.service;

import com.community.entity.Pager;
import com.community.entity.UserInClub;

public interface UserInClubService {
	public int add(UserInClub userInClub);
	public int delete(int id);
	public Pager<UserInClub> getAllUser(String userName,String clubName,int pageNo,int pageSize);
}
