package com.win.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.win.dao.UserDao;
import com.win.po.User;
import com.win.service.UserService;

/*
 * 普通用户登录
 */

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	
	//依赖注入
	@Autowired
	private UserDao userDao;
	
	//实现UserService的接口
	public User findUser(String username, String password) {
		User user = this.userDao.findUser(username, password);
		return user;
	}
	
}
