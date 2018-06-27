package com.community.service;

import java.util.List;

import com.community.entity.Admin;

public interface AdminService {
	/**
	 * 管理员登录
	 * @param adminName
	 * @param adminPassword
	 * @return
	 */
	public Admin login(String adminName,String adminPassword);
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	public boolean register(Admin admin);
	/**
	 * 修改密码
	 * @param adminId
	 * @param adminPassword
	 * @return
	 */
	public boolean updatePassword(int adminId,String adminPassword);
	/**
	 * 删除
	 * @param adminId
	 * @return
	 */
	public boolean delete(int adminId);
	/**
	 * 根据管理员名称查找
	 * @param adminName
	 * @return
	 */
	public List<Admin> getAdmin(String adminName);
	/**
	 * 查询所有管理员
	 * @return
	 */
	public List<Admin> getAllAdmins();
}
