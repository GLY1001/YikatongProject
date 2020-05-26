package com.win.po;

import org.apache.ibatis.type.IntegerTypeHandler;

public class Studentnewcost {
	private String month;
	private String sum_cost;
	private Float avg_cost;
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getSum_cost() {
		return sum_cost;
	}
	public void setSum_cost(String sum_cost) {
		this.sum_cost = sum_cost;
	}
	public Float getAvg_cost() {
		return avg_cost;
	}
	public void setAvg_cost(Float avg_cost) {
		this.avg_cost = avg_cost;
	}
	
}
