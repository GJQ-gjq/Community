package com.community.service;

import java.util.List;

import com.community.entity.BuildApply;
import com.community.entity.Pager;

public interface BuildApplyService {
	public int add(BuildApply buildApply);
	public BuildApply getByCid(int cId);
	public List<BuildApply> getByUserId(String userId);
	public Pager<BuildApply> getAll(Long phone,int pageNo,int pageSize);
	public boolean updateCheck(int cId,byte check);
	public int countAll();
	public int countByPhone(long phone);
}
