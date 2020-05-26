package com.win.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.win.po.Commonuser;

public interface CommonuserDao {
	
	//查询xflb占比
	public List<Commonuser> selectCommonuserByXflb(String sfrzh);
	
	//查询shmc
	public List<Commonuser> selectCommonuserByShmc(String sfrzh);
	
	//查询最近七天
	public List<Commonuser> selectCommonuserBySeven(String sfrzh);
	
	//按sfrzh查询消费信息列表
	public List<Commonuser> selectCommonuserBySfrzh(Commonuser commonuser);
	
	//按jyrq查询消费信息列表
	public List<Commonuser> selectCommonuserByJyrq(Commonuser commonuser);
	
	//消费信息记录条数
	public Integer selectCommonuserCount(Commonuser commonuser);
}
