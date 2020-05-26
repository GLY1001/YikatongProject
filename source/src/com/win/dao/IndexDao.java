package com.win.dao;

import java.util.List;

import com.win.po.Tbcanteen;
import com.win.po.Tbkind;
import com.win.po.Tbmoney;
import com.win.po.Tbseason;
import com.win.po.Tbshmc;
import com.win.po.Tbshop;
import com.win.po.Tbtype;

public interface IndexDao {
	public List<Tbshmc> shmcForList(); //最受师生欢迎的消费地点top15（师生消费最多的场所）SHMC
	
	public List<Tbtype> xflbForList(); //各类消费类别（XFLB）占比
	
	public List<Tbkind> kindForList(); //各类交易类型（JYLX）占比
	
	public List<Tbseason> seasonForList(); //2018学年各季度消费人流量占比
	
	public List<Tbmoney> moneyForList(); //2015-2019五年内的消费总金额
	
	public List<Tbshmc> avgcostForList(); //平均营业额 top10的商户
	
	public List<Tbcanteen> canteenPeople(); //2019年各个饭堂的人流量
	
	//小卖部类型商户2019年10月的日营业额走势
	public List<Tbshop> shmcnameForList(); //shmc
	
	public List<Tbshop> jyrqForList(); //jyrq
	
	public List<Tbshop> supermarketForList(); //南海启航教学超市
	
	public List<Tbshop> fruitForList(); //南海语晨水果便利店 
	
	public List<Tbshop> storeForList(); //轻院快乐惠小卖部
}
