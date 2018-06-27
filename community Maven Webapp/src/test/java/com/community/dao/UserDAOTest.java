package com.community.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.User;
/**
 * 1、配置Spring和Junit整合，Junit启动时候加载springIOC容器
 * 2、spring-test Junit方便做测试
 */
// Junit运行时候加载spring-ioc容器
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉Junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserDAOTest {
	
	@Autowired
	private UserDAO userDao;

	@Test
	public void testRegister() {
	 User user=new User();
	 user.setUserId("20140202490");
	 user.setUserName(" 张三");
	 user.setUserSex("男");
	 user.setCollege("信息学院");
	 user.setGrade("A1431");
	 user.setTel(13133660953L);
	 user.setPassword("123");
//	 user.setPower(3);
	 if(userDao.insertUser(user)>0){
		 System.out.println("注册成功！");
	 }else {
		System.out.println("注册失败！");
	}
}
	
	@Test
	public void testLogin() {
		String userId="20140202472";
		String password="123456";
		System.out.println(userId+","+password);
		User user=userDao.queryByUserIdAndPsw(userId, password);
		//assertNotNull("登陆成功！", user);
		if(user!=null){
			System.out.println(user.getUserName()+"登陆成功！");
		}else{
			System.out.println("账号或密码错误");
		}
	}
	
	@Test
	public void queryByUserId() {
		String userId="20140202470";
		List<User> user=userDao.queryByUserId(userId);
		System.out.println(user.toString());
	}
	
	@Test
	public void queryAllUser(){
		List<User> list=new ArrayList<User>();
		list=userDao.queryAllUser();
		for (User user : list) {
			System.out.println(user.toString());
		}
	}
	
	@Test
	public void updateByUserId(){
		 User user=new User();
		 user.setUserId("20140202490");
		 user.setUserName("李四");
		 user.setUserSex("女");
		 user.setCollege("信息学院");
		 user.setGrade("A1413");
		 user.setTel(15979941130L);
//		 user.setPower(true);
		 if(userDao.updateByUserId(user)>0){
			 System.out.println("修改成功！");
		 }else {
			System.out.println("修改失败！");
		}
	}
	
	@Test
	public void updatePassword(){
		String userId="20140202470";
		String passWord="123";
		 if(userDao.updatePassword(userId, passWord)>0){
			 System.out.println("修改成功！");
		 }else {
			System.out.println("修改失败！");
		}
	}
	
	@Test
	public void deleteUser(){
		int uId=16;
		if (userDao.deleteUser(uId)>0) {
			System.out.println("删除成功！");
		} else {
			System.out.println("删除失败！");
		}
		
	}

}
