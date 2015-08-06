package com.logistics.service.impl;

import com.logistics.dao.IUserDao;
import com.logistics.domain.User;
import com.logistics.service.IUserService;

public class UserServiceImpl implements IUserService{

	private IUserDao userDao;
	
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	

	public IUserDao getUserDao() {
		return userDao;
	}


	@Override
	public boolean add(User user) {
		// TODO Auto-generated method stub
		return this.userDao.insert(user) != null ? true :false;
	}

	

}
