package com.community.service;

import com.community.entity.Pager;
import com.community.entity.Type;

public interface TypeService {
	public int add(Type type);
	public int delete(int typeId);
	public Pager<Type> getAll(String typeName,int pageNo,int pageSize);
	public int getMaxId();
}
