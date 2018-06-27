package com.community.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.community.dao.ApplyDAO;
import com.community.dao.CommunityDAO;
import com.community.dao.UserInClubDAO;
import com.community.entity.Apply;
import com.community.entity.Pager;
import com.community.entity.UserInClub;
import com.community.service.ApplyService;
@Service
public class ApplyServiceImpl implements ApplyService {
	
	@Autowired
	private ApplyDAO applyDAO;
	@Autowired
	private UserInClubDAO userInClubDAO;
	@Autowired
	private CommunityDAO communityDAO;
	@Override
	public int add(Apply apply) {
		return applyDAO.insert(apply);
	}

	@Override
	public List<Apply> getByUserId(String userId) {
		return applyDAO.queryByUserId(userId);
	}

	@Override
	public Pager<Apply> getByClubId(String userName,String clubName,int pageNo,int pageSize) {
		Pager<Apply> result=null;
		int offset=(pageNo-1)*pageSize;
		if(userName!=null&&userName!=""){
			List<Apply> applies=applyDAO.queryByUserName(userName, clubName, offset, pageSize);
			int totalRecord =applyDAO.countByClubAndUserName(userName, clubName);
			int totalPage = totalRecord / pageSize;
			if(totalRecord % pageSize !=0){
				totalPage++;
			}
			int currentPage=pageNo;
			result=new Pager<Apply>(pageSize, currentPage, totalRecord, totalPage, applies);
			return result;
		}
		List<Apply> applies=applyDAO.queryByClub(clubName, offset, pageSize);
		int totalRecord =applyDAO.countByClub(clubName);
		int totalPage = totalRecord / pageSize;
		if(totalRecord % pageSize !=0){
			totalPage++;
		}
		int currentPage=pageNo;
		result=new Pager<Apply>(pageSize, currentPage, totalRecord, totalPage, applies);
		return result;
	}

	@Override
	@Transactional
	public boolean updateCheck(int applyId,byte check) {
		if(check==1){//申请通过
			////查询该学生的申请信息
			Apply apply=applyDAO.queryByApplyId(applyId);
			//把申请写进社团参加对象
			UserInClub userInClub=new UserInClub();
			userInClub.setUserId(apply.getUserId());
			userInClub.setClubName(apply.getClubName());
			userInClub.setInTime(new Date());
			//把该申请信息注册进社团参加表
			userInClubDAO.insert(userInClub);
			//对应社团的社团人数加1
			communityDAO.updateNum(apply.getClubName());
			//修改审核状态为通过
			applyDAO.updateCheck(applyId, check);
			return true;
		}else if (check==0) {
			//修改审核状态为审核不通过
			applyDAO.updateCheck(applyId, check);
			return true;
		}
		return false;
	}


	@Override
	public int countByUserId(String userId) {
		return applyDAO.countByUserId(userId);
	}

	@Override
	public int countByClub(String clubName) {
		return applyDAO.countByClub(clubName);
	}

	@Override
	public Apply getByapplyId(int applyId) {
		return applyDAO.queryByApplyId(applyId);
	}

}
