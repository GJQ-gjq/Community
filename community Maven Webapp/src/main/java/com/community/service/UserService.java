package com.community.service;

import java.util.List;

import com.community.entity.User;

/**
 * 业务接口：站在"使用者"的角度设计接口
 * 三个方面：方法定义粒度，参数，返回类型(return类型/异常)
 */
public interface UserService {
	/**
	 * 用户登陆
	 * @param userId
	 * @param password
	 * @return
	 */
	public User login(String userId,String password);
	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	public boolean register(User user);
	/**
	 * 根据学号查询用户信息
	 * @param userId
	 * @return
	 */
	public List<User> getUserById(String userId);
	public User getUserBytel(long tel);
	/**
	 * 查询所有用户信息
	 * @return
	 */
	public List<User> getAllUsers();
	/**
	 * 根据学号修改用户信息
	 * @param user
	 * @return
	 */
	public boolean updateUser(User user);
	/**
	 * 根据学号修改密码
	 * @return
	 */
	public boolean updatePassword(String userId,String password);
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	public boolean deleteUser(int uId);
	
	
}
