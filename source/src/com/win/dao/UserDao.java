package com.win.dao;
import org.apache.ibatis.annotations.Param;
import com.win.po.User;
/*
 * 普通用户Dao
 */
public interface UserDao {
	//通过账号和密码查询用户
	public User findUser(@Param("username") String username, 
			@Param("password") String password);
}