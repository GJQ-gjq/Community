package com.community.dao;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.UserInClub;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class UserInClubDAOTest {
	@Autowired
	private UserInClubDAO userInClubDAO;
	@Test
	public void testInsert() {
		UserInClub userInClub=new UserInClub();
		userInClub.setUserId("20140202472");
		userInClub.setClubName("游戏开发者协会");
		userInClub.setInTime(new Date());
		userInClubDAO.insert(userInClub);
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryByClub() {
		String clubName="财经协会";
		List<UserInClub> list=userInClubDAO.queryByClub(clubName, 0, 12);
		if (list.size()>0) {
			for (UserInClub userInClub : list) {
				System.out.println(userInClub.toString());
			}
		}
	}

	@Test
	public void testQueryByClubAndUserName() {
		String clubName="财经协会";
		String userName="李四";
		List<UserInClub> list=userInClubDAO.queryByClubAndUserName(userName, clubName, 0, 12);
		if (list.size()>0) {
			for (UserInClub userInClub : list) {
				System.out.println(userInClub.toString());
			}
	}

}
}