package com.win.service;

import com.itheima.common.utils.Page;
import com.win.po.Commonuser;
/*
 * 管理员查询学生消费信息
 */
public interface ManageruserService {
	public Page<Commonuser> findCommonuserByXmAndSfrzh(Integer page, Integer rows, String sfrzh);
}
