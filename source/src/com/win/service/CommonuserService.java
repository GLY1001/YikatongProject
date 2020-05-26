package com.win.service;

import java.util.List;

import com.itheima.common.utils.Page;
import com.win.po.Commonuser;
/*
 * 普通用户个人信息页
 */
public interface CommonuserService {
	//查xflb
	public List<Commonuser> findCommonuserByXflb(String sfrzh);
	
	//查shmc
	public List<Commonuser> findCommonuserByShmc(String sfrzh);
	
	//查seven
	public List<Commonuser> findCommonuserBySeven(String sfrzh);
	
	// 按sfrzh查询消费信息列表
	public Page<Commonuser> findCommonuserBySfrzh(Integer page, Integer rows, String sfrzh);
	
	// 按jyrq查询消费信息列表
	public Page<Commonuser> findCommonuserByJyrq(Integer page, Integer rows, String sfrzh, String first, String second);
	
}
