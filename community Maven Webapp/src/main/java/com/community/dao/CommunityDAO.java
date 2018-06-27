package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.entity.Community;

public interface CommunityDAO {
	/**
	 * 添加社团
	 * @param community
	 * @return
	 */
	public int insert(Community community);
	/**
	 * 删除社团
	 * @param id
	 * @return
	 */
	public int delete(int  id);
	/**
	 * 查询所有社团
	 * @return
	 */
	public List<Community> queryAll(@Param("offset") int offset, @Param("pageSize") int pageSize);
	/**
	 * 根据手机号查询
	 * @param phone
	 * @return
	 */
	public Community querySingleWithPhone(Long phone);
	/**
	 * 根据社团名字查询
	 * @param name
	 * @return
	 */
	public Community querySingleWithName(String name);
	/**
	 * 根据name分页查询社团
	 * @return
	 */
	public List<Community> queryWithName(@Param("name")String  name,@Param("offset") int offset, @Param("pageSize") int pageSize);	
	/**
	 * 根据type分页查询社团
	 * @return
	 */
	public List<Community> queryWithType(@Param("type")String  type,@Param("offset") int offset, @Param("pageSize") int pageSize);
	/**
	 * 根据college分页查询社团
	 * @return
	 */
	public List<Community> queryWithCollege(@Param("college")String  college,@Param("offset") int offset, @Param("pageSize") int pageSize);
	/**
	 * 根据id查询社团
	 * @return
	 */
	public Community queryWithId(int  id);
	/**
	 * 修改社团
	 * @param community
	 * @return
	 */
	public int update(Community community);
	/**
	 * 更新社团人数
	 * @param num
	 * @return
	 */
	public int updateNum(String clubName);
	/**
	 * 查询所有社团数量
	 * @return
	 */
	public int countAll();
	/**
	 * 根据type查询社团数量
	 * @return
	 */
	public int countType(String type);
	/**
	 * 根据name查询社团数量
	 * @return
	 */
	public int countName(String name);
	/**
	 * 根据college查询社团数量
	 * @return
	 */
	public int countCollege(String college);
}
