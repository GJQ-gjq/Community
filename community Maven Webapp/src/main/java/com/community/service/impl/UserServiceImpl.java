package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.UserDAO;
import com.community.entity.User;
import com.community.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	 /**
     * 注入service依赖
     */
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public User login(String userId, String password) {
		return userDAO.queryByUserIdAndPsw(userId, password);
	}

	@Override
	public boolean register(User user) {
		if(userDAO.insertUser(user)>0){
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<User> getUserById(String userId) {
		return userDAO.queryByUserId(userId);
	}

	@Override
	public List<User> getAllUsers() {
		return userDAO.queryAllUser();
	}

	@Override
	public boolean updateUser(User user) {
		if(userDAO.updateByUserId(user)>0){
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean updatePassword(String userId, String password) {
		if(userDAO.updatePassword(userId, password)>0){
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteUser(int uId) {
		if(userDAO.deleteUser(uId)>0){
			return true;
		}else {
			return false;
		}
	}

	@Override
	public User getUserBytel(long tel) {
		return userDAO.queryByTel(tel);
	}

}
