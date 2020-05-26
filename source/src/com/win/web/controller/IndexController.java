package com.win.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.win.po.Studenttype;
import com.win.po.Tbcanteen;
import com.win.po.Tbkind;
import com.win.po.Tbmoney;
import com.win.po.Tbshmc;
import com.win.po.Tbshop;
import com.win.po.Tbseason;
import com.win.po.Tbtype;
import com.win.service.IndexService;
/*
 * 首页controller类
 */
@Controller
public class IndexController {
	//依赖注入
	@Autowired
	private IndexService indexService;
	
	//最受师生欢迎的消费地点top15（师生消费最多的场所）SHMC
	@RequestMapping(value = "/getPlace.action")
	@ResponseBody
	public List<Tbshmc> placeForList(Model model){
		List<Tbshmc> placeForList = indexService.shmcForList();
		model.addAttribute(placeForList);
		return placeForList;
	}
	
	//各类消费类别（XFLB）占比
	@RequestMapping(value = "/getXflbType.action")
    @ResponseBody
	public List<Tbtype> XflbForList(Model model){
		List<Tbtype> xflbForList = indexService.xflbForList();
		//System.out.println(xflbForList);
		model.addAttribute(xflbForList);
		return xflbForList; 
	}
	
	//各类交易类型（JYLX）占比
	@RequestMapping(value="/getKind.action")
	@ResponseBody
	public List<Tbkind> kindForList(Model model){
		List<Tbkind> kindForList = indexService.kindForList();
		model.addAttribute(kindForList);
		return kindForList;
	}
	
	//2018学年各季度消费人流量占比
	@RequestMapping(value="/getSeason.action")
	@ResponseBody
	public List<Tbseason> seasonForList(Model model){
		List<Tbseason> seasonForList = indexService.seasonForList();
		model.addAttribute(seasonForList);
		return seasonForList;
	}
	
	//2015-2019五年内的消费总金额
	@RequestMapping(value="/getMoney.action")
	@ResponseBody
	public List<Tbmoney> moneyForList(Model model){
		List<Tbmoney> moneyForList = indexService.moneyForList();
		model.addAttribute(moneyForList);
		return moneyForList;
	}
	
	//平均营业额 top10的商户
	@RequestMapping(value="/getAvgcost.action")
	@ResponseBody
	public List<Tbshmc> avgcostForList(Model model){
		List<Tbshmc> avgcostForList = indexService.avgcostForList();
		model.addAttribute(avgcostForList);
		return avgcostForList;
	}
	
	//2019年各个饭堂的人流量
	@RequestMapping(value="/getCanteenpeople.action")
	@ResponseBody
	public List<Tbcanteen> tbcanteens(Model model){
		List<Tbcanteen> tbcanteens = indexService.canteenPeople();
		model.addAttribute(tbcanteens);
		return tbcanteens;
	}
	
	//小卖部类型商户2019年10月的日营业额走势
	@RequestMapping(value = "/getShopcost.action")
	@ResponseBody
	public List<Map<String, Object>>  queryShopcost(){
		List<Tbshop> shmc = indexService.shmcnameForList();
		List<Tbshop> jyrq = indexService.jyrqForList();
		List<Tbshop> supermarket = indexService.supermarketForList();
		List<Tbshop> fruit = indexService.fruitForList();
		List<Tbshop> store = indexService.storeForList();
		Map<String, Object> result = new HashMap<>();
		List<Map<String, Object>> listMap=new ArrayList<Map<String,Object>>(); 
		result.put("shmc", shmc);
		result.put("jyrq", jyrq);
		result.put("supermarket", supermarket);
		result.put("fruit", fruit);
		result.put("store", store);
		listMap.add(result);
		return listMap;
	}

}
