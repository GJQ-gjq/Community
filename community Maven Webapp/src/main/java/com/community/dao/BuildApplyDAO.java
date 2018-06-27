package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.entity.BuildApply;

public interface BuildApplyDAO {
	public int insert(BuildApply buildApply);
	public BuildApply queryByCid(int cId);
	public List<BuildApply> queryByUserId(String userId);
	public List<BuildApply> queryAll(@Param("offset")int offset,@Param("pageSize")int pageSize);
	public List<BuildApply> queryByphone(@Param("phone")long phone,@Param("offset")int offset,@Param("pageSize")int pageSize);
	public int updateCheck(@Param("cId")int cId,@Param("check")byte check);
	public int countAll();
	public int countByPhone(long phone);
	
}
