package com.community.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.BuildApply;
import com.community.entity.Pager;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class BuildApplyServiceTest {
	@Autowired
	private BuildApplyService buildApplyService;
	@Autowired
	private communityService communityService;
	
	@Test
	public void testAdd() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetByUserId() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAll() {
		int pageNo=1;
		Long phone=null;
		Pager<BuildApply> result=buildApplyService.getAll(phone, pageNo, 12);
		System.out.println(result.toString());
		int count=buildApplyService.countAll();
		
		System.out.println(count);
	}

	@Test
	public void testUpdateCheck() {
		int cId=4;
		byte check=1;
		BuildApply buildApply=buildApplyService.getByCid(cId);
		if(communityService.getByName(buildApply.getName())!=null){
			System.out.println("此社团已存在！");
		}else {
			boolean f=buildApplyService.updateCheck(cId, check);
			System.out.println(f);
		}
		
		
	}

	@Test
	public void testCountAll() {
		fail("Not yet implemented");
	}

	@Test
	public void testCountByPhone() {
		fail("Not yet implemented");
	}

}
