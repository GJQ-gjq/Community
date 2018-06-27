package com.community.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.Admin;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class AdminDAOTest {
	@Autowired
	private AdminDAO adminDAO;
	@Test
	public void testInsert() {
		Admin admin =new Admin();
		admin.setAdminName("admin1");
		admin.setAdminPassword("admin1");
		adminDAO.insert(admin);
	}

	@Test
	public void testDelete() {
		int adminId=4;
		adminDAO.delete(adminId);
		
	}


	@Test
	public void testUpdatePassword() {
		adminDAO.updatePassword(1, "admin1");
	}

	@Test
	public void testQueryAll() {
		List<Admin> list=adminDAO.queryAll();
		for (Admin admin : list) {
			System.out.println(admin.toString());
		}
	}

	@Test
	public void testQueryByNameAndPsw() {
		Admin admin=adminDAO.queryByNameAndPsw("admin1", "admin1");
		if (admin!=null) {
			System.out.println("登录成功！");
		} else {
			System.out.println("登录失败！");
		}
	}

}
