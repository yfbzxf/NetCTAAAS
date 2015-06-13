package com.ct.entity;
/**报表中各个服务器各资费使用情况*/
public class ReportCostUsed {
	private String host;
	private Integer monthlycount;
	private Integer packagecount;
	private Integer timebasedcount;
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public Integer getMonthlycount() {
		return monthlycount;
	}
	public void setMonthlycount(Integer monthlycount) {
		this.monthlycount = monthlycount;
	}
	public Integer getPackagecount() {
		return packagecount;
	}
	public void setPackagecount(Integer packagecount) {
		this.packagecount = packagecount;
	}
	public Integer getTimebasedcount() {
		return timebasedcount;
	}
	public void setTimebasedcount(Integer timebasedcount) {
		this.timebasedcount = timebasedcount;
	}
	
	
}
