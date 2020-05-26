package com.win.service;

import java.util.List;

import com.win.po.Teachercost;
import com.win.po.Teacherplace;
import com.win.po.Teachertraffic;
import com.win.po.Teachertype;
import com.win.po.Teacheryearcost;
/*
 * 教师分析
 */
public interface TeacherService {
	public List<Teachertype> teachertypeForList(); //1、消费类别XFLB占比（饼图）
	
	public List<Teacherplace> teacherplaceForList(); //2、最受教职工欢迎的场所，SHMC（top8）
	
	public List<Teachercost> teachercostForList(); //3. 2019年，教职工的月均消费
	
	public List<Teacheryearcost> teacheryearcostForList(); //4、老师年消费总额、年均消费
	
	public List<Teachertraffic> teachertrafficForList(); //5、近几年老师在交通消费类型方面的趋势
}
