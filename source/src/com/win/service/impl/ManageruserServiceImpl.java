package com.win.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.common.utils.Page;
import com.win.dao.ManageruserDao;
import com.win.po.Commonuser;
import com.win.service.ManageruserService;
/*
 * 管理员查询学生消费信息页面
 */
@Service("manageruserService")
@Transactional
public class ManageruserServiceImpl implements ManageruserService{
	@Autowired
	private ManageruserDao manageruserDao;
	
	@Override
	public Page<Commonuser> findCommonuserByXmAndSfrzh(Integer page, Integer rows, String sfrzh) {
		// TODO Auto-generated method stub
		// 创建finaldata对象
		Commonuser commonuser = new Commonuser();
		//当前页
		commonuser.setStart((page-1)*rows);
		//每页数
		commonuser.setRows(rows);
		if (StringUtils.isNotBlank(sfrzh)) {
			commonuser.setSfrzh(sfrzh);
		}
		//查询消费信息列表
		List<Commonuser> commonusers = manageruserDao.selectCommonuserByXmAndSfrzh(commonuser);
		//查询消费信息记录条数
		Integer count = manageruserDao.selectCommonuserCount(commonuser);
		//创建Page返回对象
		Page<Commonuser> result = new Page<>();
		result.setPage(page);
		result.setRows(commonusers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

}
