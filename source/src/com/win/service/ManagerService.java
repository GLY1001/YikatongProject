package com.win.service;

import com.win.po.Manager;
/*
 * 管理员登录
 */
public interface ManagerService {
	
	public Manager findManager(String username, String password);
}
