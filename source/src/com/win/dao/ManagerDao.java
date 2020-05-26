package com.win.dao;

import org.apache.ibatis.annotations.Param;

import com.win.po.Manager;


public interface ManagerDao {
	/**
	 * 通过账号和密码查询用户
	 */
	public Manager findManager(@Param("username") String username, @Param("password") String password);
}
