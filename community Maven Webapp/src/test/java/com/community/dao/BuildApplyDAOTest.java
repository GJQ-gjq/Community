package com.community.dao;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.BuildApply;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class BuildApplyDAOTest {
	@Autowired
	private BuildApplyDAO buildApplyDAO;
	@Test
	public void testInsert() {
		BuildApply buildApply=new BuildApply();
		buildApply.setName("红十字协会");
		buildApply.setType("公益类");
		buildApply.setCollege("信息学院");
		buildApply.setUserId("20140202480");
		buildApply.setApplyPhone(131220660953L);
		buildApply.setIntroduce("这是一个公益社团，希望帮助更多的需要帮助的人");
		buildApply.setApplyTime(new Date());
		buildApplyDAO.insert(buildApply);
	}

	@Test
	public void testQueryByUserId() {
		String userId="20140202480";
		List<BuildApply> buildApplies=buildApplyDAO.queryByUserId(userId);
		for (BuildApply buildApply : buildApplies) {
			System.out.println(buildApply.toString());
		}
	}

	@Test
	public void testQueryAll() {
		int offset=0;
		int pageSize=3;
		List<BuildApply> list=buildApplyDAO.queryAll(offset, pageSize);
		for (BuildApply buildApply : list) {
			System.out.println(buildApply.toString());
		}
	}

	@Test
	public void testUpdateCheck() {
		
	}

}
