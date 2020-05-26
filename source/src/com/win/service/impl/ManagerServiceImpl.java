package com.win.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.win.dao.ManagerDao;
import com.win.po.Manager;
import com.win.service.ManagerService;
/*
 * 管理员登录
 */
@Service("managerService")
@Transactional
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private ManagerDao managerDao;
	
	@Override
	public Manager findManager(String username, String password) {
		// TODO Auto-generated method stub
		Manager manager = this.managerDao.findManager(username, password);
		return manager;
	}

}
