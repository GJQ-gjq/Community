package com.community.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.User;
import com.community.service.UserService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
public class UserServerImplTest {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserService userServer;
	
	@Test
	public void testLogin() {
		String userId="20140202470";
		String password="123";
		User user=userServer.login(userId, password);
		if(user!=null){
			System.out.println(user.getUserName()+"登陆成功！");
		}else{
			System.out.println("账号或密码错误");
		}
	}
	@Test
	public void testRegister() {
		User user=new User();
		 user.setUserId("20140202480");
		 user.setUserName(" 张三");
		 user.setUserSex("男");
		 user.setCollege("信息学院");
		 user.setGrade("计算机科学与技术");
		 user.setTel(13133660953L);
		 user.setPassword("123");
		 if(userServer.register(user)){
			 System.out.println("注册成功！");
		 }else {
			System.out.println("注册失败！");
		}
	}

	@Test
	public void testGetUserById() {
		String userId="20140202470";
		List<User> user=userServer.getUserById(userId);
		logger.info("user={}", user);
	}

	@Test
	public void testGetAllUsers() {
		List<User> list=userServer.getAllUsers();
		logger.info("list={}", list);
	}

	@Test
	public void testUpdateUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdatePassword() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteUser() {
		fail("Not yet implemented");
	}

}
