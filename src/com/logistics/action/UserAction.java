package com.logistics.action;

import com.logistics.domain.User;
import com.logistics.service.IUserService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends BaseAction implements ModelDriven<User> {

	private User user;
	private IUserService userService;
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return this.user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public String add() throws Exception{
		boolean flag = this.userService.add(user);
		return flag? Action.SUCCESS : Action.ERROR;
		
	}
	

}
