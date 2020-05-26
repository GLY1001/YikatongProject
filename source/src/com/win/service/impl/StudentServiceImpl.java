package com.win.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.win.dao.StudentDao;
import com.win.po.Studentavgcost;
import com.win.po.Studentcost;
import com.win.po.Studentnet;
import com.win.po.Studentnewcost;
import com.win.po.Studentst;
import com.win.po.Studenttype;
import com.win.service.StudentService;
/*
 * 学生分析页
 */
@Service("studentnetService")
@Transactional
public class StudentServiceImpl implements StudentService{
	@Autowired
	private StudentDao studentDao;
	
	//1.不同年级学生用网情况（XTMC=软网关）
	@Override
	public List<Studentnet> studentnetForList() {
		// TODO Auto-generated method stub
		return studentDao.studentnetForList();
	}
	
	//2.不同年级学生的平均消费水平(jyje)
	@Override
	public List<Studentcost> studentcostForList() {
		// TODO Auto-generated method stub
		return studentDao.studentcostForList();
	}
	
	//3.不同年级学生消费类别（XFLB）占比
	//grade
	public List<Studenttype> gradeForList() {
		// TODO Auto-generated method stub
		return studentDao.gradeForList();
	}
	//xflb
	public List<Studenttype> xflbForList() {
		// TODO Auto-generated method stub
		return studentDao.xflbForList();
	}
	//2016
	public List<Studenttype> gradeSixForList() {
		// TODO Auto-generated method stub
		return studentDao.gradeSixForList();
	}
	//2017
	public List<Studenttype> gradeSevenForList() {
		// TODO Auto-generated method stub
		return studentDao.gradeSevenForList();
	}
	//2018
	public List<Studenttype> gradeEightForList() {
		// TODO Auto-generated method stub
		return studentDao.gradeEightForList();
	}
	//2019
	public List<Studenttype> gradeNineForList() {
		// TODO Auto-generated method stub
		return studentDao.gradeNineForList();
	}
	
	//4.南海一饭饭堂、5.南海实训饭堂，不同年级的消费占比	
	@Override
	public List<Studentst> studentoneForList() {
		// TODO Auto-generated method stub
		return studentDao.studentoneForList();
	}
	@Override
	public List<Studentst> studenttwoForList() {
		// TODO Auto-generated method stub
		return studentDao.studenttwoForList();
	}
	
	//6.低于平均消费水平的学生之中不同年级之间的占比
	@Override
	public List<Studentavgcost> studentavgcostForList() {
		// TODO Auto-generated method stub
		return studentDao.studentavgcostForList();
	}
	
	//7.学生近几年的消费情况
	@Override
	public List<Studentnewcost> yearcostForList() {
		// TODO Auto-generated method stub
		return studentDao.yearcostForList();
	}
	//8. 2019年的月总额和月均消费情况
	@Override
	public List<Studentnewcost> monthcostForList() {
		// TODO Auto-generated method stub
		return studentDao.monthcostForList();
	}
	
}
