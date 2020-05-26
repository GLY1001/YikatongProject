package com.win.web.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.common.utils.Page;
import com.win.po.Commonuser;
import com.win.service.ManageruserService;

import sun.misc.Perf.GetPerfAction;
/*
 * 管理员查询学生消费信息controller类
 */
@Controller
public class ManageruserController {
	@Autowired
	private ManageruserService manageruserService;
	
	/*
	 * 按xm、 sfrzh查询消费信息列表
	 */
	@RequestMapping(value = "/getStudentByXmAndSfrzh.action", method = RequestMethod.GET)
	public String listSfrzm(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="15")Integer rows, Model model, HttpServletRequest request){
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String xm = request.getParameter("xm");
		String sfrzh = request.getParameter("sfrzh");
		//条件查询所有消费信息
		Page<Commonuser> commonusers = manageruserService.findCommonuserByXmAndSfrzh(page, rows, sfrzh);
		model.addAttribute("page", commonusers);
		return "search";
	}

}
