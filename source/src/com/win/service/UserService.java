package com.win.service;

import com.win.po.User;

/*
 * 普通用户登录方法接口
 */
public interface UserService {
	
	public User findUser(String username, String password);
}
