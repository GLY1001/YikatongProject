package com.win.dao;

import java.util.List;

import com.win.po.Studentavgcost;
import com.win.po.Studentcost;
import com.win.po.Studentnet;
import com.win.po.Studentnewcost;
import com.win.po.Studentst;
import com.win.po.Studenttype;

public interface StudentDao {
	public List<Studentnet> studentnetForList(); //1.不同年级学生用网情况（XTMC=软网关）
	
	//2.不同年级学生的平均消费水平(jyje)
	public List<Studentcost> studentcostForList();
	
	//3.不同年级学生消费类别（XFLB）占比
	public List<Studenttype> gradeForList(); //grade
	public List<Studenttype> xflbForList(); //xflb
	public List<Studenttype> gradeSixForList(); //2016
	public List<Studenttype> gradeSevenForList(); //2017
	public List<Studenttype> gradeEightForList(); //2018
	public List<Studenttype> gradeNineForList(); //2019

	
	//南海一饭堂,南海实训饭堂，不同年级的消费占比
	public List<Studentst> studentoneForList(); //南海一饭堂
	public List<Studentst> studenttwoForList(); //南海二饭堂
	
	//6.低于平均消费水平的学生之中不同年级之间的占比
	public List<Studentavgcost> studentavgcostForList();
	
	//7.学生近几年的消费情况
	public List<Studentnewcost> yearcostForList();
	//8. 2019年的月总额和月均消费情
	public List<Studentnewcost> monthcostForList();
}
