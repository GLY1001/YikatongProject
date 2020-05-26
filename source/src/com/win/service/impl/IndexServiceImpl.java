package com.win.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.win.dao.IndexDao;
import com.win.po.Tbcanteen;
import com.win.po.Tbkind;
import com.win.po.Tbmoney;
import com.win.po.Tbshmc;
import com.win.po.Tbshop;
import com.win.po.Tbseason;
import com.win.po.Tbtype;
import com.win.service.IndexService;
/*
 * 首页
 */
@Service("tbplaceService")
@Transactional
public class IndexServiceImpl implements IndexService{
	@Autowired
	private IndexDao indexDao;
	
	//最受师生欢迎的消费地点top15（师生消费最多的场所）SHMC
	@Override
	public List<Tbshmc> shmcForList() {
		// TODO Auto-generated method stub
		return indexDao.shmcForList();
	}
	
	//各类消费类别（XFLB）占比
	@Override
	public List<Tbtype> xflbForList() {
		// TODO Auto-generated method stub
		return indexDao.xflbForList();
	}
	
	//各类交易类型（JYLX）占比
	@Override
	public List<Tbkind> kindForList() {
		// TODO Auto-generated method stub
		return indexDao.kindForList();
	}
	
	//2018学年各季度消费人流量占比
	@Override
	public List<Tbseason> seasonForList() {
		// TODO Auto-generated method stub
		return indexDao.seasonForList();
	}
	
	//2015-2019五年内的消费总金额
	public List<Tbmoney> moneyForList() {
		// TODO Auto-generated method stub
		return indexDao.moneyForList();
	}
	
	//平均营业额 top10的商户
	public List<Tbshmc> avgcostForList() {
		// TODO Auto-generated method stub
		return indexDao.avgcostForList();
	}
	
	//2019年各个饭堂的人流量
	@Override
	public List<Tbcanteen> canteenPeople() {
		// TODO Auto-generated method stub
		return indexDao.canteenPeople();
	}
	
	//小卖部类型商户2019年10月的日营业额走势
	@Override
	public List<Tbshop> shmcnameForList() {
		// TODO Auto-generated method stub
		return indexDao.shmcnameForList();
	}
	@Override
	public List<Tbshop> jyrqForList() {
		// TODO Auto-generated method stub
		return indexDao.jyrqForList();
	}
	@Override
	public List<Tbshop> supermarketForList() {
		// TODO Auto-generated method stub
		return indexDao.supermarketForList();
	}
	@Override
	public List<Tbshop> fruitForList() {
		// TODO Auto-generated method stub
		return indexDao.fruitForList();
	}
	@Override
	public List<Tbshop> storeForList() {
		// TODO Auto-generated method stub
		return indexDao.storeForList();
	}
}
