package com.win.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.win.po.Teachercost;
import com.win.po.Teacherplace;
import com.win.po.Teachertraffic;
import com.win.po.Teachertype;
import com.win.po.Teacheryearcost;
import com.win.service.TeacherService;
/*
 * 教师分析controller类
 */
@Controller
public class TeacherController {
	//依赖注入
	@Autowired
	private TeacherService teacherService;
	
	//1、消费类别XFLB占比
	@RequestMapping(value = "/getTeachertype.action")
	@ResponseBody
	public List<Teachertype> teachertypeForList(Model model){
		List<Teachertype> teachertypeForList = teacherService.teachertypeForList();
		model.addAttribute(teachertypeForList);
		return teachertypeForList;
	}
	
	//2、最受教职工欢迎的场所，SHMC（top8）
	@RequestMapping(value = "/getTeacherplace.action")
	@ResponseBody
	public List<Teacherplace> teacherplaceForList(Model model){
		List<Teacherplace> teacherplaceForList = teacherService.teacherplaceForList();
		model.addAttribute(teacherplaceForList);
		return teacherplaceForList;
	}
	
	//3、19年，教职工的月均消费
	@RequestMapping(value = "/getTeachercost.action")
	@ResponseBody
	public List<Teachercost> teachercostForList(Model model){
		List<Teachercost> teachercosts = teacherService.teachercostForList();
		model.addAttribute(teachercosts);
		return teachercosts;
	}
	
	//4、老师年消费总额、年均消费
	@RequestMapping(value = "/getTeacheryearcost.action")
	@ResponseBody
	public List<Teacheryearcost> teacheryearcostForList(){
		List<Teacheryearcost> teacheryearcosts = teacherService.teacheryearcostForList();
		return teacheryearcosts;
	}
	
	//5、近几年老师在交通消费类型方面的趋势
	@RequestMapping(value = "/getTeachertraffic.action")
	@ResponseBody
	public List<Teachertraffic> teachertrafficForList(){
		List<Teachertraffic> teachertraffics = teacherService.teachertrafficForList();
		return teachertraffics;
 	}
	
}
