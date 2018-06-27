package com.community.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.Admin;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class AdminServiceTest {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private AdminService adminService;
	@Test
	public void testLogin() {
		String adminName="admin2";
		String adminPassword="admin2";
		Admin admin=adminService.login(adminName, adminPassword);
		if (admin!=null) {
			System.out.println(admin.getAdminName()+"登陆成功");
		} else {
			System.out.println("登陆失败");
		}
	}

	@Test
	public void testRegister() {
		Admin admin=new Admin();
		admin.setAdminName("admin2");
		admin.setAdminPassword("admin2");
		if (adminService.register(admin)) {
			System.out.println("添加成功");
		} else {
			System.out.println("添加失败");
		}
	}

	@Test
	public void testUpdatePassword() {
		int adminId=5;
		String adminPassword="admin2";
		if (adminService.updatePassword(adminId, adminPassword)) {
			System.out.println("修改成功");
		} else {
			System.out.println("修改失败");
		}
	}

	@Test
	public void testDelete() {
		int adminId=5;
		if (adminService.delete(adminId)) {
			System.out.println("删除成功");
		} else {
			System.out.println("删除失败");
		}
	}

	@Test
	public void testGetAdmin() {
		String adminName="admin2";
		List<Admin> admin=adminService.getAdmin(adminName);
		if (admin!=null) {
			System.out.println(admin.toString());
		} else {
			System.out.println("查无此人");
		}
	}

	@Test
	public void testGetAllAdmins() {
		List<Admin> admins=adminService.getAllAdmins();
		for (Admin admin : admins) {
			System.out.println(admin.toString());
		}
	}

}
