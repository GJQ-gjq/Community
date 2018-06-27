package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.entity.Admin;

public interface AdminDAO {
	/**
	 * 添加
	 * @param admin
	 * @return
	 */
	public int  insert(Admin admin);
	/**
	 * 删除
	 * @param adminId
	 * @return
	 */
	public int  delete(int adminId);
	/**
	 * 根据adminId修改密码
	 * @param adminId
	 * @param admimPassword
	 * @return
	 */
	public int updatePassword(@Param("adminId")int adminId,@Param("adminPassword")String adminPassword);
	/**
	 * 查询列表
	 * @return
	 */
	public List<Admin> queryAll();
	/**
	 * 根据用户名和密码查找
	 * @param adminName
	 * @param admimPassword
	 * @return
	 */
	public Admin queryByNameAndPsw(@Param("adminName")String adminName,@Param("adminPassword")String adminPassword);
	/**
	 * 根据用户名查找
	 * @param adminName
	 * @return
	 */
	public List<Admin> queryByName(String adminName);
}
