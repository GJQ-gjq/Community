package com.community.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.News;
import com.community.entity.Pager;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
public class NewsServiceTest {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private NewsService newsService;
	@Test
	public void testAddNews() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteNews() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetByCommunity() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAllByType() {
		int pageNo=1;
		String  type="新闻 ";
		Pager<Integer> page =new Pager<Integer>();
		page.setPageSize(4);
		Pager<News> result=newsService.getAllByType(type, pageNo, page.getPageSize());
		System.out.println(result.toString());
	}
	@Test
	public void testGetAll() {
		int pageNo=1;
		//Pager<Integer> page =new Pager<Integer>();
		//page.setPageSize(4);
		Pager<News> result=newsService.getAll(null,pageNo, 12);
		System.out.println(result.toString());
	}

	@Test
	public void testGetByType() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateNews() {
		fail("Not yet implemented");
	}

	@Test
	public void testNewsCount() {
		fail("Not yet implemented");
	}

}
