package com.community.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.community.dao.BuildApplyDAO;
import com.community.dao.CommunityDAO;
import com.community.dao.UserDAO;
import com.community.entity.BuildApply;
import com.community.entity.Community;
import com.community.entity.Pager;
import com.community.service.BuildApplyService;
@Service
public class BuildApplyServiceImpl implements BuildApplyService {
	@Autowired
	private BuildApplyDAO buildApplyDAO;
	@Autowired
	private CommunityDAO communityDAO;
	@Autowired
	private UserDAO userDAO;
	@Override
	public int add(BuildApply buildApply) {
		return buildApplyDAO.insert(buildApply);
	}

	@Override
	public List<BuildApply> getByUserId(String userId) {
		return buildApplyDAO.queryByUserId(userId);
	}

	@Override
	public Pager<BuildApply> getAll(Long phone,int pageNo, int pageSize) {
		Pager<BuildApply> result=null;
		int offset=(pageNo-1)*pageSize;
		if (phone!=null&&!"".equals(phone)) {
			List<BuildApply> buildApplies=buildApplyDAO.queryByphone(phone, offset, pageSize);
			int totalRecord=buildApplyDAO.countByPhone(phone);
			int totalPage = totalRecord / pageSize;
			if(totalRecord % pageSize !=0){
				totalPage++;
			}
			int currentPage=pageNo;
			result=new Pager<BuildApply>(pageSize, currentPage, totalRecord, totalPage, buildApplies);
			return result;
		}
		List<BuildApply> buildApplies=buildApplyDAO.queryAll(offset, pageSize);
		int totalRecord=buildApplyDAO.countAll();
		int totalPage = totalRecord / pageSize;
		if(totalRecord % pageSize !=0){
			totalPage++;
		}
		int currentPage=pageNo;
		result=new Pager<BuildApply>(pageSize, currentPage, totalRecord, totalPage, buildApplies);
		return result;
	}

	@Override
	@Transactional
	public boolean updateCheck(int cId,byte check) {
		if(check==1){//申请通过
			//查询该社团的申请信息
			BuildApply buildApply=buildApplyDAO.queryByCid(cId);
			//把申请信息写入社团实体
			Community community=new Community();
			community.setName(buildApply.getName());
			community.setType(buildApply.getType());
			community.setCollege(buildApply.getCollege());
			community.setBuilder(buildApply.getUser().getUserName());
			community.setPhone(buildApply.getApplyPhone());
			community.setIntroduce(buildApply.getIntroduce());
			community.setCreateTime(new Date());
			community.setNum(0);
			//把该社团信息注册进社团表
			communityDAO.insert(community);
			//修改审核状态为审核通过
			buildApplyDAO.updateCheck(cId,check);
			//修改用户权限为社长
			userDAO.updatePower(buildApply.getUserId());
			return true;
		}else if (check==0) {
			//修改审核状态为审核不通过
			buildApplyDAO.updateCheck(cId,check);
			return true;
		}
		return false;
	}

	@Override
	public int countAll() {
		return buildApplyDAO.countAll();
	}

	@Override
	public int countByPhone(long phone) {
		return buildApplyDAO.countByPhone(phone);
	}

	@Override
	public BuildApply getByCid(int cId) {
		return buildApplyDAO.queryByCid(cId);
	}

}
