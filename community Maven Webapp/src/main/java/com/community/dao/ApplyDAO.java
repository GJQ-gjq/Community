package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.entity.Apply;

public interface ApplyDAO {
	public int insert(Apply apply);
	public List<Apply> queryByUserId(String userId);
	public Apply queryByApplyId(int applyId);
	public List<Apply> queryByClub(@Param("clubName")String clubName,@Param("offset")int offset,@Param("pageSize")int pageSize);	
	public List<Apply> queryByUserName(@Param("userName")String userName,@Param("clubName")String clubName,@Param("offset")int offset,@Param("pageSize")int pageSize);	
	public int updateCheck(@Param("applyId")int applyId,@Param("check")byte check);
	public int countByUserId(String userId);
	public int countByClub(String clubName);
	public int countByClubAndUserName(@Param("userName")String userName,@Param("clubName")String clubName);
}
