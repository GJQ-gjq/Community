package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.entity.Type;

public interface TypeDAO {
	public int insert(Type type);
	public int delete(int typeId);
	public List<Type> queryAll(@Param("offset") int offset,@Param("pageSize") int pageSize);
	public List<Type> queryByName(@Param("typeName")String typeName,@Param("offset") int offset,@Param("pageSize") int pageSize);
	public int queryMaxId();
}
