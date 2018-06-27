package com.community.dao;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.Community;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class CommunityDAOTest {
	
	@Autowired
	private CommunityDAO communityDAO;

	@Test
	public void testInsert() {
		Community community=new Community();
		community.setName("英语协会");
		community.setType("实践类");
		community.setCollege("外语学院");
		community.setBuilder("赵六");
		community.setPhone(13133660953L);
		community.setIntroduce("英语协会以提高同学们的英语学习兴趣和学习水平为己任，" +
				"营造良好的英语学习氛围，寓学于乐，有效的提高会员以及英语爱好者的英语交际能力，" +
				"营造浓厚的英语学习氛围，树立良好的校风，提高广大会员及英语爱好者的英语能力和素质是英协的宗旨。同时英协一直为活跃校园的英语学习气氛和激发学生对英语学习的趣而努力，" +
				"为广大的学子提供了一个学习英语、提高英语的平台，同时我们也举办各种英语活动，也为大家提供了一个展现自我的舞台，在这里你可以尽情地说,尽情听,尽情唱，尽情跳，尽情地享受英语学习所带来的乐趣！" +
				"在这里，我们在学习中玩耍，在玩耍中学习，在这里，我们为你装上一双隐形的翅膀，让大家乘着隐形的翅膀自由的翱翔在蔚蓝的天空！让大家飞地更高，飞地更远！" +
				"为广大英语爱好者提供一个学习、交流、交友的平台，营造了浓厚的学习氛围，既展示了热爱学习、热爱英语的风采，又丰富了我们的校园生活。同时，相信英协的明天将会更加美好！");
		community.setCreateTime(new Date(2017-1-1));
		community.setNum(0);
		if (communityDAO.insert(community)>0) {
			System.out.println("添加成功");
		} else {
			System.out.println("添加失败");
		}
	}

	@Test
	public void testDelete() {
		communityDAO.delete(20);
	}

	@Test
	public void testQueryAll() {
		List<Community> list=communityDAO.queryAll(0, 5);
		if (list!=null) {
			for(Community community:list){
				System.out.println(community.toString());
			}
		}
	}

	@Test
	public void testQueryWithType() {
		
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
