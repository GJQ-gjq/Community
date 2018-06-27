package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.entity.User;

public interface UserDAO {
	/**
	 * 添加
	 * @param user
	 */
	public int insertUser(User user);
	/**
	 * 根据学号密码查询
	 * @param userId
	 * @param password
	 * @return
	 */
	public User queryByUserIdAndPsw(@Param("userId")String  userId,@Param("password")String password);
	/**
	 * 根据学号查询
	 * @param userId
	 * @return
	 */
	public List<User> queryByUserId(String userId);
	public User queryByTel(long tel);
	/**
	 * 查询列表
	 * @return
	 */
	public List<User> queryAllUser();
	/**
	 * 根据学号修改
	 * @param userId
	 * @return
	 */
	public int updateByUserId(User user);
	/**
	 * 根据学号修改密码
	 * @param user
	 * @return
	 */
	public int updatePassword(@Param("userId")String userId,@Param("password")String password);
	/**
	 * 删除用户
	 * @param uId
	 * @return
	 */
	public int deleteUser(int uId);
	public int updatePower(String  userId);
}
