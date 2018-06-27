package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.TypeDAO;
import com.community.entity.Pager;
import com.community.entity.Type;
import com.community.service.TypeService;
@Service
public class TypeServiceImpl implements TypeService {
	@Autowired
	private TypeDAO typeDAO;

	@Override
	public int add(Type type) {
		return typeDAO.insert(type);
	}

	@Override
	public int delete(int typeId) {
		return typeDAO.delete(typeId);
	}

	@Override
	public Pager<Type> getAll(String typeName,int pageNo, int pageSize) {
		Pager<Type> result=null;
		int offset=(pageNo-1)*pageSize;
		List<Type> types=null;
		int totalRecord=1;
		if(typeName!=null&&!"".equals(typeName)){
			types=typeDAO.queryByName(typeName, offset, pageSize);
		}else {
			types=typeDAO.queryAll(offset, pageSize);
			//获取总记录数
			totalRecord=typeDAO.queryMaxId();
		}
		//获取总页数
		int totalPage = totalRecord / pageSize;
		if(totalRecord % pageSize !=0){
				totalPage++;
			}
		int currentPage=pageNo;
		result=new Pager<Type>(pageSize, currentPage, totalRecord, totalPage, types);
		return result;
	}

	@Override
	public int getMaxId() {
		return typeDAO.queryMaxId();
	}

}
