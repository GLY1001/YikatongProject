package com.win.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.win.dao.TeacherDao;
import com.win.po.Teachercost;
import com.win.po.Teacherplace;
import com.win.po.Teachertraffic;
import com.win.po.Teachertype;
import com.win.po.Teacheryearcost;
import com.win.service.TeacherService;
/*
 * 教师分析页
 */
@Service("teachertypeService")
@Transactional
public class TeacherServiceImpl implements TeacherService{
	
	@Autowired
	private TeacherDao teacherDao;
	
	//1、消费类别XFLB占比
	@Override
	public List<Teachertype> teachertypeForList() {
		// TODO Auto-generated method stub
		return teacherDao.teachertypeForList();
	}
	
	//2、最受教职工欢迎的场所，SHMC（top8）
	@Override
	public List<Teacherplace> teacherplaceForList() {
		// TODO Auto-generated method stub
		return teacherDao.teacherplaceForList();
	}
	
	//3、2019年，教职工的月均消费
	@Override
	public List<Teachercost> teachercostForList() {
		// TODO Auto-generated method stub
		return teacherDao.teachercostForList();
	}
	
	//4、老师年消费总额、年均消费
	@Override
	public List<Teacheryearcost> teacheryearcostForList() {
		// TODO Auto-generated method stub
		return teacherDao.teacheryearcostForList();
	}
	
	//5、近几年老师在交通消费类型方面的趋势
	@Override
	public List<Teachertraffic> teachertrafficForList() {
		// TODO Auto-generated method stub
		return teacherDao.teachertrafficForList();
	}
	
}
