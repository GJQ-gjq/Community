package com.community.dao;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.entity.News;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class NewsDAOTest {
	@Autowired
	private NewsDAO newsDAO;
	@Test
	public void testInsert() {
		News news=new News();
		news.setTitle("关于清明节放假期间学生社团相关工作的通知");
		news.setWriter("学生社团联合会");
		news.setContent("各学院团委、各校内学生社团：为加强学生社团的管理，确保清明节放假期间社团学生人身" +
				"安全以及公共财产安全，维护校园和谐稳定，现根据学校整体安排，对各学生社团作如下要求：一、清明" +
				"节假期期间以社团名义开展活动须向校团委申请，经批准后方可开展。" +
				"各社团不能以社团名义开展聚会、旅游、支教等集体外出活动；二、新闻媒体对学生社团进行采访报道须遵守学" +
				"校宣传工作的相关要求，学生社团事前须报党委宣传部审批；三、请学生社团注意防火防盗，在放假前检查活动场地和" +
				"办公室，确保门窗、水、电关好。请学生社团认真遵守《九江大学学生社团管理办法（试行）》的相关规定，增强安全防范意识" +
				"，严格遵守以上要求。请学院团委将相关工作要求及时传达给学生社团并做好在假期期间的服务和管理工作。");
		news.setType("公告");
		news.setcId(1);
		news.setCreatTime(new Date());
		if (newsDAO.insert(news)>0) {
			System.out.println("添加成功");
		} else {
			System.out.println("添加失败");
		}
	}

	@Test
	public void testDelete() {
		int newsId=2;
		if (newsDAO.delete(newsId)>0) {
			System.out.println("删除成功");
		}
	}

	@Test
	public void testQueryByCommunity() {
		int cId=1;
		String type="新闻";
		List<News> newslist=newsDAO.queryByCommunity(cId, type);
		if(newslist!=null){
			for (News news : newslist) {
				System.out.println(news.toString());
			}
		}
	}
	@Test
	public void testQueryAllByType() {
		String type="新闻";
		int offset=0;
		int limit=4;
		List<News> newslist=newsDAO.queryAllByType(type, offset, limit);
		int count=newsDAO.newsCount(type);
		if (newslist!=null) {
			for (News news : newslist) {
				System.out.println(news.getNewsId()+","+news.getTitle());
			}
			System.out.println(count);
		}
	}

	@Test
	public void testQueryByType() {
		String type="新闻";
		List<News> newslist=newsDAO.queryByType(type);
		String content=newslist.get(0).getContent();
		if(content.length()>145){
			String s=content.replaceAll(" ", "").substring(0, 145);
			newslist.get(0).setContent(s);
			System.out.println(s);
			System.out.println(newslist.get(0).getContent());
		}
	}

	@Test
	public void testUpdate() {
		News news=new News();
		news.setNewsId(13);
		news.setTitle("关于清明节放假期间学生社团相关工作的通知");
		news.setWriter("学生社团联合会");
		news.setContent("各学院团委、各校内学生社团：为加强学生社团的管理，确保清明节放假期间社团学生人身" +
				"安全以及公共财产安全，维护校园和谐稳定，现根据学校整体安排，对各学生社团作如下要求：一、清明" +
				"节假期期间以社团名义开展活动须向校团委申请，经批准后方可开展。" +
				"各社团不能以社团名义开展聚会、旅游、支教等集体外出活动；二、新闻媒体对学生社团进行采访报道须遵守学" +
				"校宣传工作的相关要求，学生社团事前须报党委宣传部审批；三、请学生社团注意防火防盗，在放假前检查活动场地和" +
				"办公室，确保门窗、水、电关好。请学生社团认真遵守《九江大学学生社团管理办法（试行）》的相关规定，增强安全防范意识" +
				"，严格遵守以上要求。请学院团委将相关工作要求及时传达给学生社团并做好在假期期间的服务和管理工作。");
		news.setType("新闻");
		news.setcId(1);
		news.setCreatTime(new Date());
		if (newsDAO.update(news)>0) {
			System.out.println("修改成功");
		} else {
			System.out.println("修改失败");
		}
	}

}
