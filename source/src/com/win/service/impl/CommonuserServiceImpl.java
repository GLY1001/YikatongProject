package com.win.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.common.utils.Page;
import com.win.dao.CommonuserDao;
import com.win.po.Commonuser;
import com.win.service.CommonuserService;

import sun.security.krb5.internal.PAEncTSEnc;
/*
 * 普通用户的个人信息页
 */
@Service("finaldataService")
@Transactional
public class CommonuserServiceImpl implements CommonuserService{
	
	//声明dao属性并注入
	@Autowired
	private CommonuserDao commonuserDao;
	
	//查xflb
	public List<Commonuser> findCommonuserByXflb(String sfrzh) {
		// TODO Auto-generated method stub
		return commonuserDao.selectCommonuserByXflb(sfrzh);
	}

	//查shmc
	public List<Commonuser> findCommonuserByShmc(String sfrzh) {
		// TODO Auto-generated method stub
		return commonuserDao.selectCommonuserByShmc(sfrzh);
	}

	//查seven
	public List<Commonuser> findCommonuserBySeven(String sfrzh) {
		// TODO Auto-generated method stub
		return commonuserDao.selectCommonuserBySeven(sfrzh);
	}
	
	//按sfrzh查询消费信息列表
	public Page<Commonuser> findCommonuserBySfrzh(Integer page, Integer rows, String sfrzh) {
		// 创建finaldata对象
		Commonuser commonuser = new Commonuser();
		if (StringUtils.isNotBlank(sfrzh)) {
			commonuser.setSfrzh(sfrzh);
		}
		//当前页
		commonuser.setStart((page-1)*rows);
		//每页数
		commonuser.setRows(rows);
		//查询消费信息列表
		List<Commonuser> commonusers = commonuserDao.selectCommonuserBySfrzh(commonuser);
		//查询消费信息记录条数
		Integer count = commonuserDao.selectCommonuserCount(commonuser);
		//创建Page返回对象
		Page<Commonuser> result = new Page<>();
		result.setPage(page);
		result.setRows(commonusers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	
	//按jyrq查询消费信息列表
	public Page<Commonuser> findCommonuserByJyrq(Integer page, Integer rows, String sfrzh, String first, String second) {
		// 创建finaldata对象
		Commonuser commonuser = new Commonuser();
		//当前页
		commonuser.setStart((page-1)*rows);
		//每页数
		commonuser.setRows(rows);
		if (StringUtils.isNotBlank(sfrzh)) {
			commonuser.setSfrzh(sfrzh);
		}
		if (StringUtils.isNotBlank(first)) {
			commonuser.setFirst(first);
		}
		if (StringUtils.isNotBlank(second)) {
			commonuser.setSecond(second);
		}
		//查询消费信息列表
		List<Commonuser> commonusers = commonuserDao.selectCommonuserByJyrq(commonuser);
		//查询消费信息记录条数
		Integer count = commonuserDao.selectCommonuserCount(commonuser);
		//创建Page返回对象
		Page<Commonuser> result = new Page<>();
		result.setPage(page);
		result.setRows(commonusers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

}
