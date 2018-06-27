package com.community.service;

import java.util.List;

import com.community.entity.News;
import com.community.entity.Pager;

public interface NewsService {
	public boolean addNews(News news);
	public boolean deleteNews(int newsId);
	public List<News> getByCommunity(int cId,String type);
	public Pager<News> getAllByType(String type,int pageNo,int pageSize);
	public Pager<News> getAll(String writer,int pageNo,int pageSize);
	public List<News> getByType(String type);
	public boolean updateNews(News news);
	public int  newsCount(String type);
	public int  newsCountAll();
	public News  getByNewsId(int newsId);
	
}
