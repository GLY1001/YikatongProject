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

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.win.po.Studentavgcost;
import com.win.po.Studentcost;
import com.win.po.Studentnet;
import com.win.po.Studentnewcost;
import com.win.po.Studentst;
import com.win.po.Studenttype;
import com.win.service.StudentService;
/*
 * 学生分析页面controller类
 */
@Controller
public class StudentController{
	//依赖注入
	@Autowired
	private StudentService studentService;
	
	//1、不同年级学生用网情况（XTMC=软网关）
	@RequestMapping(value = "/getStudentnet.action")
	@ResponseBody
	public List<Studentnet> studentnetForList(Model model){
		List<Studentnet> studentnets = studentService.studentnetForList();
		model.addAttribute(studentnets);
		return studentnets;
	}
	
	//2、不同年级学生的平均消费水平(jyje)
	@RequestMapping(value = "/getStudentcost.action")
	@ResponseBody
	public List<Studentcost> studentcostForList(Model model){
		List<Studentcost> studentcosts = studentService.studentcostForList();
		model.addAttribute(studentcosts);
		return studentcosts;
	}
	
	//3、不同年级学生消费类别（XFLB）占比
	@RequestMapping(value = "/getStudenttype.action")
	@ResponseBody
	public List<Map<String, Object>>  queryStudenttype(){
		List<Studenttype> grade = studentService.gradeForList();
		List<Studenttype> xflb = studentService.xflbForList();	
		List<Studenttype> six = studentService.gradeSixForList();
		List<Studenttype> seven = studentService.gradeSevenForList();
		List<Studenttype> eight = studentService.gradeEightForList();
		List<Studenttype> nine =studentService.gradeNineForList();
		Map<String, Object> result = new HashMap<>();
		List<Map<String, Object>> listMap=new ArrayList<Map<String,Object>>(); 
		result.put("grade", grade);
		result.put("xflb", xflb);
		result.put("six", six);
		result.put("seven", seven);
		result.put("eight", eight);
		result.put("nine", nine);
		listMap.add(result);
		return listMap;
	}
	
	//4、南海一饭饭堂，不同年级的消费占比
    //5、南海实训饭堂，不同年级的消费占比	
	@RequestMapping(value = "/getStudentone.action")
	@ResponseBody
	public List<Studentst> studentone(){
		List<Studentst> studentone = studentService.studentoneForList();
		return studentone;
	}
	@RequestMapping(value = "/getStudenttwo.action")
	@ResponseBody
	public List<Studentst> studenttwo(){
		List<Studentst> studenttwo = studentService.studenttwoForList();
		return studenttwo;
	}
	
	//6、低于平均消费水平的学生之中不同年级之间的占比
	@RequestMapping(value = "/getStudentavgcost.action")
	@ResponseBody
	public List<Studentavgcost> studentavgcostForList(){
		List<Studentavgcost> studentavgcosts = studentService.studentavgcostForList();
		return studentavgcosts;
	}
	
	//7、学生近几年的消费情况
	@RequestMapping(value = "/getStudentyearcost.action")
	@ResponseBody
	public List<Studentnewcost> yearcostForList(){
		List<Studentnewcost> studentyearcosts = studentService.yearcostForList();
		return studentyearcosts;
	}
	
	//8、19年的月总额和月均消费情况
	@RequestMapping(value = "/getStudentmonthcost.action")
	@ResponseBody
	public List<Studentnewcost> monthcostForList(){
		List<Studentnewcost> studentmonthcosts = studentService.monthcostForList();
		return studentmonthcosts;
	}
	
	
}
