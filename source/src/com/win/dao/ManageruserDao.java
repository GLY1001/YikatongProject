package com.win.dao;

import java.util.List;

import com.win.po.Commonuser;

public interface ManageruserDao {
	//按xm、sfrzh查询消费信息列表
	public List<Commonuser> selectCommonuserByXmAndSfrzh(Commonuser commonuser);
	
	//消费信息记录条数
	public Integer selectCommonuserCount(Commonuser commonuser);
}
