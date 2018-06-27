package com.community.service;

import java.util.List;

import com.community.entity.Apply;
import com.community.entity.Pager;

public interface ApplyService {
	public int add(Apply apply);
	public List<Apply> getByUserId(String userId);
	public Apply getByapplyId(int applyId);
	public Pager<Apply> getByClubId(String userName,String  clubName,int pageNo,int pageSize);
	public boolean updateCheck(int applyId,byte check);
	public int countByUserId(String userId);
	public int countByClub(String clubName);
}
