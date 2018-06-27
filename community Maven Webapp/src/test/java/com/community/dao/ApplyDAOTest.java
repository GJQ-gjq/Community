package com.community.dao;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.Apply;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class ApplyDAOTest {
	@Autowired
	private ApplyDAO applyDAO;
	@Test
	public void testInsert() {
		Apply apply=new Apply();
		apply.setUserId("20140202471");
		apply.setClubName("九天器乐俱乐部");
		apply.setReason("基友想找共同爱好的组织一起开心的玩耍");
		apply.setApplyTime(new Date());
		System.out.println(applyDAO.insert(apply));
	}

	@Test
	public void testQueryByUserId() {
		String userId="20140202471";
		List<Apply> list=applyDAO.queryByUserId(userId);
		if(list!=null){
			for (Apply apply:list) {
				System.out.println(apply.toString());
				//System.out.println(apply.getCommunity().toString());
			}
			
		}
	}

	@Test
	public void testQueryByClub() {
		String  clubName="财经协会";
		List<Apply> list=applyDAO.queryByClub(clubName, 0, 12);
		if (list!=null) {
			for (Apply apply : list) {
				System.out.println(apply.toString());
			}
			
		}
	}

	@Test
	public void testUpdateCheck() {
		fail("Not yet implemented");
	}

}
