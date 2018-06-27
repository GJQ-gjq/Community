package com.community.service.impl;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.NewsDAO;
import com.community.entity.News;
import com.community.entity.Pager;
import com.community.service.NewsService;
@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsDAO newsDAO;
	@Override
	public boolean addNews(News news) {	
		if (newsDAO.insert(news)>0) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public boolean deleteNews(int newsId) {
		if (newsDAO.delete(newsId)>0) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public List<News> getByCommunity(int cId, String type) {		
		return newsDAO.queryByCommunity(cId, type);
	}


	@Override
	public List<News> getByType(String type) {
		String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式
		List<News> newslist1=newsDAO.queryByType(type);
		String content=newslist1.get(0).getContent();
		Pattern p_html = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);
		Matcher m_html = p_html.matcher(content);
		String s1 = m_html.replaceAll(""); //过滤html标签
		String s2=s1.replaceAll("&nbsp;", "").replaceAll(" ", "");
		if(s2.length()>145){
			String s3=s2.substring(0, 145);
			newslist1.get(0).setContent(s3);
		}else {
			newslist1.get(0).setContent(s2);
		}
		type="news";
		List<News> newslist2=newsDAO.queryByType(type);
		String content2=newslist2.get(0).getContent();
		Matcher m_html1 = p_html.matcher(content2);
		String s4 = m_html1.replaceAll(""); //过滤html标签
		String s5=s4.replaceAll("&nbsp;", "").replaceAll(" ", "");
		if(s5.length()>145){
			String s6=s5.substring(0, 145);
			newslist2.get(0).setContent(s6);	
		}else {
			newslist2.get(0).setContent(s5);
		}
		for (News news : newslist2) {
			newslist1.add(news);
		}
		return newslist1;
	}

	@Override
	public boolean updateNews(News news) {
		if(newsDAO.update(news)>0){
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public Pager<News> getAllByType(String type, int pageNo, int pageSize) {
		Pager<News> result=null;
		
		int offset=(pageNo-1)*pageSize;
		List<News> newsList=newsDAO.queryAllByType(type, offset, pageSize);
		// 获取总记录数
		int totalRecord=newsDAO.newsCount(type);
		//获取总页数
		int totalPage = totalRecord / pageSize;
		if(totalRecord % pageSize !=0){
			totalPage++;
		}
		int currentPage=pageNo;
		result=new Pager<News>(pageSize, currentPage, totalRecord, totalPage, newsList);
		return result;
	}

	@Override
	public int newsCount(String type) {
		return newsDAO.newsCount(type);
	}

	@Override
	public News getByNewsId(int newsId) {		
		return newsDAO.queryByNewsId(newsId);
	}

	@Override
	public Pager<News> getAll(String writer,int pageNo, int pageSize) {
		Pager<News> result=null;
		int offset=(pageNo-1)*pageSize;
		if(writer!=null&&writer!=""){
			List<News> newsList=newsDAO.queryAllByWriter(writer, offset, pageSize);
			int totalRecord=newsDAO.newsCountWriter(writer);
			int totalPage = totalRecord / pageSize;
			if(totalRecord % pageSize !=0){
				totalPage++;
			}
			int currentPage=pageNo;
			result=new Pager<News>(pageSize, currentPage, totalRecord, totalPage, newsList);
			return result;
		}
		List<News> newsList=newsDAO.queryAll(offset, pageSize);
		// 获取总记录数
		int totalRecord=newsDAO.newsCountAll();
		//获取总页数
		int totalPage = totalRecord / pageSize;
		if(totalRecord % pageSize !=0){
			totalPage++;
		}
		int currentPage=pageNo;
		result=new Pager<News>(pageSize, currentPage, totalRecord, totalPage, newsList);
		return result;
	}

	@Override
	public int newsCountAll() {
		return newsDAO.newsCountAll();
	}

}
