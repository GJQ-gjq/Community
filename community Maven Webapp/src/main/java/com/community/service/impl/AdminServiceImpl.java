package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.AdminDAO;
import com.community.entity.Admin;
import com.community.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public Admin login(String adminName, String adminPassword) {
		return adminDAO.queryByNameAndPsw(adminName, adminPassword);
	}

	@Override
	public boolean register(Admin admin) {
		if (adminDAO.insert(admin)>0) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public boolean updatePassword(int adminId, String adminPassword) {
		if (adminDAO.updatePassword(adminId, adminPassword)>0) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public boolean delete(int adminId) {
		if(adminDAO.delete(adminId)>0){
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public List<Admin> getAdmin(String adminName) {	
		return adminDAO.queryByName(adminName);
	}

	@Override
	public List<Admin> getAllAdmins() {		
		return adminDAO.queryAll();
	}

}
