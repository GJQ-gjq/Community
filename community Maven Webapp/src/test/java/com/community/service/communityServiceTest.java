package com.community.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.Community;
import com.community.entity.Pager;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class communityServiceTest {
	@Autowired
	private communityService communityService;
	@Test
	public void testInsert() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAll() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetByThree() {
		int pageNo=1;		
		String type="";
		String name="";
		String college="";
		Pager<Integer> page =new Pager<Integer>();
		page.setPageSize(4);
		Pager<Community> result=communityService.getAll(pageNo, page.getPageSize(), type, name, college);
		System.out.println(result.toString());
	}

	@Test
	public void testGetById() {
		int id=1;
		System.out.println(communityService.getById(id));
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateNum() {
		fail("Not yet implemented");
	}

}
