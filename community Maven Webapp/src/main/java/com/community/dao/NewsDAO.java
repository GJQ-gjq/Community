package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.entity.News;

public interface NewsDAO {
	/**
	 * 添加
	 * @param news
	 * @return
	 */
	public int insert(News news);
	/**
	 * 删除
	 * @param newsId
	 * @return
	 */
	public int delete(int newsId);
	/**
	 * 查询某个社团的新闻或公告
	 * @param name
	 * @return
	 */
	public List<News> queryByCommunity(@Param("cId")int cId,@Param("type")String type);
	/**
	 * 通过类别查询所有
	 * @param type
	 * @return
	 */
	public List<News> queryAllByType(@Param("type")String type,@Param("offset") int offset, @Param("pageSize") int pageSize);
	public List<News> queryAllByWriter(@Param("writer")String writer,@Param("offset") int offset, @Param("pageSize") int pageSize);
	public List<News> queryAll(@Param("offset") int offset, @Param("pageSize") int pageSize);
	/**
	 * 通过类别查询倒序7条
	 * @param type
	 * @return
	 */
	public List<News> queryByType(String type);
	/**
	 * 修改
	 * @param newsId
	 * @return
	 */
	public int update(News news);
	
	public int newsCount(String type);
	public int newsCountWriter(String writer);
	public int newsCountAll();	
	public News queryByNewsId(int newsId);
}
