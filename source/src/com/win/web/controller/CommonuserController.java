package com.win.web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.ObjectUtils.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.itheima.common.utils.Page;
import com.sun.org.apache.regexp.internal.recompile;
import com.win.po.Commonuser;
import com.win.po.User;
import com.win.service.CommonuserService;
/*
 * 普通用户的个人信息页controller类
 */
@Controller
public class CommonuserController {
	//依赖注入
	@Autowired
	private CommonuserService commonuserService;
	
	//查xflb
	@RequestMapping(value = "/getCommonuserByXflb.action")
	@ResponseBody
	public List<Commonuser> listXflb(HttpServletRequest request){
		String sfrzh = (String) request.getSession().getAttribute("sfrzh");
		List<Commonuser> xflbs = commonuserService.findCommonuserByXflb(sfrzh);
		return xflbs;
	}
	
	//查shmc
	@RequestMapping(value = "/getCommonuserByShmc.action")
	@ResponseBody
	public List<Commonuser> listShmc(HttpServletRequest request){
		String sfrzh = (String) request.getSession().getAttribute("sfrzh");
		List<Commonuser> shmcs = commonuserService.findCommonuserByShmc(sfrzh);
		return shmcs;
	}
	
	//查seven
	@RequestMapping(value = "/getCommonuserBySeven.action")
	@ResponseBody
	public List<Commonuser> listSeven(HttpServletRequest request){
		String sfrzh = (String) request.getSession().getAttribute("sfrzh");
		List<Commonuser> sevens = commonuserService.findCommonuserBySeven(sfrzh);
		return sevens;
	}
	
	/*
	 * 按sfrzh查询消费信息列表
	 */
	@RequestMapping(value = "/getCommonuserBySfrzh.action")
	public String listSfrzm(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows, Model model, HttpServletRequest request){
		
		String sfrzh = (String) request.getSession().getAttribute("sfrzh");
		//条件查询所有消费信息
		Page<Commonuser> commonusers = commonuserService.findCommonuserBySfrzh(page, rows, sfrzh);
		model.addAttribute("page", commonusers);
		return "commonuser";
	}
	/*
	 * 按jyrq查询消费信息列表
	 */
	@RequestMapping(value = "/getCommonuserByJyrq.action")
	public String listJyrq(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows, Model model, HttpServletRequest request){
		
		String sfrzh = (String) request.getSession().getAttribute("sfrzh");
		String first = request.getParameter("first");
		String second = request.getParameter("second");
		System.out.println("sfrzh:"+sfrzh+", jyrq:"+first+second);
		//条件查询所有消费信息
		String submit = request.getParameter("btn");
		if(submit.equals("byjyrq")){
			Page<Commonuser> commonusers = commonuserService.findCommonuserByJyrq(page, rows, sfrzh, first, second);
			model.addAttribute("page", commonusers);
		}else if(submit.equals("all")) {
			Page<Commonuser> all = commonuserService.findCommonuserBySfrzh(page, rows, sfrzh);
			model.addAttribute("page", all);
		}
		
		return "commonuser";
	}
	
}
