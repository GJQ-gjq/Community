package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.entity.UserInClub;

public interface UserInClubDAO {
	public int insert(UserInClub userInClub);
	public int delete(int id);
	public List<UserInClub> queryByClub(@Param("clubName")String clubName,@Param("offset")int offset,@Param("pageSize")int pageSize);
	public List<UserInClub> queryByClubAndUserName(@Param("userName")String userName,@Param("clubName")String clubName,@Param("offset")int offset,@Param("pageSize")int pageSize);
	public int countAll(String clubName);
	public int countByUserName(@Param("clubName")String clubName,@Param("userName")String userName);
	
}
